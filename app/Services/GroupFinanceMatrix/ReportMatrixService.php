<?php

namespace App\Services\GroupFinanceMatrix;

use App\Models\EntityItem;
use App\Models\DeliverableTemplate;
use App\Models\EntityMappingAttachment;
use App\Models\EntityPeriod;
use App\Models\EntityPeriodMapping;
use App\Models\EntityReportingMatrix;
use Carbon\Carbon;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\DB;

class ReportMatrixService
{
    public function resolveMonth(?string $period, int $year): string
    {
        if ($period === 'June' || $period === 'half_year') {
            return 'June';
        }

        if ($period === 'December' || $period === 'year_end') {
            return 'December';
        }

        return 'June';
    }

    public function getFilterOptions(int $year, string $month): array
    {
        $periodId = EntityPeriod::query()
            ->where('reporting_year', $year)
            ->where('reporting_month', $month)
            ->value('id');

        if (!$periodId) {
            return [
                'entities' => [],
                'entity_sizes' => [],
                'deliverables' => [],
                'assigned_to_list' => [],
            ];
        }

        $entities = EntityPeriodMapping::query()
            ->where('period_id', $periodId)
            ->where('is_deleted', false)
            ->orderBy('entity_name')
            ->get(['entity_id', 'entity_name']);

        $entitySizes = EntityPeriodMapping::query()
            ->where('period_id', $periodId)
            ->where('is_deleted', false)
            ->whereNotNull('category_name')
            ->distinct()
            ->pluck('category_name')
            ->values()
            ->all();

        $deliverables = EntityItem::query()
            ->orderBy('display_order')
            ->get(['id', 'title', 'short_name']);

        $assignedTo = EntityPeriodMapping::query()
            ->where('period_id', $periodId)
            ->where('is_deleted', false)
            ->whereNotNull('assigned_to')
            ->distinct()
            ->pluck('assigned_to')
            ->values()
            ->all();

        return [
            'entities' => $entities,
            'entity_sizes' => $entitySizes,
            'deliverables' => $deliverables,
            'assigned_to_list' => $assignedTo,
        ];
    }

    public function getRows(array $filters, int $perPage = 50): LengthAwarePaginator
    {
        return $this->buildQuery($filters)->paginate($perPage)->withQueryString();
    }

    public function getRowsCollection(array $filters): Collection
    {
        return $this->buildQuery($filters)->get();
    }

    private function buildQuery(array $filters)
    {
        $defaults = EntityPeriod::currentYearMonth();
        $year = isset($filters['year']) ? (int)$filters['year'] : $defaults['year'];
        if (($filters['period'] ?? null) === null || $filters['period'] === '') {
            $month = $defaults['month'];
        } else {
            $month = $this->resolveMonth($filters['period'], $year);
        }

        $periodId = EntityPeriod::query()
            ->where('reporting_year', $year)
            ->where('reporting_month', $month)
            ->value('id');

        $assignedToFilter = $filters['assigned_to'] ?? null;

        $query = EntityReportingMatrix::query()
            ->from('entity_reporting_matrix as m')
            ->join('entity_period_mapping as epm', function ($join) use ($periodId) {
                $join->on('epm.entity_id', '=', 'm.entity_id');
                if ($periodId) {
                    $join->where('epm.period_id', '=', $periodId);
                }
            })
            ->join('entity_item as it', 'it.id', '=', 'm.item_id')
            ->where('m.reporting_year', $year)
            ->where('m.reporting_month', $month)
            ->where('m.is_deleted', false)
            ->select([
                'm.id',
                'm.entity_id',
                'm.item_id',
                'it.title as deliverable_title',
                'it.short_name as deliverable_short_name',
                'epm.id as entity_mapping_id',
                'epm.entity_name as entity_name',
                'epm.category_name as entity_size',
                'epm.assigned_to as assigned_to',
                'm.deadline_date',
                'm.submission_date',
                'm.reviewed_date',
                'm.completed_date',
            ])
            ->orderBy('m.id', 'desc');

        if (!empty($filters['entity_id'])) {
            $query->where('m.entity_id', (int)$filters['entity_id']);
        }

        if (!empty($filters['deliverable_id'])) {
            $query->where('m.item_id', (int)$filters['deliverable_id']);
        }

        if (!empty($filters['entity_size'])) {
            $query->where('epm.category_name', $filters['entity_size']);
        }

        if (!empty($assignedToFilter)) {
            $query->where('epm.assigned_to', $assignedToFilter);
        }

        return $query;
    }

