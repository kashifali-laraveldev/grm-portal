<?php

namespace App\Http\Controllers\GroupFinanceMatrix;

use App\Http\Controllers\Controller;
use App\Http\Requests\GroupFinanceMatrix\ReportMatrixFilterRequest;
use App\Http\Requests\GroupFinanceMatrix\ReportMatrixDateUpdateRequest;
use App\Models\EntityPeriod;
use App\Services\GroupFinanceMatrix\ReportMatrixService;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Http\Request;
use Maatwebsite\Excel\Facades\Excel;
use App\Exports\ReportMatrixExport;
use App\Services\GroupFinanceMatrix\EntityManagementService;
use Throwable;

class DeliverablesSubmissionPortalController extends Controller
{
    public function reportMatrix(ReportMatrixFilterRequest $request, ReportMatrixService $service)
    {
        $filters = $request->validated();
        $def = EntityPeriod::currentYearMonth();
        $year = isset($filters['year']) ? (int) $filters['year'] : (int) $def['year'];
        $year = max(2024, min(2028, $year));
        $filters['year'] = $year;
        if (($filters['period'] ?? null) === null || $filters['period'] === '') {
            $month = $def['month'];
        } else {
            $month = $service->resolveMonth($filters['period'], $year);
        }

        $options = $service->getFilterOptions($year, $month);

        $export = $filters['export'] ?? null;

        if ($export === 'excel') {
            $rows = $service->getRowsCollection($filters);
            $rows = $this->applyStatus($service, $rows);
            $rows = $service->enrichRowsWithTemplateAndAttachmentCount($rows, $filters);

            return Excel::download(new ReportMatrixExport($rows), 'report-matrix.xlsx');
        }

        if ($export === 'pdf') {
            $rows = $service->getRowsCollection($filters);
            $rows = $this->applyStatus($service, $rows);
            $rows = $service->enrichRowsWithTemplateAndAttachmentCount($rows, $filters);

            $pdf = Pdf::loadView('pdf.report_matrix', [
                'rows' => $rows,
                'filters' => $filters,
                'year' => $year,
                'month' => $month,
            ]);

            return $pdf->download('report-matrix.pdf');
        }

        $rows = $service->getRows($filters, 50);
        $collection = $rows->getCollection()->map(function ($row) use ($service) {
            $status = $service->computeStatus($service->getToday(), $row->deadline_date, $row->submission_date);
            $row->status_label = $status['label'];
            $row->status_class = $status['class'];

            return $row;
        });
        $collection = $service->enrichRowsWithTemplateAndAttachmentCount($collection, $filters);
        $rows->setCollection($collection);

        return view('group_finance.report_matrix', [
            'title' => 'Report Matrix',
            'rows' => $rows,
            'options' => $options,
            'filters' => $filters,
            'year' => $year,
            'month' => $month,
        ]);
    }

    private function applyStatus(ReportMatrixService $service, $rows)
    {
        $today = $service->getToday();

        return $rows->map(function ($row) use ($service, $today) {
            $status = $service->computeStatus($today, $row->deadline_date, $row->submission_date);
            $row->status_label = $status['label'];
            $row->status_class = $status['class'];

            return $row;
        });
    }

    public function updateDate(ReportMatrixDateUpdateRequest $request, ReportMatrixService $service)
    {
        try {
            $adminId = (int)$request->session()->get('admin_id', 0);
            if ($adminId < 1) {
                return redirect()->route('login')->with('error', 'Session expired.');
            }

            $roleNames = $request->session()->get('admin_role_names', []);
            $canEdit = in_array('Super Admin', $roleNames, true) || in_array('Finance Admin', $roleNames, true);

            if (!$canEdit) {
                abort(403);
            }

            $data = $request->validated();

            $ok = $service->updateMatrixDate(
                (int)$data['row_id'],
                (string)$data['field'],
                $data['date'] ?? null,
                $adminId
            );

            if (!$ok) {
                return back()->with('error', 'Unable to update date.');
            }

            return back()->with('success', 'Date updated successfully.');
        } catch (Throwable $e) {
            return back()->with('error', 'Date update failed.');
        }
    }

    public function mappingAttachmentsJson(Request $request, EntityManagementService $entityService)
    {
        $mappingId = (int) $request->query('mapping_id', 0);
        if ($mappingId < 1) {
            return response()->json(['ok' => false, 'message' => 'Invalid mapping.'], 422);
        }

        $detail = $entityService->getEntityDetail($mappingId);
        if (!$detail) {
            return response()->json(['ok' => false, 'message' => 'Entity not found.'], 404);
        }

        $entity = $detail['entity'];
        $attachments = $detail['attachments']->map(function ($a) {
            $path = $a->attachment_path ?? '';

            return [
                'id' => (int) $a->id,
                'filename' => (string) ($a->filename ?? $a->actual_filename ?? 'File'),
                'type' => (string) ($a->type ?? ''),
                'expiry_date' => $a->expiry_date,
                'download_url' => $path !== '' ? asset('storage/' . ltrim($path, '/')) : null,
            ];
        })->values();

        return response()->json([
            'ok' => true,
            'entity_name' => (string) ($entity['entity_name'] ?? ''),
            'mapping_id' => $mappingId,
            'attachments' => $attachments,
            'detail_url' => route('group_finance.legal_entity_management.detail', ['mappingId' => $mappingId]),
        ]);
    }
}

