@extends('layouts.admin')

@section('content')
    @php $canEdit = in_array('Super Admin', session('admin_role_names', []), true); @endphp
    <div class="legal-entity-page">
    <div class="page-head legal-head">
        <div class="legal-head-left">
            <div class="breadcrumb-dark">Email Notifications <span class="sep">/</span> Email Groups</div>
            <h4 class="page-title">Email Groups</h4>
        </div>
        @if($canEdit)
            <button class="btn btn-add legal-add-btn" type="button" onclick="GrmUI.openDrawer('addEmailGroupDrawer')"><i class="bi bi-plus-circle me-1"></i>Add Group</button>
        @endif
    </div>

    <div class="card fade-in-up legal-card legal-table-shell mb-3">
        <div class="card-body">
            <div class="legal-table-search-block mb-2">
                <div id="emailGroupsTableSearchMount" class="legal-datatable-search-mount"></div>
            </div>
            <div class="table-container">
            <div class="table-responsive">
                <table class="table legal-entity-table w-100" id="emailGroupsTable">
                    <thead class="table-light">
                        <tr>
                            <th>#</th>
                            <th>Group</th>
                            <th>Default</th>
                            <th>Recipients</th>
                            <th>Created At</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($groups as $idx => $g)
                            <tr>
                                <td>{{ $idx + 1 }}</td>
                                <td>{{ $g->group_name }}</td>
                                <td>
                                    <span class="status-pill {{ (string)$g->is_default === '1' ? 'active' : 'neutral' }}">{{ (string)$g->is_default === '1' ? 'Yes' : 'No' }}</span>
                                </td>
                                <td>{{ count($recipientIdsByGroup[$g->id] ?? []) }}</td>
                                <td>{{ $g->created_at ?? '-' }}</td>
                                <td>
                                    @if($canEdit)
                                        <div class="d-flex gap-1 justify-content-end align-items-center">
                                            <button class="icon-action edit" type="button" title="Edit"
                                                onclick="openEditDrawer('editEmailGroupDrawer', {{ \Illuminate\Support\Js::from([
                                                    'id' => $g->id,
                                                    'group_name' => $g->group_name,
                                                    'is_default' => $g->is_default,
                                                ]) }})"><i class="bi bi-pencil"></i></button>
                                            <form method="POST" action="{{ route('email_notifications.groups.destroy', $g->id) }}" class="d-inline m-0" data-delete-form="true" data-delete-message="Delete group?">
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
    <div class="offcanvas offcanvas-end" tabindex="-1" id="addEmailGroupDrawer">
        <div class="offcanvas-header"><h5 class="offcanvas-title">Add Email Group</h5><button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button></div>
        <div class="offcanvas-body">
            <form method="POST" action="{{ route('email_notifications.groups.store') }}">
                @csrf
                <div class="mb-2"><label class="form-label">Group Name</label><input name="group_name" class="form-control" required></div>
                <div class="mb-2"><label class="form-label">Default</label><select name="is_default" class="form-select"><option value="0">Custom</option><option value="1">Default</option></select></div>
                <div class="mb-2"><label class="form-label">Recipients</label><select name="recipient_ids[]" multiple class="form-select">@foreach($recipients as $r)<option value="{{ $r->id }}">{{ $r->full_name }}</option>@endforeach</select></div>
                <button class="btn btn-add w-100" type="submit">Create</button>
            </form>
        </div>
    </div>
    <div class="offcanvas offcanvas-end" tabindex="-1" id="editEmailGroupDrawer">
        <div class="offcanvas-header"><h5 class="offcanvas-title">Edit Email Group</h5><button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button></div>
        <div class="offcanvas-body">
            <form method="POST" id="editEmailGroupForm" action="#">
                @csrf
                @method('PUT')
                <input type="hidden" name="id">
                <div class="mb-2"><label class="form-label">Group Name</label><input name="group_name" class="form-control"></div>
                <div class="mb-2"><label class="form-label">Default</label><select name="is_default" class="form-select"><option value="0">Custom</option><option value="1">Default</option></select></div>
                <div class="mb-2"><label class="form-label">Recipients</label><select name="recipient_ids[]" multiple class="form-select">@foreach($recipients as $r)<option value="{{ $r->id }}">{{ $r->full_name }}</option>@endforeach</select></div>
                <button class="btn btn-add w-100" type="submit">Update</button>
            </form>
        </div>
    </div>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            if (window.jQuery && $('#emailGroupsTable').length) {
                const $mount = $('#emailGroupsTableSearchMount');
                $('#emailGroupsTable').DataTable({
                    pageLength: 25,
                    order: [[0, 'asc']],
                    lengthChange: false,
                    pagingType: 'simple_numbers',
                    searching: true,
                    dom: "<'legal-common-search-wrap mb-0'f>t<'legal-table-footer d-flex justify-content-between align-items-center mt-2 pt-2'<'legal-footer-info'i><'legal-footer-pagination'p>>",
                    initComplete: function () {
                        const $wrap = $('#emailGroupsTable_wrapper').children('.legal-common-search-wrap').first();
                        if ($wrap.length && $mount.length) {
                            $wrap.appendTo($mount);
                        } else {
                            $('#emailGroupsTable_filter').appendTo($mount);
                        }
                        $('#emailGroupsTable_filter input[type="search"]').attr('placeholder', 'Search...');
                    }
                });
            }
            const editForm = document.getElementById('editEmailGroupForm');
            const editDrawer = document.getElementById('editEmailGroupDrawer');
            if (editDrawer && editForm) {
                editDrawer.addEventListener('show.bs.offcanvas', function () {
                    const id = editDrawer.querySelector('[name="id"]').value;
                    if (id) editForm.action = "{{ url('/email-notifications/groups') }}/" + id;
                });
            }
        });
    </script>
    </div>
@endsection
