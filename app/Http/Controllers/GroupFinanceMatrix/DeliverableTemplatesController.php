<?php

namespace App\Http\Controllers\GroupFinanceMatrix;

use App\Http\Controllers\Controller;
use App\Models\DeliverableTemplate;
use App\Models\EntityItem;
use App\Models\EntityMappingAttachment;
use App\Models\EntityPeriod;
use App\Support\GrmUpload;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Throwable;

class DeliverableTemplatesController extends Controller
{
    public function index(Request $request)
    {
        $def = EntityPeriod::currentYearMonth();
        $templateYear = max(2024, min(2028, (int) $request->query('year', $def['year'])));
        $templatePeriod = (string) $request->query('period', $def['month']);
        if (! in_array($templatePeriod, ['June', 'December'], true)) {
            $templatePeriod = in_array($def['month'], ['June', 'December'], true) ? $def['month'] : 'June';
        }

        $templates = DeliverableTemplate::query()
            ->from('deliverable_templates as dt')
            ->join('entity_item as i', 'i.id', '=', 'dt.deliverable_id')
            ->where('dt.is_deleted', false)
            ->where('dt.template_year', $templateYear)
            ->where('dt.template_period', $templatePeriod)
            ->orderBy('dt.display_order')
            ->select([
                'dt.*',
                'i.title as deliverable_title',
                'i.short_name as deliverable_short_code',
            ])
            ->get();

        $periodId = EntityPeriod::query()
            ->where('reporting_year', $templateYear)
            ->where('reporting_month', $templatePeriod)
            ->value('id');

        $sampleAttachments = [];
        if ($periodId) {
            $sampleAttachments = EntityMappingAttachment::query()
                ->where('period_id', $periodId)
                ->orderByDesc('id')
                ->limit(12)
                ->get([
                    'id',
                    'filename',
                    'type',
                    'is_reminder',
                    'expiry_date',
                    'attachment_path',
                ]);
        }

        return view('deliverables.templates', [
            'title' => 'Deliverable Templates',
            'templates' => $templates,
            'templateYear' => $templateYear,
            'templatePeriod' => $templatePeriod,
            'sampleAttachments' => $sampleAttachments,
            'deliverables' => EntityItem::query()->orderBy('display_order')->get(['id', 'title']),
        ]);
    }

    public function store(Request $request)
    {
        $roleNames = $request->session()->get('admin_role_names', []);
        if (! in_array('Super Admin', $roleNames, true)) {
            abort(403);
        }

        $rules = array_merge([
            'action' => ['nullable', 'in:create,update,delete'],
            'id' => ['nullable', 'integer'],
            'deliverable_id' => ['nullable', 'integer'],
            'template_name' => ['required_unless:action,delete', 'nullable', 'string', 'max:255'],
            'template_period' => ['required_unless:action,delete', 'nullable', 'string', Rule::in(['June', 'December'])],
            'template_year' => ['required_unless:action,delete', 'nullable', 'integer', 'min:2024', 'max:2028'],
            'template_path' => ['nullable', 'string', 'max:255'],
            'display_order' => ['nullable', 'integer'],
        ], GrmUpload::fieldRule('template_file', 'office', false));

        $messages = GrmUpload::messages('template_file', 'office');
        $data = $request->validate($rules, $messages);

        $action = (string) ($data['action'] ?? 'create');

        if ($action === 'delete') {
            DeliverableTemplate::query()->where('id', (int) $data['id'])->update(['is_deleted' => true]);

            return redirect()->route('deliverables.templates')->with('success', 'Template deleted successfully.');
        }

        try {
            $uploadedPath = null;
            if ($request->hasFile('template_file')) {
                $uploadedPath = $request->file('template_file')->store('deliverable-templates', 'public');
            }

            if ($action === 'update') {
                DeliverableTemplate::query()->where('id', (int) $data['id'])->update([
                    'deliverable_id' => (int) $data['deliverable_id'],
                    'template_name' => (string) $data['template_name'],
                    'template_period' => (string) $data['template_period'],
                    'template_year' => (int) $data['template_year'],
                    'template_path' => (string) ($uploadedPath ?: ($data['template_path'] ?? '')),
                    'display_order' => (int) ($data['display_order'] ?? 1),
                ]);

                return redirect()->route('deliverables.templates')->with('success', 'Template updated successfully.');
            }

            DeliverableTemplate::create([
                'deliverable_id' => (int) $data['deliverable_id'],
                'template_name' => (string) $data['template_name'],
                'template_period' => (string) $data['template_period'],
                'template_year' => (int) $data['template_year'],
                'template_path' => (string) ($uploadedPath ?: ($data['template_path'] ?? '')),
                'display_order' => (int) ($data['display_order'] ?? 1),
                'is_deleted' => false,
            ]);

            return redirect()->route('deliverables.templates')->with('success', 'Template created successfully.');
        } catch (Throwable $e) {
            report($e);

            return back()
                ->withInput()
                ->with('error', 'Could not save the file. Check the allowed types and size, then try again.');
        }
    }
}
