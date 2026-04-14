@extends('layouts.admin')

@section('content')
    <div class="legal-entity-page">
    <div class="page-head legal-head">
        <div class="legal-head-left">
            <div class="breadcrumb-dark">Manage Deliverables <span class="sep">/</span> All Deliverables</div>
            <h4 class="page-title">All Deliverables</h4>
        </div>
    </div>

    <div class="card fade-in-up legal-card legal-table-shell mb-3">
        <div class="card-body">
            <div class="legal-table-search-block mb-2">
                <div id="deliverablesAllTableSearchMount" class="legal-datatable-search-mount"></div>
            </div>
            <div class="table-container">
            <div class="table-responsive">
                <table class="table legal-entity-table w-100" id="deliverablesAllTable">
                    <thead class="table-light">
                        <tr>
                            <th>#</th>
                            <th>Deliverable</th>
                            <th>Short Code</th>
                            <th>Default</th>
                            <th>Reminder</th>
                            <th>Annual</th>
                            <th>Available Years</th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse($itemsWithYears as $idx => $row)
                            <tr>
                                <td>{{ $idx + 1 }}</td>
                                <td>{{ $row['item']->title }}</td>
                                <td class="mono">{{ $row['item']->short_name }}</td>
                                <td><span class="status-pill {{ $row['item']->is_default ? 'active' : 'neutral' }}">{{ $row['item']->is_default ? 'Yes' : 'No' }}</span></td>
                                <td><span class="status-pill {{ $row['item']->is_reminder ? 'active' : 'neutral' }}">{{ $row['item']->is_reminder ? 'Yes' : 'No' }}</span></td>
                                <td><span class="status-pill {{ $row['item']->is_annual ? 'active' : 'neutral' }}">{{ $row['item']->is_annual ? 'Yes' : 'No' }}</span></td>
                                <td>{{ count($row['years']) ? implode(', ', $row['years']) : '-' }}</td>
                            </tr>
                        @empty
                            <tr>
                                <td colspan="7" class="text-center text-muted">No deliverables found.</td>
                            </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            if (window.jQuery && $('#deliverablesAllTable').length) {
                const $mount = $('#deliverablesAllTableSearchMount');
                $('#deliverablesAllTable').DataTable({
                    pageLength: 25,
                    order: [[0, 'asc']],
                    lengthChange: false,
                    pagingType: 'simple_numbers',
                    searching: true,
                    dom: "<'legal-common-search-wrap mb-0'f>t<'legal-table-footer d-flex justify-content-between align-items-center mt-2 pt-2'<'legal-footer-info'i><'legal-footer-pagination'p>>",
                    initComplete: function () {
                        const $wrap = $('#deliverablesAllTable_wrapper').children('.legal-common-search-wrap').first();
                        if ($wrap.length && $mount.length) {
                            $wrap.appendTo($mount);
                        } else {
                            $('#deliverablesAllTable_filter').appendTo($mount);
                        }
                        $('#deliverablesAllTable_filter input[type="search"]').attr('placeholder', 'Search...');
                    }
                });
            }
        });
    </script>
    </div>
@endsection
