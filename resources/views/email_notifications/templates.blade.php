@extends('layouts.admin')

@section('content')
    @php $canEdit = in_array('Super Admin', session('admin_role_names', []), true); @endphp
    @php
        $emailTemplateEditPayloadsById = [];
        foreach ($templates as $_et) {
            $emailTemplateEditPayloadsById[$_et->id] = [
                'id' => $_et->id,
                'template_name' => $_et->template_name,
                'template_body' => $_et->template_body,
                'sts' => $_et->sts,
                'download_url' => (filled($_et->attachment_path) && \Illuminate\Support\Facades\Storage::disk('public')->exists($_et->attachment_path))
                    ? asset('storage/'.$_et->attachment_path)
                    : '',
            ];
        }
    @endphp
    <div class="legal-entity-page">
    <div class="page-head legal-head">
        <div class="legal-head-left">
            <div class="breadcrumb-dark">Email Notifications <span class="sep">/</span> Templates</div>
            <h4 class="page-title">Email Templates</h4>
        </div>
        @if($canEdit)
            <button class="btn btn-add legal-add-btn" type="button" onclick="GrmUI.openDrawer('addEmailTemplateDrawer')"><i class="bi bi-plus-circle me-1"></i>Add Template</button>
        @endif
    </div>

    <div class="card fade-in-up legal-card legal-table-shell mb-3">
        <div class="card-body">
            <div class="legal-table-search-block mb-2">
                <div id="emailTemplatesTableSearchMount" class="legal-datatable-search-mount"></div>
            </div>
            <div class="table-container">
            <div class="table-responsive">
                <table class="table legal-entity-table w-100" id="emailTemplatesTable">
                    <thead class="table-light">
                        <tr>
                            <th>#</th>
                            <th>Name</th>
                            <th>Status</th>
                            <th>Attachment</th>
                            <th>Created By</th>
                            <th>Created At</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($templates as $idx => $t)
                            <tr>
                                <td>{{ $idx + 1 }}</td>
                                <td>{{ $t->template_name }}</td>
                                <td>
                                    <span class="status-pill {{ (int)$t->sts === 1 ? 'active' : 'neutral' }}">{{ (int)$t->sts === 1 ? 'Active' : 'Inactive' }}</span>
                                </td>
                                <td>@include('partials.grm-storage-download-link', ['path' => $t->attachment_path, 'label' => 'Download attachment'])</td>
                                <td>{{ $t->created_by ?? '-' }}</td>
                                <td>{{ $t->created_at ?? '-' }}</td>
                                <td>
                                    @if($canEdit)
                                        <div class="d-flex gap-1 justify-content-end align-items-center">
                                            <button class="icon-action edit js-grm-edit-email-template" type="button" title="Edit"
                                                data-grm-email-template-edit-id="{{ $t->id }}"><i class="bi bi-pencil"></i></button>
                                            <form method="POST" action="{{ route('email_notifications.templates.destroy', $t->id) }}" class="d-inline m-0" data-delete-form="true" data-delete-message="Delete template?">
                                                @csrf
                                                @method('DELETE')
                                                <button class="icon-action delete" type="submit" title="Delete"><i class="bi bi-trash"></i></button>
                                            </form>
                                        </div>
                                    @endif
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
            </div>
        </div>
    </div>
    <div class="offcanvas offcanvas-end" tabindex="-1" id="addEmailTemplateDrawer">
        <div class="offcanvas-header"><h5 class="offcanvas-title">Add Email Template</h5><button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button></div>
        <div class="offcanvas-body">
            <form method="POST" action="{{ route('email_notifications.templates.store') }}" enctype="multipart/form-data">
                @csrf
                <div class="mb-2"><label class="form-label">Template Name</label><input name="template_name" class="form-control" required></div>
                <div class="mb-2"><label class="form-label">Status</label><select name="sts" class="form-select"><option value="1">Active</option><option value="0">Inactive</option></select></div>
                <div class="mb-2"><label class="form-label">Body</label><textarea name="template_body" class="form-control"></textarea></div>
                <div class="mb-2">
                    <label class="form-label">Attachment</label>
                    <input type="file" name="attachment_file" class="form-control" accept="{{ config('grm_uploads.office.accept') }}">
                    @include('partials.grm-upload-hint', ['profile' => 'office'])
                </div>
                <button class="btn btn-add w-100" type="submit">Create</button>
            </form>
        </div>
    </div>
    <div class="offcanvas offcanvas-end" tabindex="-1" id="editEmailTemplateDrawer">
        <div class="offcanvas-header"><h5 class="offcanvas-title">Edit Email Template</h5><button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button></div>
        <div class="offcanvas-body">
            <form method="POST" id="editEmailTemplateForm" action="{{ route('email_notifications.templates.update', 0) }}" enctype="multipart/form-data">
                @csrf
                @method('PUT')
                <input type="hidden" name="id">
                <div class="mb-2"><label class="form-label">Name</label><input name="template_name" class="form-control"></div>
                <div class="mb-2"><label class="form-label">Body</label><textarea name="template_body" class="form-control"></textarea></div>
                <div class="mb-2"><label class="form-label">Status</label><select name="sts" class="form-select"><option value="1">Active</option><option value="0">Inactive</option></select></div>
                <div class="mb-2">
                    <label class="form-label">Current attachment</label>
                    <div id="editEmailTemplateCurrentFileMount" class="small text-muted">-----</div>
                </div>
                <div class="mb-2">
                    <label class="form-label">Replace attachment</label>
                    <input type="file" name="attachment_file" class="form-control" accept="{{ config('grm_uploads.office.accept') }}">
                    @include('partials.grm-upload-hint', ['profile' => 'office'])
                </div>
                <button class="btn btn-add w-100" type="submit">Update</button>
            </form>
        </div>
    </div>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var emailTemplateEditPayloads = @json($emailTemplateEditPayloadsById);
            var emailTemplatesTable = document.getElementById('emailTemplatesTable');
            if (emailTemplatesTable) {
                emailTemplatesTable.addEventListener('click', function (e) {
                    var btn = e.target.closest('.js-grm-edit-email-template');
                    if (!btn) return;
                    var id = parseInt(btn.getAttribute('data-grm-email-template-edit-id'), 10);
                    var payload = emailTemplateEditPayloads[id];
                    if (!payload) return;
                    openEditDrawer('editEmailTemplateDrawer', payload);
                    var mount = document.getElementById('editEmailTemplateCurrentFileMount');
                    if (!mount) return;
                    if (payload.download_url) {
                        mount.innerHTML = '<a href="' + String(payload.download_url).replace(/"/g, '&quot;') + '" class="btn btn-sm btn-add btn-filter legal-filter-btn" target="_blank" rel="noopener noreferrer" download><i class="bi bi-paperclip me-1"></i>Download attachment</a>';
                    } else {
                        mount.innerHTML = '<span class="text-muted small">-----</span>';
                    }
                });
            }
            if (window.jQuery && $('#emailTemplatesTable').length) {
                const $mount = $('#emailTemplatesTableSearchMount');
                $('#emailTemplatesTable').DataTable({
                    pageLength: 25,
                    order: [[0, 'asc']],
                    lengthChange: false,
                    pagingType: 'simple_numbers',
                    searching: true,
                    dom: "<'legal-common-search-wrap mb-0'f>t<'legal-table-footer d-flex justify-content-between align-items-center mt-2 pt-2'<'legal-footer-info'i><'legal-footer-pagination'p>>",
                    initComplete: function () {
                        const $wrap = $('#emailTemplatesTable_wrapper').children('.legal-common-search-wrap').first();
                        if ($wrap.length && $mount.length) {
                            $wrap.appendTo($mount);
                        } else {
                            $('#emailTemplatesTable_filter').appendTo($mount);
                        }
                        $('#emailTemplatesTable_filter input[type="search"]').attr('placeholder', 'Search...');
                    }
                });
            }
            const editDrawer = document.getElementById('editEmailTemplateDrawer');
            if (editDrawer) {
                editDrawer.addEventListener('show.bs.offcanvas', function () {
                    const idField = editDrawer.querySelector('[name="id"]');
                    const idVal = idField ? idField.value : '';
                    if (idVal) {
                        document.getElementById('editEmailTemplateForm').action = "{{ url('/email-notifications/templates') }}/" + idVal;
                    }
                });
            }
        });
    </script>
    </div>
@endsection
