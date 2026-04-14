@extends('layouts.admin')

@section('content')
    @php $canEdit = in_array('Super Admin', session('admin_role_names', []), true); @endphp
    <div class="legal-entity-page">
    <div class="page-head legal-head">
        <div class="legal-head-left">
            <div class="breadcrumb-dark">Email Notifications <span class="sep">/</span> Recipients</div>
            <h4 class="page-title">Email Recipients</h4>
        </div>
        @if($canEdit)
            <button class="btn btn-add legal-add-btn" type="button" onclick="GrmUI.openDrawer('addRecipientDrawer')"><i class="bi bi-plus-circle me-1"></i>Add Recipient</button>
        @endif
    </div>

    <div class="card fade-in-up legal-card legal-table-shell mb-3">
        <div class="card-body">
            <div class="legal-table-search-block mb-2">
                <div id="emailRecipientsTableSearchMount" class="legal-datatable-search-mount"></div>
            </div>
            <div class="table-container">
            <div class="table-responsive">
                <table class="table legal-entity-table w-100" id="emailRecipientsTable">
                    <thead class="table-light">
                        <tr>
                            <th>#</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Designation</th>
                            <th>Contact</th>
                            <th>Created At</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($recipients as $idx => $r)
                            <tr>
                                <td>{{ $idx + 1 }}</td>
                                <td>{{ $r->full_name }}</td>
                                <td>{{ $r->email_address }}</td>
                                <td>{{ $r->designation ?? '-' }}</td>
                                <td>{{ $r->contact_number ?? '-' }}</td>
                                <td>{{ $r->created_at ?? '-' }}</td>
                                <td>
                                    @if($canEdit)
                                        <div class="d-flex gap-1 justify-content-end align-items-center">
                                            <button class="icon-action edit" type="button" title="Edit"
                                                onclick="openEditDrawer('editRecipientDrawer', {{ \Illuminate\Support\Js::from([
                                                    'id' => $r->id,
                                                    'full_name' => $r->full_name,
                                                    'email_address' => $r->email_address,
                                                    'designation' => $r->designation,
                                                    'contact_number' => $r->contact_number,
                                                ]) }})"><i class="bi bi-pencil"></i></button>
                                            <form method="POST" action="{{ route('email_notifications.recipients.destroy', $r->id) }}" class="d-inline m-0" data-delete-form="true" data-delete-message="Delete recipient?">
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
    <div class="offcanvas offcanvas-end" tabindex="-1" id="addRecipientDrawer">
        <div class="offcanvas-header"><h5 class="offcanvas-title">Add Recipient</h5><button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button></div>
        <div class="offcanvas-body">
            <form method="POST" action="{{ route('email_notifications.recipients.store') }}">
                @csrf
                <div class="mb-2"><label class="form-label">Full Name</label><input name="full_name" class="form-control" required></div>
                <div class="mb-2"><label class="form-label">Email</label><input name="email_address" class="form-control" required></div>
                <div class="mb-2"><label class="form-label">Designation</label><input name="designation" class="form-control"></div>
                <div class="mb-2"><label class="form-label">Contact</label><input name="contact_number" class="form-control"></div>
                <button class="btn btn-add w-100" type="submit">Create</button>
            </form>
        </div>
    </div>
    <div class="offcanvas offcanvas-end" tabindex="-1" id="editRecipientDrawer">
        <div class="offcanvas-header"><h5 class="offcanvas-title">Edit Recipient</h5><button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button></div>
        <div class="offcanvas-body">
            <form method="POST" id="editRecipientForm" action="#">
                @csrf
                @method('PUT')
                <input type="hidden" name="id">
                <div class="mb-2"><label class="form-label">Full Name</label><input name="full_name" class="form-control"></div>
                <div class="mb-2"><label class="form-label">Email</label><input name="email_address" class="form-control"></div>
                <div class="mb-2"><label class="form-label">Designation</label><input name="designation" class="form-control"></div>
                <div class="mb-2"><label class="form-label">Contact</label><input name="contact_number" class="form-control"></div>
                <button class="btn btn-add w-100" type="submit">Update</button>
            </form>
        </div>
    </div>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            if (window.jQuery && $('#emailRecipientsTable').length) {
                const $mount = $('#emailRecipientsTableSearchMount');
                $('#emailRecipientsTable').DataTable({
                    pageLength: 25,
                    order: [[0, 'asc']],
                    lengthChange: false,
                    pagingType: 'simple_numbers',
                    searching: true,
                    dom: "<'legal-common-search-wrap mb-0'f>t<'legal-table-footer d-flex justify-content-between align-items-center mt-2 pt-2'<'legal-footer-info'i><'legal-footer-pagination'p>>",
                    initComplete: function () {
                        const $wrap = $('#emailRecipientsTable_wrapper').children('.legal-common-search-wrap').first();
                        if ($wrap.length && $mount.length) {
                            $wrap.appendTo($mount);
                        } else {
                            $('#emailRecipientsTable_filter').appendTo($mount);
                        }
                        $('#emailRecipientsTable_filter input[type="search"]').attr('placeholder', 'Search...');
                    }
                });
            }
            const editForm = document.getElementById('editRecipientForm');
            const editDrawer = document.getElementById('editRecipientDrawer');
            if (editDrawer && editForm) {
                editDrawer.addEventListener('show.bs.offcanvas', function () {
                    const id = editDrawer.querySelector('[name="id"]').value;
                    if (id) editForm.action = "{{ url('/email-notifications/recipients') }}/" + id;
                });
            }
        });
    </script>
    </div>
@endsection