    public function computeStatus(Carbon $today, ?string $deadlineDate, ?string $submissionDate): array
    {
        if (!$deadlineDate) {
            return ['label' => 'N/A', 'class' => 'bg-secondary'];
        }

        $deadline = Carbon::parse($deadlineDate)->startOfDay();
        $submission = $submissionDate ? Carbon::parse($submissionDate)->startOfDay() : null;

        if ($submission) {
            if ($submission->equalTo($deadline)) {
                return ['label' => 'On Time', 'class' => 'bg-success'];
            }

            if ($submission->lessThan($deadline)) {
                return ['label' => 'Before Time', 'class' => 'bg-success text-dark'];
            }

            $days = $submission->diffInDays($deadline);
            return ['label' => 'Delayed by ' . $days . ' day(s)', 'class' => 'bg-warning text-dark'];
        }

        if ($deadline->equalTo($today)) {
            return ['label' => 'DUE TODAY', 'class' => 'bg-primary'];
        }

        if ($deadline->lessThan($today)) {
            $days = $today->diffInDays($deadline);
            return ['label' => 'Overdue by ' . $days . ' day(s)', 'class' => 'bg-danger'];
        }

        return ['label' => 'N/A', 'class' => 'bg-secondary'];
    }

    public function getToday(): Carbon
    {
        return Carbon::now()->startOfDay();
    }

    public function updateMatrixDate(int $rowId, string $field, ?string $date, int $adminId): bool
    {
        $allowedFields = ['submission_date', 'reviewed_date', 'completed_date'];

        if (!in_array($field, $allowedFields, true)) {
            return false;
        }

        $dateValue = $date ? Carbon::parse($date)->toDateString() : null;

        return (bool)DB::table('entity_reporting_matrix')
            ->where('id', $rowId)
            ->where('is_deleted', false)
            ->update([
                $field => $dateValue,
                'updated_by' => $adminId,
                'updated_at' => now(),
            ]);
    }

    public function enrichRowsWithTemplateAndAttachmentCount(Collection $rows, array $filters): Collection
    {
        if ($rows->isEmpty()) {
            return $rows;
        }

        $defaults = EntityPeriod::currentYearMonth();
        $year = isset($filters['year']) ? (int)$filters['year'] : $defaults['year'];
        if (($filters['period'] ?? null) === null || $filters['period'] === '') {
            $month = $defaults['month'];
        } else {
            $month = $this->resolveMonth($filters['period'], $year);
        }
        $periodId = EntityPeriod::query()
            ->where('reporting_year', $year)
            ->where('reporting_month', $month)
            ->value('id');

        $itemIds = $rows->pluck('item_id')->unique()->values()->all();
        $mappingIds = $rows->pluck('entity_mapping_id')->unique()->filter()->values()->all();

        $templateByItem = DeliverableTemplate::query()
            ->whereIn('deliverable_id', $itemIds)
            ->where('template_year', $year)
            ->where('template_period', $month)
            ->where('is_deleted', false)
            ->orderBy('display_order')
            ->get(['deliverable_id', 'template_name'])
            ->groupBy('deliverable_id')
            ->map(function ($group) {
                return $group->first()->template_name ?? 'N/A';
            });

        $attachmentCounts = EntityMappingAttachment::query()
            ->whereIn('entity_mapping_id', $mappingIds)
            ->when($periodId, function ($q) use ($periodId) {
                $q->where('period_id', $periodId);
            })
            ->get(['entity_mapping_id'])
            ->groupBy('entity_mapping_id')
            ->map(fn ($g) => $g->count());

        return $rows->map(function ($row) use ($templateByItem, $attachmentCounts) {
            $row->template_name = $templateByItem[$row->item_id] ?? 'N/A';
            $row->attachment_count = $attachmentCounts[$row->entity_mapping_id] ?? 0;
            return $row;
        });
    }
}

