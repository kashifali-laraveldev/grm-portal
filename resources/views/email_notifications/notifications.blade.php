@extends('layouts.admin')

@section('content')
    @php $canEdit = in_array('Super Admin', session('admin_role_names', []), true); @endphp
    <div class="legal-entity-page">
    <div class="page-head legal-head">
        <div class="legal-head-left">
            <div class="breadcrumb-dark">Email Notifications <span class="sep">/</span> Notifications</div>
            <h4 class="page-title">Email Notifications</h4>
        </div>
        @if($canEdit)
            <button class="btn btn-add legal-add-btn" type="button" onclick="GrmUI.openDrawer('addNotificationDrawer')"><i class="bi bi-plus-circle me-1"></i>Add Notification</button>
        @endif
    </div>

    <div class="card fade-in-up legal-card legal-table-shell mb-3">
        <div class="card-body">
            <div class="legal-table-search-block mb-2">
                <div id="emailNotificationsTableSearchMount" class="legal-datatable-search-mount"></div>
            </div>
            <div class="table-container">
            <div class="table-responsive">
                <table class="table legal-entity-table w-100" id="emailNotificationsTable">
                    <thead class="table-light">
                        <tr>
                            <th>#</th>
                            <th>Title</th>
                            <th>Subject</th>
                            <th>Group</th>
                            <th>Template</th>
                            <th>Status</th>
                            <th>Send Date</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($notifications as $idx => $n)
                            <tr>
                                <td>{{ $idx + 1 }}</td>
                                <td>{{ $n->notification_title }}</td>
                                <td>{{ $n->notification_subject }}</td>
                                <td>{{ $groupNames[$n->group_id] ?? '-' }}</td>
                                <td>{{ $templateNames[$n->template_id] ?? '-' }}</td>
                                <td>
                                    <span class="status-pill {{ ($n->sts ?? '') === 'active' ? 'active' : 'neutral' }}">{{ $n->sts ?? '-' }}</span>
                                </td>
                                <td>{{ $n->email_send_date ?? '-' }}</td>
                                <td>
                                    @if($canEdit)
                                        <div class="d-flex gap-1 justify-content-end align-items-center">
                                            <button class="icon-action edit" type="button" title="Edit"
                                                onclick="openEditDrawer('editNotificationDrawer', {{ \Illuminate\Support\Js::from([
                                                    'id' => $n->id,
                                                    'notification_title' => $n->notification_title,
                                                    'notification_subject' => $n->notification_subject,
                                                    'group_id' => $n->group_id,
                                                    'template_id' => $n->template_id,
                                                    'deadline_condition' => $n->deadline_condition,
                                                    'from_email' => $n->from_email,
                                                    'from_name' => $n->from_name,
                                                    'sts' => $n->sts,
                                                    'email_send_date' => $n->email_send_date ? \Carbon\Carbon::parse($n->email_send_date)->format('Y-m-d\TH:i') : '',
                                                ]) }})"><i class="bi bi-pencil"></i></button>
                                            <form method="POST" action="{{ route('email_notifications.notifications.destroy', $n->id) }}" class="d-inline m-0" data-delete-form="true" data-delete-message="Delete notification?">
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
    <div class="offcanvas offcanvas-end" tabindex="-1" id="addNotificationDrawer">
        <div class="offcanvas-header"><h5 class="offcanvas-title">Add Notification</h5><button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button></div>
        <div class="offcanvas-body">
            <form method="POST" action="{{ route('email_notifications.notifications.store') }}">
                @csrf
                <div class="mb-2"><label class="form-label">Title</label><input name="notification_title" class="form-control" required></div>
                <div class="mb-2"><label class="form-label">Subject</label><input name="notification_subject" class="form-control" required></div>
                <div class="mb-2"><label class="form-label">Group</label><select name="group_id" class="form-select"><option value="">Group</option>@foreach($groups as $g)<option value="{{ $g->id }}">{{ $g->group_name }}</option>@endforeach</select></div>
                <div class="mb-2"><label class="form-label">Template</label><select name="template_id" class="form-select"><option value="">Template</option>@foreach($templates as $t)<option value="{{ $t->id }}">{{ $t->template_name }}</option>@endforeach</select></div>
                <div class="mb-2"><label class="form-label">Deadline Condition</label><input name="deadline_condition" class="form-control"></div>
                <div class="mb-2"><label class="form-label">From Email</label><input name="from_email" class="form-control" value="noreply@demo.com"></div>
                <div class="mb-2"><label class="form-label">From Name</label><input name="from_name" class="form-control" value="GRM Portal"></div>
                <div class="mb-2"><label class="form-label">Send Date</label><input type="datetime-local" name="email_send_date" class="form-control"></div>
                <div class="mb-2"><label class="form-label">Status</label><select name="sts" class="form-select"><option value="active">Active</option><option value="inactive">Inactive</option></select></div>
                <button class="btn btn-add w-100" type="submit">Create</button>
            </form>
        </div>
    </div>
    <div class="offcanvas offcanvas-end" tabindex="-1" id="editNotificationDrawer">
        <div class="offcanvas-header"><h5 class="offcanvas-title">Edit Notification</h5><button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button></div>
        <div class="offcanvas-body">
            <form method="POST" id="editNotificationForm" action="#">
                @csrf
                @method('PUT')
                <input type="hidden" name="id">
                <div class="mb-2"><label class="form-label">Title</label><input name="notification_title" class="form-control"></div>
                <div class="mb-2"><label class="form-label">Subject</label><input name="notification_subject" class="form-control"></div>
                <div class="mb-2"><label class="form-label">Group</label><select name="group_id" class="form-select"><option value="">Group</option>@foreach($groups as $g)<option value="{{ $g->id }}">{{ $g->group_name }}</option>@endforeach</select></div>
                <div class="mb-2"><label class="form-label">Template</label><select name="template_id" class="form-select"><option value="">Template</option>@foreach($templates as $t)<option value="{{ $t->id }}">{{ $t->template_name }}</option>@endforeach</select></div>
                <div class="mb-2"><label class="form-label">Deadline Condition</label><input name="deadline_condition" class="form-control"></div>
                <div class="mb-2"><label class="form-label">From Email</label><input name="from_email" class="form-control"></div>
                <div class="mb-2"><label class="form-label">From Name</label><input name="from_name" class="form-control"></div>
                <div class="mb-2"><label class="form-label">Send Date</label><input type="datetime-local" name="email_send_date" class="form-control"></div>
                <div class="mb-2"><label class="form-label">Status</label><select name="sts" class="form-select"><option value="active">Active</option><option value="inactive">Inactive</option></select></div>
                <button class="btn btn-add w-100" type="submit">Update</button>
            </form>
        </div>
    </div>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            if (window.jQuery && $('#emailNotificationsTable').length) {
                const $mount = $('#emailNotificationsTableSearchMount');
                $('#emailNotificationsTable').DataTable({
                    pageLength: 25,
                    order: [[0, 'asc']],
                    lengthChange: false,
                    pagingType: 'simple_numbers',
                    searching: true,
                    dom: "<'legal-common-search-wrap mb-0'f>t<'legal-table-footer d-flex justify-content-between align-items-center mt-2 pt-2'<'legal-footer-info'i><'legal-footer-pagination'p>>",
                    initComplete: function () {
                        const $wrap = $('#emailNotificationsTable_wrapper').children('.legal-common-search-wrap').first();
                        if ($wrap.length && $mount.length) {
                            $wrap.appendTo($mount);
                        } else {
                            $('#emailNotificationsTable_filter').appendTo($mount);
                        }
                        $('#emailNotificationsTable_filter input[type="search"]').attr('placeholder', 'Search...');
                    }
                });
            }
            const editForm = document.getElementById('editNotificationForm');
            const editDrawer = document.getElementById('editNotificationDrawer');
            if (editDrawer && editForm) {
                editDrawer.addEventListener('show.bs.offcanvas', function () {
                    const id = editDrawer.querySelector('[name="id"]').value;
                    if (id) editForm.action = "{{ url('/email-notifications/notifications') }}/" + id;
                });
            }
        });
    </script>
    </div>
@endsection
