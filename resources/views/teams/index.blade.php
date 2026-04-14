@extends('layouts.admin')

@section('content')
    @php
        $roleNames = session('admin_role_names', []);
        $canEdit = in_array('Super Admin', $roleNames, true);
    @endphp

    <div class="legal-entity-page">
    <div class="page-head legal-head">
        <div class="legal-head-left">
            <div class="breadcrumb-dark">Admin <span class="sep">/</span> Teams</div>
            <h4 class="page-title">Teams</h4>
        </div>
        @if($canEdit)
            <button class="btn btn-add legal-add-btn" type="button" onclick="GrmUI.openDrawer('addTeamDrawer')">
                <i class="bi bi-plus-circle me-1"></i>Add Team
            </button>
        @endif
    </div>

    <div class="card fade-in-up legal-card legal-table-shell mb-3">
        <div class="card-body">
            <div class="legal-table-search-block mb-2">
                <div id="teamsTableSearchMount" class="legal-datatable-search-mount"></div>
            </div>
            <div class="table-container">
            <div class="table-responsive">
                <table class="table legal-entity-table w-100" id="teamsTable">
                    <thead class="table-light">
                        <tr>
                            <th>#</th>
                            <th>Team</th>
                            <th>Members</th>
                            <th style="width:180px;">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($teams as $idx => $t)
                            @php
                                $count = (int)($memberCounts[(int)$t->id] ?? 0);
                            @endphp
                            <tr>
                                <td>{{ $idx + 1 }}</td>
                                <td>{{ $t->team_name }}</td>
                                <td>{{ $count }}</td>
                                <td>
                                    @if($canEdit)
                                        <div class="d-flex gap-1 justify-content-end align-items-center flex-wrap">
                                            <button class="icon-action edit" type="button" title="Edit" onclick="openEditDrawer('editTeamDrawer', {{ \Illuminate\Support\Js::from(['team_id' => $t->id, 'team_name' => $t->team_name]) }})"><i class="bi bi-pencil"></i></button>
                                            <button class="btn btn-outline-primary btn-sm btn-filter" type="button" onclick="openEditDrawer('teamMembersDrawer', {{ \Illuminate\Support\Js::from(['team_id' => $t->id]) }})">Members</button>
                                            <form method="POST" action="{{ route('teams.store') }}" class="d-inline m-0" data-delete-form="true" data-delete-message="Delete this team?">
                                                @csrf
                                                <input type="hidden" name="action" value="delete">
                                                <input type="hidden" name="team_id" value="{{ $t->id }}">
                                                <button class="icon-action delete" type="submit" title="Delete"><i class="bi bi-trash"></i></button>
                                            </form>
                                        </div>
                                    @else
                                        -
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

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            if (window.jQuery && $('#teamsTable').length) {
                const $mount = $('#teamsTableSearchMount');
                $('#teamsTable').DataTable({
                    pageLength: 25,
                    order: [[0, 'asc']],
                    lengthChange: false,
                    pagingType: 'simple_numbers',
                    searching: true,
                    dom: "<'legal-common-search-wrap mb-0'f>t<'legal-table-footer d-flex justify-content-between align-items-center mt-2 pt-2'<'legal-footer-info'i><'legal-footer-pagination'p>>",
                    initComplete: function () {
                        const $wrap = $('#teamsTable_wrapper').children('.legal-common-search-wrap').first();
                        if ($wrap.length && $mount.length) {
                            $wrap.appendTo($mount);
                        } else {
                            $('#teamsTable_filter').appendTo($mount);
                        }
                        $('#teamsTable_filter input[type="search"]').attr('placeholder', 'Search...');
                    }
                });
            }
        });
    </script>
    @if($canEdit)
        <div class="offcanvas offcanvas-end" tabindex="-1" id="addTeamDrawer">
            <div class="offcanvas-header">
                <h5 class="offcanvas-title">Add Team</h5>
                <button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button>
            </div>
            <div class="offcanvas-body">
                <form method="POST" action="{{ route('teams.store') }}">
                    @csrf
                    <input type="hidden" name="action" value="create">
                    <div class="mb-3">
                        <label class="form-label">Team Name</label>
                        <input type="text" name="team_name" class="form-control" required>
                    </div>
                    <button class="btn btn-add w-100" type="submit">Create Team</button>
                </form>
            </div>
        </div>
        <div class="offcanvas offcanvas-end" tabindex="-1" id="editTeamDrawer">
            <div class="offcanvas-header"><h5 class="offcanvas-title">Edit Team</h5><button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button></div>
            <div class="offcanvas-body">
                <form method="POST" action="{{ route('teams.store') }}">
                    @csrf
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="team_id">
                    <div class="mb-3"><label class="form-label">Team Name</label><input type="text" name="team_name" class="form-control"></div>
                    <button class="btn btn-add w-100">Save</button>
                </form>
            </div>
        </div>
        <div class="offcanvas offcanvas-end" tabindex="-1" id="teamMembersDrawer" style="width:700px!important;">
            <div class="offcanvas-header"><h5 class="offcanvas-title">Assign Members</h5><button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button></div>
            <div class="offcanvas-body">
                <form method="POST" action="{{ route('teams.store') }}">
                    @csrf
                    <input type="hidden" name="action" value="assign">
                    <input type="hidden" name="team_id">
                    <div class="mb-2"><label class="form-label">Members</label>
                        <select name="admin_ids[]" multiple class="form-select">
                            @foreach($admins as $a)
                                @php $emp = $employeeByAdId[$a->employee_ad_id] ?? null; @endphp
                                <option value="{{ $a->id }}">{{ ($emp?->full_name ?? 'User') . ' (#' . $a->id . ')' }}</option>
                            @endforeach
                        </select>
                    </div>
                    <button class="btn btn-add w-100">Save Members</button>
                </form>
            </div>
        </div>
    @endif
    </div>
@endsection
