@extends('layouts.admin')

@section('content')
    @php
        $roleNames = session('admin_role_names', []);
        $canEdit = in_array('Super Admin', $roleNames, true);
    @endphp

    <div class="legal-entity-page">
    <div class="page-head legal-head">
        <div class="legal-head-left">
            <div class="breadcrumb-dark">Admin <span class="sep">/</span> Roles Management</div>
            <h4 class="page-title">Roles Management</h4>
        </div>
        @if($canEdit)
            <button class="btn btn-add legal-add-btn" type="button" onclick="openAddDrawer('addRoleDrawer')">
                <i class="bi bi-plus-circle me-1"></i>Add New Role
            </button>
        @endif
    </div>

    <div class="row g-3 mb-4">
        @foreach($roles as $r)
            @php
                $rid = (int)$r->ID;
                $users = (int)($userCounts[$rid] ?? 0);
                $modNames = $moduleNamesByRoleId[$rid] ?? [];
                $modNamesPreview = array_slice($modNames, 0, 4);
                $hasMoreMods = count($modNames) > 4;
            @endphp
            <div class="col-12 col-md-6 col-xl-3">
                <div class="module-category-card h-100">
                    <div class="module-category-card-header">{{ $r->role_name }}</div>
                    <div class="module-category-card-body">
                        <div class="small text-muted mb-2">
                            Users with this role: <strong class="text-dark">{{ $users }}</strong>
                        </div>
                        <ul class="module-category-module-list small mb-0">
                            @forelse($modNamesPreview as $name)
                                <li>{{ $name }}</li>
                            @empty
                                <li class="text-muted fst-italic">None assigned</li>
                            @endforelse
                            @if($hasMoreMods)
                                <li class="module-category-read-more-wrap">
                                    <a href="{{ route('roles.edit', $rid) }}" class="role-read-more-link">Read more</a>
                                </li>
                            @endif
                        </ul>
                        @if($canEdit)
                            <div class="mt-3 d-flex gap-1 justify-content-end align-items-center">
                                <a href="{{ route('roles.edit', $rid) }}" class="icon-action edit" title="Edit role"><i class="bi bi-pencil"></i></a>
                                <form method="POST" action="{{ route('roles.store') }}" class="d-inline m-0" data-delete-form="true" data-delete-message="Delete this role?">
                                    @csrf
                                    <input type="hidden" name="action" value="delete">
                                    <input type="hidden" name="role_id" value="{{ $rid }}">
                                    <input type="hidden" name="role_name" value="{{ $r->role_name }}">
                                    <button class="icon-action delete" type="submit" title="Delete role"><i class="bi bi-trash"></i></button>
                                </form>
                            </div>
                        @endif
                    </div>
                </div>
            </div>
        @endforeach
    </div>

    @if($canEdit)
        <div class="offcanvas offcanvas-end" tabindex="-1" id="addRoleDrawer">
            <div class="offcanvas-header"><h5 class="offcanvas-title">Add New Role</h5><button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button></div>
            <div class="offcanvas-body">
                <form method="POST" action="{{ route('roles.store') }}">
                    @csrf
                    <input type="hidden" name="action" value="create">
                    <div class="mb-3">
                        <label class="form-label">Role Name</label>
                        <input type="text" name="role_name" class="form-control" required>
                    </div>
                    <button class="btn btn-add w-100" type="submit">Create Role</button>
                </form>
            </div>
        </div>
    @endif
    </div>
@endsection
