<?php

namespace App\Http\Controllers\GroupFinanceMatrix;

use App\Http\Controllers\Controller;
use App\Http\Requests\GroupFinanceMatrix\EntityAttachmentUploadRequest;
use App\Http\Requests\GroupFinanceMatrix\EntityListFilterRequest;
use App\Http\Requests\GroupFinanceMatrix\EntityUpsertRequest;
use App\Models\EntityPeriod;
use App\Services\GroupFinanceMatrix\EntityManagementService;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Throwable;

class GroupStructurePortalController extends Controller
{
    public function indexOrStore(Request $request, EntityManagementService $service)
    {
        $adminId = $request->session()->get('admin_id');
        if (! $adminId) {
            return redirect()->route('login');
        }

        if ($request->isMethod('post')) {
            $roleNames = $request->session()->get('admin_role_names', []);
            $canEdit = in_array('Super Admin', $roleNames, true) || in_array('Finance Admin', $roleNames, true) || in_array('Entity Manager', $roleNames, true);
            if (! $canEdit) {
                abort(403);
            }

            $rules = (new EntityUpsertRequest)->rules();
            $validator = Validator::make($request->all(), $rules);

            if ($validator->fails()) {
                return back()->withErrors($validator)->withInput();
            }

            $data = $validator->validated();

            $action = $data['action'];

            if (($action === 'update' || $action === 'delete') && empty($data['mapping_id'])) {
                return back()->withErrors(['mapping_id' => 'Mapping is required for this action.'])->withInput();
            }

            if ($action === 'create') {
                $service->createEntity($data, (int) $adminId);

                return redirect()->route('group_finance.legal_entity_management', [
                    'year' => $data['year'],
                    'period' => $data['period'],
                ])->with('success', 'Entity created successfully.');
            }

            if ($action === 'update') {
                $service->updateEntity((int) $data['mapping_id'], $data, (int) $adminId);

                return redirect()->route('group_finance.legal_entity_management', [
                    'year' => $data['year'],
                    'period' => $data['period'],
                ])->with('success', 'Entity updated successfully.');
            }

            $service->deleteEntity((int) $data['mapping_id'], (int) $adminId);

            return redirect()->route('group_finance.legal_entity_management', [
                'year' => $data['year'],
                'period' => $data['period'],
            ])->with('success', 'Entity deleted successfully.');
        }

        $rules = (new EntityListFilterRequest)->rules();
        $listValidator = Validator::make($request->all(), $rules);
        $listValidator->validate();

        $validated = $listValidator->validated();

        $defaults = EntityPeriod::currentYearMonth();
        $year = isset($validated['year']) ? (int) $validated['year'] : (int) $defaults['year'];
        $year = max(2024, min(2028, $year));
        $period = isset($validated['period']) ? (string) $validated['period'] : (string) $defaults['month'];
        if ($period === 'half_year') {
            $period = 'June';
        } elseif ($period === 'year_end') {
            $period = 'December';
        }
        if (! in_array($period, ['June', 'December'], true)) {
            $period = in_array($defaults['month'], ['June', 'December'], true) ? $defaults['month'] : 'June';
        }
        $groupParent = isset($validated['group_parent']) ? (int) $validated['group_parent'] : null;

        $month = $service->resolveMonth($period);
        $periodId = EntityPeriod::query()
            ->where('reporting_year', $year)
            ->where('reporting_month', $month)
            ->value('id');

        $groupStructureOptions = $periodId ? $service->getGroupStructureOptions((int) $periodId) : collect();
        $countries = $service->getCountries();

        $mappingId = $request->query('edit_mapping_id');
        $editRow = null;
        $openOffcanvas = false;
        $actionMode = null;
        if ($request->query('create') == '1') {
            $openOffcanvas = true;
            $actionMode = 'create';
        }

        if ($mappingId) {
            $editRow = $service->getEntityForEdit((int) $mappingId);
            $openOffcanvas = true;
            $actionMode = 'update';
        }

        $rows = $service->getEntities($year, $period, $groupParent, 50);

        return view('group_finance.legal_entity_management', [
            'title' => 'Legal Entity Management',
            'rows' => $rows,
            'year' => $year,
            'period' => $period,
            'groupParent' => $groupParent,
            'countries' => $countries,
            'groupStructureOptions' => $groupStructureOptions,
            'openOffcanvas' => $openOffcanvas,
            'actionMode' => $actionMode,
            'editRow' => $editRow,
        ]);
    }

