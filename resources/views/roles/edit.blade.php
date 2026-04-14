@extends('layouts.admin')

@section('content')
    @php
        $grouped = [];
        foreach ($modules as $m) {
            $cid = (int)($m->module_category_ID ?? 0);
            $grouped[$cid][] = $m;
        }
    @endphp
    <div class="legal-entity-page">
    <div class="page-head legal-head">
        <div class="legal-head-left">
            <div class="breadcrumb-dark">Admin <span class="sep">/</span> Roles Management <span class="sep">/</span> Edit Role</div>
            <h4 class="page-title">Edit Role — {{ $role->role_name }}</h4>
        </div>
        <a href="{{ route('roles.index') }}" class="btn btn-ghost btn-filter legal-filter-btn"><i class="bi bi-arrow-left me-1"></i>Back to roles</a>
    </div>

    <form method="POST" action="{{ route('roles.update', $role->ID) }}">
        @csrf
        @method('PUT')

        <div class="card fade-in-up legal-card mb-3">
            <div class="card-body">
                <label class="form-label">Role Name</label>
                <input type="text" class="form-control" name="role_name" value="{{ $role->role_name }}" required>
            </div>
        </div>

        @foreach($grouped as $categoryId => $mods)
            <div class="card fade-in-up legal-card permission-module-card mb-3">
                <div class="card-body">
                    <div class="permission-module-card-title">{{ $moduleCategories[$categoryId] ?? 'Other Modules' }}</div>
                    <div class="permission-check-grid">
                        @foreach($mods as $mod)
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="module_ids[]" value="{{ $mod->ID }}" id="m_{{ $mod->ID }}" @checked(in_array((int)$mod->ID, $selectedModuleIds, true))>
                                <label class="form-check-label" for="m_{{ $mod->ID }}">{{ $mod->module_name }}</label>
                            </div>
                        @endforeach
                    </div>
                </div>
            </div>
        @endforeach

        <div class="d-flex justify-content-end gap-2 flex-wrap mb-4">
            <a href="{{ route('roles.index') }}" class="btn btn-ghost btn-filter legal-filter-btn">Cancel</a>
            <button class="btn btn-add legal-filter-btn" type="submit"><i class="bi bi-check-lg me-1"></i>Save Changes</button>
        </div>
    </form>
    </div>
@endsection
