@extends('layouts.admin')

@section('content')
    <div class="legal-entity-page">
    <div class="page-head legal-head">
        <div class="legal-head-left">
            <div class="breadcrumb-dark">Admin <span class="sep">/</span> Manage Modules</div>
            <h4 class="page-title">Modules Listing</h4>
        </div>
    </div>

    <div class="card fade-in-up legal-card legal-table-shell mb-3">
        <div class="card-body">
            <div class="legal-table-search-block mb-2">
                <div id="modulesTableSearchMount" class="legal-datatable-search-mount"></div>
            </div>
            <div class="table-container">
            <div class="table-responsive">
                <table class="table legal-entity-table w-100" id="modulesTable">
                    <thead class="table-light">
                        <tr>
                            <th>Module Name</th>
                            <th>Route</th>
                            <th>Category</th>
                            <th>Assigned Roles</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($modules as $m)
                            @php
                                $rids = $roleIdsByModule[$m->ID] ?? [];
                                $roleNames = [];
                                foreach ($rids as $rid) {
                                    if (isset($roles[$rid])) $roleNames[] = $roles[$rid];
                                }
                            @endphp
                            <tr>
                                <td>{{ $m->module_name }}</td>
                                <td class="mono">{{ $m->route }}</td>
                                <td>{{ $categories[$m->module_category_ID] ?? '-' }}</td>
                                <td>
                                    @forelse($roleNames as $rn)
                                        <span class="status-pill active me-1">{{ $rn }}</span>
                                    @empty
                                        -
                                    @endforelse
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
            if (window.jQuery && $('#modulesTable').length) {
                const $mount = $('#modulesTableSearchMount');
                $('#modulesTable').DataTable({
                    pageLength: 25,
                    order: [[0, 'asc']],
                    lengthChange: false,
                    pagingType: 'simple_numbers',
                    searching: true,
                    dom: "<'legal-common-search-wrap mb-0'f>t<'legal-table-footer d-flex justify-content-between align-items-center mt-2 pt-2'<'legal-footer-info'i><'legal-footer-pagination'p>>",
                    initComplete: function () {
                        const $wrap = $('#modulesTable_wrapper').children('.legal-common-search-wrap').first();
                        if ($wrap.length && $mount.length) {
                            $wrap.appendTo($mount);
                        } else {
                            $('#modulesTable_filter').appendTo($mount);
                        }
                        $('#modulesTable_filter input[type="search"]').attr('placeholder', 'Search...');
                    }
                });
            }
        });
    </script>
    </div>
@endsection
