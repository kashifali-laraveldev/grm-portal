@extends('layouts.admin')

@section('content')
    @php $canSuper = in_array('Super Admin', session('admin_role_names', []), true); @endphp
    @php
        $deliverableTemplateEditPayloadsById = [];
        foreach ($templates as $_tpl) {
            $deliverableTemplateEditPayloadsById[$_tpl->id] = [
                'id' => $_tpl->id,
                'deliverable_id' => $_tpl->deliverable_id,
                'template_name' => $_tpl->template_name,
                'template_period' => $_tpl->template_period,
                'template_year' => $_tpl->template_year,
                'template_path' => $_tpl->template_path,
                'display_order' => $_tpl->display_order,
                'download_url' => (filled($_tpl->template_path) && \Illuminate\Support\Facades\Storage::disk('public')->exists($_tpl->template_path))
                    ? asset('storage/'.$_tpl->template_path)
                    : '',
            ];
        }
    @endphp
    <div class="legal-entity-page">
    <div class="page-head legal-head">
        <div class="legal-head-left">
            <div class="breadcrumb-dark">Manage Deliverables <span class="sep">/</span> Deliverable Templates</div>
            <h4 class="page-title">Deliverable Templates</h4>
        </div>
        @if($canSuper)
            <button class="btn btn-add legal-add-btn" type="button" onclick="GrmUI.openDrawer('templateDrawer')">
                <i class="bi bi-plus-circle me-1"></i>Add New Deliverable Template
            </button>
        @endif
    </div>

    <div class="card fade-in-up legal-card legal-filter-shell mb-3">
        <div class="card-body">
            <form method="GET" action="{{ route('deliverables.templates') }}" class="filter-card legal-filter-card mb-0">
                <div class="row g-2 align-items-end">
                    <div class="col-12 col-md-3">
                        <label class="form-label">Year</label>
                        @include('partials.grm-year-select', ['name' => 'year', 'selected' => $templateYear])
                    </div>
                    <div class="col-12 col-md-3">
                        <label class="form-label">Month</label>
                        @include('partials.grm-month-select', ['name' => 'period', 'selected' => $templatePeriod])
                    </div>
                    <div class="col-12 col-md-6 d-flex gap-2 legal-filter-actions">
                        <button type="submit" class="btn btn-add btn-filter legal-filter-btn"><i class="bi bi-funnel me-1"></i>Apply Filter</button>
                        <a href="{{ route('deliverables.templates') }}" class="btn btn-ghost btn-filter legal-filter-btn"><i class="bi bi-arrow-counterclockwise me-1"></i>Reset</a>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <div class="card fade-in-up legal-card legal-table-shell mb-3">
        <div class="card-body">
            <div class="legal-table-search-block mb-2">
                <div id="deliverablesTemplatesTableSearchMount" class="legal-datatable-search-mount"></div>
            </div>
            <div class="table-container">
            <div class="table-responsive">
                <table class="table legal-entity-table w-100" id="deliverablesTemplatesTable">
                    <thead class="table-light">
                        <tr>
                            <th>#</th>
                            <th>Deliverable</th>
                            <th>Template Name</th>
                            <th>Download</th>
                            <th>Display Order</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse($templates as $idx => $tpl)
                            <tr>
                                <td>{{ $idx + 1 }}</td>
                                <td>{{ $tpl->deliverable_title ?? $tpl->deliverable_id }}</td>
                                <td>{{ $tpl->template_name }}</td>
                                <td>@include('partials.grm-storage-download-link', ['path' => $tpl->template_path, 'label' => 'Download file'])</td>
                                <td>{{ $tpl->display_order }}</td>
                                <td>
                                    @if($canSuper)
                                        <div class="d-flex gap-1 justify-content-end align-items-center">
                                            <button class="icon-action edit js-grm-edit-deliverable-template" type="button" title="Edit"
                                                data-grm-template-edit-id="{{ $tpl->id }}">
                                                <i class="bi bi-pencil"></i>
                                            </button>
                                            <form method="POST" action="{{ route('deliverables.templates.store') }}" class="d-inline m-0" data-delete-form="true" data-delete-message="Delete this template?">
                                                @csrf
                                                <input type="hidden" name="action" value="delete">
                                                <input type="hidden" name="id" value="{{ $tpl->id }}">
                                                <button class="icon-action delete" type="submit" title="Delete"><i class="bi bi-trash"></i></button>
                                            </form>
                                        </div>
                                    @endif
                                </td>
                            </tr>
                        @empty
                            <tr>
                                <td colspan="6" class="text-center text-muted">No templates found for selected period.</td>
                            </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var deliverableTemplateEditPayloads = @json($deliverableTemplateEditPayloadsById);
            var deliverablesTable = document.getElementById('deliverablesTemplatesTable');
            if (deliverablesTable) {
                deliverablesTable.addEventListener('click', function (e) {
                    var btn = e.target.closest('.js-grm-edit-deliverable-template');
                    if (!btn) return;
                    var id = parseInt(btn.getAttribute('data-grm-template-edit-id'), 10);
                    var payload = deliverableTemplateEditPayloads[id];
                    if (!payload) return;
                    openEditDrawer('editTemplateDrawer', payload);
                    var mount = document.getElementById('editTemplateCurrentFileMount');
                    if (!mount) return;
                    if (payload.download_url) {
                        mount.innerHTML = '<a href="' + String(payload.download_url).replace(/"/g, '&quot;') + '" class="btn btn-sm btn-add btn-filter legal-filter-btn" target="_blank" rel="noopener noreferrer" download><i class="bi bi-paperclip me-1"></i>Download file</a>';
                    } else {
                        mount.innerHTML = '<span class="text-muted small">-----</span>';
                    }
                });
            }
            if (window.jQuery && $('#deliverablesTemplatesTable').length) {
                const $mount = $('#deliverablesTemplatesTableSearchMount');
                $('#deliverablesTemplatesTable').DataTable({
                    pageLength: 25,
                    order: [[0, 'asc']],
                    lengthChange: false,
                    pagingType: 'simple_numbers',
                    searching: true,
                    dom: "<'legal-common-search-wrap mb-0'f>t<'legal-table-footer d-flex justify-content-between align-items-center mt-2 pt-2'<'legal-footer-info'i><'legal-footer-pagination'p>>",
                    initComplete: function () {
                        const $wrap = $('#deliverablesTemplatesTable_wrapper').children('.legal-common-search-wrap').first();
                        if ($wrap.length && $mount.length) {
                            $wrap.appendTo($mount);
                        } else {
                            $('#deliverablesTemplatesTable_filter').appendTo($mount);
                        }
                        $('#deliverablesTemplatesTable_filter input[type="search"]').attr('placeholder', 'Search...');
                    }
                });
            }
        });
    </script>

    <div class="offcanvas offcanvas-end" tabindex="-1" id="templateDrawer" aria-labelledby="templateDrawerLabel">
        <div class="offcanvas-header">
            <h5 class="offcanvas-title" id="templateDrawerLabel">Add Deliverable Template</h5>
            <button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button>
        </div>
        <div class="offcanvas-body">
            <form method="POST" action="{{ route('deliverables.templates.store') }}" enctype="multipart/form-data">
                @csrf
                <input type="hidden" name="action" value="create">
                <div class="mb-2">
                    <label class="form-label">Deliverable</label>
                    <select name="deliverable_id" class="form-select" required>
                        @foreach($deliverables as $d)
                            <option value="{{ $d->id }}">{{ $d->title }}</option>
                        @endforeach
                    </select>
                </div>
                <div class="mb-2"><label class="form-label">Template Name</label><input name="template_name" class="form-control" required></div>
                <div class="mb-2"><label class="form-label">Month</label>@include('partials.grm-month-select', ['name' => 'template_period', 'selected' => $templatePeriod])</div>
                <div class="mb-2"><label class="form-label">Year</label>@include('partials.grm-year-select', ['name' => 'template_year', 'selected' => $templateYear])</div>
                <div class="mb-2">
                    <label class="form-label">Upload template</label>
                    <input name="template_file" type="file" class="form-control" accept="{{ config('grm_uploads.office.accept') }}">
                    @include('partials.grm-upload-hint', ['profile' => 'office'])
                </div>
                <div class="mb-2"><label class="form-label">Path</label><input name="template_path" class="form-control" placeholder="Optional manual path"></div>
                <div class="mb-2"><label class="form-label">Display Order</label><input name="display_order" class="form-control" value="1"></div>
                <button class="btn btn-add w-100" type="submit">Create</button>
            </form>
        </div>
    </div>
    <div class="offcanvas offcanvas-end" tabindex="-1" id="editTemplateDrawer">
        <div class="offcanvas-header">
            <h5 class="offcanvas-title">Edit Deliverable Template</h5>
            <button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button>
        </div>
        <div class="offcanvas-body">
            <form method="POST" action="{{ route('deliverables.templates.store') }}" enctype="multipart/form-data">
                @csrf
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="id">
                <div class="mb-2">
                    <label class="form-label">Deliverable</label>
                    <select name="deliverable_id" class="form-select" required>
                        @foreach($deliverables as $d)
                            <option value="{{ $d->id }}">{{ $d->title }}</option>
                        @endforeach
                    </select>
                </div>
                <div class="mb-2"><label class="form-label">Template Name</label><input name="template_name" class="form-control" required></div>
                <div class="mb-2"><label class="form-label">Month</label>@include('partials.grm-month-select', ['name' => 'template_period', 'selected' => $templatePeriod])</div>
                <div class="mb-2"><label class="form-label">Year</label>@include('partials.grm-year-select', ['name' => 'template_year', 'selected' => $templateYear])</div>
                <div class="mb-2">
                    <label class="form-label">Current file</label>
                    <div id="editTemplateCurrentFileMount" class="small text-muted">-----</div>
                    <input type="hidden" name="template_path" value="">
                </div>
                <div class="mb-2">
                    <label class="form-label">Upload new file</label>
                    <input name="template_file" type="file" class="form-control" accept="{{ config('grm_uploads.office.accept') }}">
                    @include('partials.grm-upload-hint', ['profile' => 'office'])
                </div>
                <div class="mb-2"><label class="form-label">Display Order</label><input name="display_order" class="form-control"></div>
                <button class="btn btn-add w-100" type="submit">Update</button>
            </form>
        </div>
    </div>
    </div>
@endsection
