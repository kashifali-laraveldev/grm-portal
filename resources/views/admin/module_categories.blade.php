@extends('layouts.admin')

@section('content')
    @php $canEdit = in_array('Super Admin', session('admin_role_names', []), true); @endphp
    <div class="legal-entity-page">
    <div class="page-head legal-head">
        <div class="legal-head-left">
            <div class="breadcrumb-dark">Admin <span class="sep">/</span> Manage Modules <span class="sep">/</span> Module Categories</div>
            <h4 class="page-title">Module Categories</h4>
        </div>
        @if($canEdit)
            <button class="btn btn-add legal-add-btn" type="button" onclick="openAddDrawer('addCategoryDrawer')">
                <i class="bi bi-plus-circle me-1"></i>Add Module Category
            </button>
        @endif
    </div>

    <div class="row g-3 mb-4">
        @foreach($categories as $category)
            @php $mods = $moduleNamesByCategory[$category->ID] ?? []; @endphp
            <div class="col-12 col-md-6 col-xl-3">
                <div class="module-category-card h-100">
                    <div class="module-category-card-header">{{ $category->category_name }}</div>
                    <div class="module-category-card-body">
                        <div class="small text-muted mb-2">Total modules: <strong class="text-dark">{{ count($mods) }}</strong></div>
                        <ul class="module-category-module-list small mb-0">
                            @foreach(array_slice($mods, 0, 4) as $moduleName)
                                <li>{{ $moduleName }}</li>
                            @endforeach
                            @if(count($mods) > 4)
                                <li class="module-category-read-more-wrap">
                                    <a href="{{ route('manage_modules.index') }}" class="role-read-more-link">Read more</a>
                                </li>
                            @endif
                        </ul>
                        @if($canEdit)
                            <div class="mt-3 d-flex gap-1 justify-content-end align-items-center">
                                <button type="button" class="icon-action edit" title="Edit"
                                    onclick="document.getElementById('editCategoryForm').action='{{ route('manage_modules.categories.update', $category->ID) }}'; openEditDrawer('editCategoryDrawer', {{ \Illuminate\Support\Js::from([
                                        'category_name' => $category->category_name,
                                        'css_class' => $category->css_class,
                                        'display_order' => $category->display_order,
                                    ]) }});">
                                    <i class="bi bi-pencil"></i>
                                </button>
                                <form method="POST" action="{{ route('manage_modules.categories.destroy', $category->ID) }}" class="d-inline m-0" data-delete-form="true" data-delete-message="Delete this module category?">
                                    @csrf
                                    @method('DELETE')
                                    <button class="icon-action delete" type="submit" title="Delete"><i class="bi bi-trash"></i></button>
                                </form>
                            </div>
                        @endif
                    </div>
                </div>
            </div>
        @endforeach
    </div>

    @if($canEdit)
    <div class="offcanvas offcanvas-end" tabindex="-1" id="addCategoryDrawer">
        <div class="offcanvas-header"><h5 class="offcanvas-title">Add Module Category</h5><button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button></div>
        <div class="offcanvas-body">
            <form method="POST" action="{{ route('manage_modules.categories.store') }}">
                @csrf
                <div class="mb-2"><label class="form-label">Category Name</label><input class="form-control" name="category_name" required></div>
                <div class="mb-2"><label class="form-label">CSS Class</label><input class="form-control" name="css_class"></div>
                <div class="mb-2"><label class="form-label">Display Order</label><input class="form-control" name="display_order" type="number" value="1"></div>
                <button class="btn btn-add w-100" type="submit">Save</button>
            </form>
        </div>
    </div>
    <div class="offcanvas offcanvas-end" tabindex="-1" id="editCategoryDrawer">
        <div class="offcanvas-header"><h5 class="offcanvas-title">Edit Module Category</h5><button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button></div>
        <div class="offcanvas-body">
            <form method="POST" id="editCategoryForm" action="#">
                @csrf
                @method('PUT')
                <div class="mb-2"><label class="form-label">Category Name</label><input class="form-control" name="category_name" required></div>
                <div class="mb-2"><label class="form-label">CSS Class</label><input class="form-control" name="css_class"></div>
                <div class="mb-2"><label class="form-label">Display Order</label><input class="form-control" name="display_order" type="number" value="1"></div>
                <button class="btn btn-add w-100" type="submit">Update</button>
            </form>
        </div>
    </div>
    @endif
    </div>
@endsection
