<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\EntityItem;
use App\Models\EntityPeriod;
use App\Models\EntityPeriodMapping;
use App\Models\EntityReportingMatrix;
use App\Models\Entity;
use App\Models\Audit;
use Illuminate\Http\Request;
use Carbon\Carbon;

class AdminDashboardController extends Controller
{
    private const MONTHS = ['June', 'December'];

    private const SIZES = ['Small', 'Medium', 'Large'];

    public function groupReporting(Request $request)
    {
        $def = EntityPeriod::currentYearMonth();
        $year = (int) $request->input('year', $def['year']);
        $year = max(2024, min(2028, $year));

        $month = $request->input('month', $def['month']);
        if (!in_array($month, self::MONTHS, true)) {
            $month = in_array($def['month'], self::MONTHS, true) ? $def['month'] : 'June';
        }

        $entityId = $request->input('entity_id');
        $entityId = ($entityId !== null && $entityId !== '') ? (int) $entityId : null;
        if ($entityId !== null && !Entity::query()->whereKey($entityId)->exists()) {
            $entityId = null;
        }

        $itemId = $request->input('item_id');
        $itemId = ($itemId !== null && $itemId !== '') ? (int) $itemId : null;
        if ($itemId !== null && !EntityItem::query()->whereKey($itemId)->exists()) {
            $itemId = null;
        }

        $size = $request->input('size');
        $size = in_array($size, self::SIZES, true) ? $size : null;

        $today = Carbon::now();

        $itemsQuery = EntityItem::query()->orderBy('display_order');
        if ($itemId) {
            $itemsQuery->where('id', $itemId);
        }
        $items = $itemsQuery->get(['id', 'title', 'short_name']);

        $matrixQuery = EntityReportingMatrix::query()
            ->where('reporting_year', $year)
            ->where('reporting_month', $month)
            ->where('is_deleted', false);

        if ($entityId) {
            $matrixQuery->where('entity_id', $entityId);
        }

        if ($size) {
            $entityIdsForSize = EntityPeriodMapping::query()
                ->where('is_deleted', false)
                ->where('category_name', $size)
                ->pluck('entity_id');
            $matrixQuery->whereIn('entity_id', $entityIdsForSize);
        }

        $matrixRows = $matrixQuery->get(['item_id', 'deadline_date', 'submission_date']);

        $countsByItemId = [];
        foreach ($matrixRows as $record) {
            $iid = (int) $record->item_id;
            if (!isset($countsByItemId[$iid])) {
                $countsByItemId[$iid] = [
                    'on_time' => 0,
                    'before_time' => 0,
                    'due_today' => 0,
                    'not_due' => 0,
                    'delayed' => 0,
                    'overdue' => 0,
                ];
            }

            $deadline = Carbon::parse($record->deadline_date)->startOfDay();
            $submission = $record->submission_date ? Carbon::parse($record->submission_date)->startOfDay() : null;

            if ($submission) {
                if ($submission->gt($deadline)) {
                    $countsByItemId[$iid]['delayed']++;
                } elseif ($submission->eq($deadline)) {
                    $countsByItemId[$iid]['on_time']++;
                } else {
                    $countsByItemId[$iid]['before_time']++;
                }
            } else {
                $inDays = $deadline->diffInDays($today->copy()->startOfDay(), false);

                if ($inDays < 0) {
                    $countsByItemId[$iid]['not_due']++;
                } elseif ($inDays === 0) {
                    $countsByItemId[$iid]['due_today']++;
                } else {
                    $countsByItemId[$iid]['overdue']++;
                }
            }
        }

        $chartCards = [];
        foreach ($items as $item) {
            $c = $countsByItemId[$item->id] ?? [
                'on_time' => 0,
                'before_time' => 0,
                'due_today' => 0,
                'not_due' => 0,
                'delayed' => 0,
                'overdue' => 0,
            ];
            $success = (int) $c['on_time'] + (int) $c['before_time'];
            $chartCards[] = [
                'label' => $item->title . ' (' . $item->short_name . ')',
                'short_name' => $item->short_name,
                'counts' => [
                    $success,
                    $c['due_today'],
                    $c['not_due'],
                    $c['delayed'],
                    $c['overdue'],
                ],
            ];
        }

        $entityOptions = EntityPeriodMapping::query()
            ->where('is_deleted', false)
            ->orderBy('entity_name')
            ->get(['entity_id', 'entity_name'])
            ->unique('entity_id')
            ->map(fn ($row) => [
                'entity_id' => (int) $row->entity_id,
                'entity_name' => (string) $row->entity_name,
            ])
            ->values();

        if ($entityOptions->isEmpty()) {
            $entityOptions = Entity::query()
                ->orderBy('entity_short_code')
                ->get(['id', 'entity_short_code'])
                ->map(fn ($e) => [
                    'entity_id' => (int) $e->id,
                    'entity_name' => (string) ($e->entity_short_code ?: ('Entity ' . $e->id)),
                ])
                ->values();
        }

        $deliverableItems = EntityItem::query()
            ->orderBy('display_order')
            ->get(['id', 'title', 'short_name']);

        return view('dashboard.group_reporting', [
            'title' => 'Group Reporting',
            'chartCards' => $chartCards,
            'currentYear' => $year,
            'currentMonth' => $month,
            'currentEntityId' => $entityId,
            'currentItemId' => $itemId,
            'currentSize' => $size,
            'entityOptions' => $entityOptions,
            'deliverableItems' => $deliverableItems,
        ]);
    }