    public function detail(int $mappingId, EntityManagementService $service)
    {
        $detail = $service->getEntityDetail($mappingId);
        if (! $detail) {
            abort(404);
        }

        return view('group_finance.entity_detail', [
            'title' => 'Entity Detail View',
            'detail' => $detail['entity'],
            'attachments' => $detail['attachments'],
        ]);
    }

    public function graph(Request $request, int $mappingId, EntityManagementService $service)
    {
        $nodes = $service->getOwnershipNodes($mappingId);
        if (empty($nodes)) {
            abort(404);
        }

        $defaultFocusEntityId = null;
        $focusQuery = $request->query('focus');
        if ($focusQuery !== null && $focusQuery !== '') {
            $wanted = (int) $focusQuery;
            foreach ($nodes as $n) {
                if ((int) ($n['id'] ?? 0) === $wanted) {
                    $defaultFocusEntityId = $wanted;
                    break;
                }
            }
        }
        if ($defaultFocusEntityId === null) {
            foreach ($nodes as $n) {
                if ((int) ($n['mapping_id'] ?? 0) === $mappingId) {
                    $defaultFocusEntityId = (int) $n['id'];
                    break;
                }
            }
        }
        if ($defaultFocusEntityId === null) {
            $defaultFocusEntityId = (int) ($nodes[0]['id'] ?? 0);
        }

        return view('group_finance.entity_graph', [
            'title' => 'Entity Ownership Graph',
            'nodes' => $nodes,
            'selectedMappingId' => $mappingId,
            'defaultFocusEntityId' => $defaultFocusEntityId,
        ]);
    }

    public function graphPdf(int $mappingId, EntityManagementService $service)
    {
        $nodes = $service->getOwnershipNodes($mappingId);
        if (empty($nodes)) {
            abort(404);
        }

        $pdf = Pdf::loadView('pdf.entity_graph', [
            'nodes' => $nodes,
            'selectedMappingId' => $mappingId,
        ]);

        return $pdf->download('entity-ownership-graph.pdf');
    }

    public function uploadAttachment(int $mappingId, EntityAttachmentUploadRequest $request, EntityManagementService $service)
    {
        try {
            $adminId = (int) $request->session()->get('admin_id', 0);
            if ($adminId < 1) {
                return redirect()->route('login')->with('error', 'Session expired.');
            }

            $roleNames = $request->session()->get('admin_role_names', []);
            $canEdit = in_array('Super Admin', $roleNames, true) || in_array('Finance Admin', $roleNames, true) || in_array('Entity Manager', $roleNames, true);
            if (! $canEdit) {
                abort(403);
            }

            $data = $request->validated();
            $file = $request->file('attachment_file');
            $ok = $service->uploadEntityAttachment($mappingId, $data, $file, $adminId);

            if (! $ok) {
                return back()
                    ->withInput()
                    ->with('error', 'The file could not be saved. Confirm the entity mapping and storage, then try again.');
            }

            return redirect()->route('group_finance.legal_entity_management.detail', ['mappingId' => $mappingId])->with('success', 'File uploaded successfully.');
        } catch (Throwable $e) {
            report($e);

            return back()
                ->withInput()
                ->with('error', 'Something went wrong while uploading. Check file type and size, then try again.');
        }
    }

    public function deleteAttachment(int $mappingId, int $attachmentId, EntityManagementService $service, Request $request)
    {
        try {
            $adminId = (int) $request->session()->get('admin_id', 0);
            if ($adminId < 1) {
                return redirect()->route('login')->with('error', 'Session expired.');
            }

            $roleNames = $request->session()->get('admin_role_names', []);
            $canEdit = in_array('Super Admin', $roleNames, true) || in_array('Finance Admin', $roleNames, true) || in_array('Entity Manager', $roleNames, true);
            if (! $canEdit) {
                abort(403);
            }

            $ok = $service->deleteEntityAttachment($mappingId, $attachmentId, $adminId);

            if (! $ok) {
                return back()->with('error', 'Delete failed.');
            }

            return redirect()->route('group_finance.legal_entity_management.detail', ['mappingId' => $mappingId])->with('success', 'Attachment deleted successfully.');
        } catch (Throwable $e) {
            return back()->with('error', 'Delete failed.');
        }
    }
}
