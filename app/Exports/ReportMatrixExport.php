<?php

namespace App\Exports;

use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;

class ReportMatrixExport implements FromCollection, WithHeadings
{
    public function __construct(private Collection $rows)
    {
    }

    public function headings(): array
    {
        return [
            '#',
            'Entity Name',
            'Submission Type',
            'Assigned To',
            'Deliverable',
            'Deadline',
            'Submission',
            'Reviewed',
            'Completed',
            'Attachments',
            'Template',
            'Status',
        ];
    }

    public function collection(): Collection
    {
        return $this->rows->map(function ($row) {
            return [
                $row->id,
                $row->entity_name,
                $row->deliverable_short_name,
                $row->assigned_to,
                $row->deliverable_title,
                $row->deadline_date,
                $row->submission_date,
                $row->reviewed_date,
                $row->completed_date,
                $row->attachment_count ?? 0,
                $row->template_name ?? 'N/A',
                $row->status_label ?? '',
            ];
        });
    }
}

