<?php

namespace Database\Seeders;

use App\Models\EntityItem;
use App\Models\EntityPeriod;
use App\Models\Entity;
use App\Models\EntityReportingMatrix;
use Carbon\Carbon;
use Illuminate\Database\Seeder;

class ReportingMatrixSeeder extends Seeder
{
    /**
     * Seeds matrix rows for several year/month combinations so dashboard filters
     * produce visibly different chart distributions, including a strong SUCCESS slice
     * (on-time + submitted before deadline).
     */
    public function run(): void
    {
        EntityReportingMatrix::query()->delete();

        $items = EntityItem::query()->orderBy('display_order')->get();
        $entities = Entity::query()->orderBy('id')->get();

        if ($items->isEmpty() || $entities->isEmpty()) {
            return;
        }

        $periodsToSeed = [
            [2025, 'June'],
            [2025, 'December'],
            [2026, 'June'],
            [2026, 'Annual'],
        ];

        $today = Carbon::parse('2026-04-02')->startOfDay();
        $deadlineStart = Carbon::parse('2025-11-01');
        $deadlineEnd = Carbon::parse('2026-08-31');
        $overdueEnd = $today->copy()->subDay();

        foreach ($periodsToSeed as [$year, $month]) {
            $period = EntityPeriod::query()
                ->where('reporting_year', $year)
                ->where('reporting_month', $month)
                ->first();

            if (!$period) {
                continue;
            }

            foreach ($entities as $ent) {
                foreach ($items as $item) {
                    $bucket = $this->bucketFor($ent->id, $item->id, $year, $month);

                    $deadline = null;
                    $submission = null;
                    $reviewed = null;
                    $completed = null;

                    if ($bucket <= 35) {
                        // SUCCESS (on time): submitted on deadline day
                        $deadline = $this->randomDate($deadlineStart, $deadlineEnd, $ent->id, $item->id, 1);
                        $submission = $deadline->copy();
                    } elseif ($bucket <= 68) {
                        // SUCCESS (before time): submitted 1–14 days before deadline
                        $deadline = $this->randomDate(
                            $deadlineStart->copy()->addDays(14),
                            $deadlineEnd,
                            $ent->id,
                            $item->id,
                            2
                        );
                        $submission = $deadline->copy()->subDays(1 + ($bucket % 14));
                    } elseif ($bucket <= 82) {
                        // Delayed: submitted after deadline
                        $deadline = $this->randomDate($deadlineStart, $overdueEnd, $ent->id, $item->id, 3);
                        $submission = $deadline->copy()->addDays(2 + ($bucket % 12));
                    } elseif ($bucket <= 90) {
                        // No submission, deadline still in the future → not_due (inDays > 0 vs today)
                        $deadline = $this->randomDate($today->copy()->addDay(), $deadlineEnd, $ent->id, $item->id, 4);
                    } elseif ($bucket <= 96) {
                        // No submission, deadline today
                        $deadline = $today->copy();
                    } else {
                        // No submission, deadline in the past → overdue
                        $deadline = $this->randomDate($deadlineStart, $today->copy()->subDay(), $ent->id, $item->id, 5);
                    }

                    if ($submission) {
                        $reviewed = $submission->copy()->addDays($bucket % 10);
                        $completed = $reviewed->copy()->addDays($bucket % 12);
                    }

                    EntityReportingMatrix::create([
                        'entity_id' => $ent->id,
                        'item_id' => $item->id,
                        'reporting_year' => $year,
                        'reporting_month' => $month,
                        'deadline_date' => $deadline->toDateString(),
                        'submission_date' => $submission ? $submission->toDateString() : null,
                        'reviewed_date' => $reviewed ? $reviewed->toDateString() : null,
                        'completed_date' => $completed ? $completed->toDateString() : null,
                        'is_deleted' => false,
                        'created_by' => null,
                        'updated_by' => null,
                    ]);
                }
            }
        }
    }

    private function bucketFor(int $entityId, int $itemId, int $year, string $month): int
    {
        $m = match ($month) {
            'June' => 1,
            'December' => 2,
            'Annual' => 3,
            default => 0,
        };

        $h = crc32("{$entityId}|{$itemId}|{$year}|{$month}");
        $skew = ($entityId * 7 + $itemId * 13 + $year * 5 + $m * 17) % 41;

        return (($h % 100) + $skew) % 100 + 1;
    }

    private function randomDate(Carbon $start, Carbon $end, int $entityId, int $itemId, int $salt): Carbon
    {
        $startTs = $start->timestamp;
        $endTs = $end->timestamp;
        if ($endTs < $startTs) {
            return $start->copy();
        }
        $span = $endTs - $startTs;
        $offset = (int) ((crc32("{$entityId}|{$itemId}|{$salt}") % ($span + 1)));

        return Carbon::createFromTimestamp($startTs + $offset)->startOfDay();
    }
}