    public function timelineView(Request $request)
    {
        $today = Carbon::now()->startOfDay();
        $ym = EntityPeriod::currentYearMonth();
        $year = $ym['year'];
        $month = $ym['month'];

        $rows = EntityReportingMatrix::query()
            ->from('entity_reporting_matrix as m')
            ->join('entity_period_mapping as epm', 'epm.entity_id', '=', 'm.entity_id')
            ->join('entity_item as i', 'i.id', '=', 'm.item_id')
            ->where('m.reporting_year', $year)
            ->where('m.reporting_month', $month)
            ->orderBy('m.deadline_date')
            ->limit(200)
            ->get([
                'm.id',
                'epm.entity_name',
                'i.title as item_title',
                'm.deadline_date',
                'm.submission_date',
                'm.reviewed_date',
                'm.completed_date',
            ]);

        return view('dashboard.timeline_view', [
            'title' => 'Timeline View',
            'today' => $today,
            'rows' => $rows,
        ]);
    }

    public function financeStatistics(Request $request)
    {
        $ym = EntityPeriod::currentYearMonth();
        $year = $ym['year'];
        $month = $ym['month'];

        $entities = EntityPeriodMapping::query()
            ->from('entity_period_mapping as epm')
            ->join('countries as c', 'c.id', '=', 'epm.country_of_incorporation')
            ->join('entity_periods as p', 'p.id', '=', 'epm.period_id')
            ->where('p.reporting_year', $year)
            ->where('p.reporting_month', $month)
            ->where('epm.is_deleted', false)
            ->get([
                'epm.company_status',
                'c.country_name',
                'epm.general_share_capital as share_capital',
                'epm.general_numbers_of_shares as number_of_shares',
            ]);

        $byStatus = [];
        $byCountry = [];
        $totalCapital = 0;
        $totalShares = 0;

        foreach ($entities as $e) {
            $status = $e->company_status ?: 'Unknown';
            $country = $e->country_name ?: 'Unknown';
            $capital = (float) $e->share_capital;
            $shares = (int) $e->number_of_shares;

            $byStatus[$status] = ($byStatus[$status] ?? 0) + 1;
            $byCountry[$country] = ($byCountry[$country] ?? 0) + 1;
            $totalCapital += $capital;
            $totalShares += $shares;
        }

        ksort($byStatus);
        ksort($byCountry);

        return view('dashboard.finance_statistics', [
            'title' => 'Finance Statistics',
            'byStatus' => $byStatus,
            'byCountry' => $byCountry,
            'totalCapital' => $totalCapital,
            'totalShares' => $totalShares,
        ]);
    }

    public function auditTrail(Request $request)
    {
        $rows = Audit::query()
            ->orderByDesc('created_at')
            ->limit(1000)
            ->get();

        return view('dashboard.audit_trail', [
            'title' => 'Audit Trail',
            'rows' => $rows,
        ]);
    }
}
