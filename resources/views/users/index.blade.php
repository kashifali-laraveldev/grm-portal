@extends('layouts.admin')

@section('content')
    @php
        $roleNames = session('admin_role_names', []);
        $canEdit = in_array('Super Admin', $roleNames, true);
    @endphp

    <div class="finance-statistics-page legal-entity-page">
    <div class="page-head legal-head">
        <div class="legal-head-left">
            <div class="breadcrumb-dark">Admin <span class="sep">/</span> Manage Users</div>
            <h4 class="page-title">Manage Users</h4>
        </div>
        @if($canEdit)
            <button class="btn btn-add legal-add-btn" type="button" onclick="GrmUI.openDrawer('addUserDrawer')">
                <i class="bi bi-plus-circle me-1"></i>Add New User
            </button>
        @endif
    </div>

    <div class="finance-kpi-grid row g-3 mb-3">
        <div class="col-12 col-md-6 col-xl-3">
            <div class="finance-kpi-tile">
                <div class="finance-kpi-tile-icon" aria-hidden="true"><i class="bi bi-people"></i></div>
                <div>
                    <div class="finance-kpi-label">Total Users</div>
                    <div class="finance-kpi-value">{{ count($admins) }}</div>
                </div>
            </div>
        </div>
        <div class="col-12 col-md-6 col-xl-3">
            <div class="finance-kpi-tile finance-kpi-tile--capital">
                <div class="finance-kpi-tile-icon" aria-hidden="true"><i class="bi bi-person-check"></i></div>
                <div>
                    <div class="finance-kpi-label">Active</div>
                    <div class="finance-kpi-value">{{ $admins->where('is_active', 1)->count() }}</div>
                </div>
            </div>
        </div>
        <div class="col-12 col-md-6 col-xl-3">
            <div class="finance-kpi-tile finance-kpi-tile--inactive">
                <div class="finance-kpi-tile-icon" aria-hidden="true"><i class="bi bi-person-x"></i></div>
                <div>
                    <div class="finance-kpi-label">Inactive</div>
                    <div class="finance-kpi-value">{{ $admins->where('is_active', 0)->count() }}</div>
                </div>
            </div>
        </div>
        <div class="col-12 col-md-6 col-xl-3">
            <div class="finance-kpi-tile finance-kpi-tile--shares">
                <div class="finance-kpi-tile-icon" aria-hidden="true"><i class="bi bi-shield-check"></i></div>
                <div>
                    <div class="finance-kpi-label">Roles</div>
                    <div class="finance-kpi-value">{{ count($roles) }}</div>
                </div>
            </div>
        </div>
    </div>

    <div class="card fade-in-up legal-card legal-table-shell mb-3">
        <div class="card-body">
            <div class="legal-table-search-block mb-2">
                <div id="usersTableSearchMount" class="legal-datatable-search-mount"></div>
            </div>
            <div class="table-container">
            <div class="table-responsive">
                <table class="table legal-entity-table w-100" id="usersTable">
                    <thead class="table-light">
                        <tr>
                            <th>#</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Employee AD ID</th>
                            <th>Role(s)</th>
                            <th>Teams</th>
                            <th>Status</th>
                            <th style="width:180px;">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($admins as $idx => $admin)
                            @php
                                $emp = $employeeByAdId[$admin->employee_ad_id] ?? null;
                                $roleNamesFor = $roleNamesByAdminId[$admin->id] ?? [];
                                $teamIds = $teamIdsByAdminId[$admin->id] ?? [];
                                $teamNames = [];
                                foreach ($teams as $t) {
                                    if (in_array((int)$t->id, $teamIds, true)) $teamNames[] = $t->team_name;
                                }
                            @endphp
                            <tr>
                                <td>{{ $idx + 1 }}</td>
                                <td>{{ $emp?->full_name ?? 'Unknown' }}</td>
                                <td>{{ $emp?->email_address ?? '-' }}</td>
                                <td class="mono">{{ $admin->employee_ad_id }}</td>
                                <td>{{ count($roleNamesFor) ? implode(', ', $roleNamesFor) : '-' }}</td>
                                <td>{{ count($teamNames) ? implode(', ', $teamNames) : '-' }}</td>
                                <td>
                                    @if($canEdit)
                                        <form method="POST" action="{{ route('manage_users.store') }}" class="d-inline m-0"
                                            data-grm-confirm-submit="true"
                                            data-grm-confirm-title="Change account status?"
                                            data-grm-confirm-text="{{ $admin->is_active ? 'Deactivate this user? They will not be able to sign in until re-activated.' : 'Activate this user? They will be able to sign in again.' }}"
                                            data-grm-confirm-button="{{ $admin->is_active ? 'Yes, deactivate' : 'Yes, activate' }}"
                                            data-grm-confirm-icon="warning">
                                            @csrf
                                            <input type="hidden" name="action" value="toggle">
                                            <input type="hidden" name="admin_id" value="{{ $admin->id }}">
                                            <button type="submit" class="status-pill {{ $admin->is_active ? 'active' : 'neutral' }} status-pill-toggle" title="Click to {{ $admin->is_active ? 'deactivate' : 'activate' }} user">
                                                {{ $admin->is_active ? 'Active' : 'Inactive' }}
                                            </button>
                                        </form>
                                    @else
                                        <span class="status-pill {{ $admin->is_active ? 'active' : 'neutral' }}">
                                            {{ $admin->is_active ? 'Active' : 'Inactive' }}
                                        </span>
                                    @endif
                                </td>
                                <td>
                                    <div class="d-flex gap-1 justify-content-end align-items-center flex-wrap">
                                        @if($canEdit)
                                            <button class="icon-action edit" type="button" title="Edit"
                                                onclick="openEditDrawer('editUserDrawer', {{ \Illuminate\Support\Js::from(['admin_id' => $admin->id]) }})"><i class="bi bi-pencil"></i></button>
                                            <form method="POST" action="{{ route('manage_users.store') }}" class="d-inline m-0" data-delete-form="true" data-delete-message="Delete this user?">
                                                @csrf
                                                <input type="hidden" name="action" value="delete">
                                                <input type="hidden" name="admin_id" value="{{ $admin->id }}">
                                                <button class="icon-action delete" type="submit" title="Delete"><i class="bi bi-trash"></i></button>
                                            </form>
                                        @else
                                            -
                                        @endif
                                    </div>
                                </td>
                            </tr>

                        @endforeach
                    </tbody>
                </table>
            </div>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            if (window.jQuery && $('#usersTable').length) {
                const $mount = $('#usersTableSearchMount');
                $('#usersTable').DataTable({
                    pageLength: 25,
                    order: [[0, 'asc']],
                    lengthChange: false,
                    pagingType: 'simple_numbers',
                    searching: true,
                    dom: "<'legal-common-search-wrap mb-0'f>t<'legal-table-footer d-flex justify-content-between align-items-center mt-2 pt-2'<'legal-footer-info'i><'legal-footer-pagination'p>>",
                    initComplete: function () {
                        const $wrap = $('#usersTable_wrapper').children('.legal-common-search-wrap').first();
                        if ($wrap.length && $mount.length) {
                            $wrap.appendTo($mount);
                        } else {
                            $('#usersTable_filter').appendTo($mount);
                        }
                        $('#usersTable_filter input[type="search"]').attr('placeholder', 'Search...');
                    }
                });
            }
        });
    </script>

    @if($canEdit)
        <div class="offcanvas offcanvas-end" tabindex="-1" id="editUserDrawer">
            <div class="offcanvas-header">
                <h5 class="offcanvas-title">Edit User (Role & Teams)</h5>
                <button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button>
            </div>
            <div class="offcanvas-body">
                <form method="POST" action="{{ route('manage_users.store') }}">
                    @csrf
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="admin_id">
                    <div class="mb-2">
                        <label class="form-label">Role</label>
                        <select name="role_id" class="form-select">
                            <option value="">Select</option>
                            @foreach($roles as $r)
                                <option value="{{ $r->ID }}">{{ $r->role_name }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="mb-2">
                        <label class="form-label">Teams</label>
                        <select name="team_ids[]" multiple class="form-select">
                            @foreach($teams as $t)
                                <option value="{{ $t->id }}">{{ $t->team_name }}</option>
                            @endforeach
                        </select>
                    </div>
                    <button class="btn btn-add w-100" type="submit">Save</button>
                </form>
            </div>
        </div>
        <div class="offcanvas offcanvas-end" tabindex="-1" id="addUserDrawer">
            <div class="offcanvas-header">
                <h5 class="offcanvas-title">Add New User</h5>
                <button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button>
            </div>
            <div class="offcanvas-body">
                <form method="POST" action="{{ route('manage_users.store') }}">
                    @csrf
                    <input type="hidden" name="action" value="create">
                    <div class="mb-2"><label class="form-label">Employee AD ID</label><input type="number" name="employee_ad_id" class="form-control" required></div>
                    <div class="mb-2"><label class="form-label">Full Name</label><input type="text" name="full_name" class="form-control" required></div>
                    <div class="mb-2"><label class="form-label">Email</label><input type="email" name="email" class="form-control" required></div>
                    <div class="mb-2"><label class="form-label">Password</label><input type="text" name="password" class="form-control" value="demo123" required></div>
                    <div class="mb-2"><label class="form-label">Department</label><input type="text" name="department" class="form-control"></div>
                    <div class="mb-2"><label class="form-label">Company</label><input type="text" name="company" class="form-control" value="Demo Organization"></div>
                    <div class="mb-2">
                        <label class="form-label">Role</label>
                        <select name="role_id" class="form-select">
                            <option value="">Select</option>
                            @foreach($roles as $r)
                                <option value="{{ $r->ID }}">{{ $r->role_name }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="mb-2">
                        <label class="form-label">Teams</label>
                        <select name="team_ids[]" multiple class="form-select">
                            @foreach($teams as $t)
                                <option value="{{ $t->id }}">{{ $t->team_name }}</option>
                            @endforeach
                        </select>
                    </div>
                    <button class="btn btn-add w-100" type="submit">Create User</button>
                </form>
            </div>
        </div>
    @endif
    </div>
@endsection
