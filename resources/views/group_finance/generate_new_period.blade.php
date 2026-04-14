@extends('layouts.admin')

@section('content')
    @php $canEdit = in_array('Super Admin', session('admin_role_names', []), true); @endphp

    <div class="legal-entity-page">
        <div class="page-head legal-head">
            <div class="legal-head-left">
                <div class="breadcrumb-dark">Dashboard <span class="sep">/</span> Group Finance Matrix <span class="sep">/</span> Generate New Period</div>
                <h4 class="page-title">Generate New Period</h4>
            </div>
            @if($canEdit)
                <button class="btn btn-add legal-add-btn" type="button" onclick="GrmUI.openDrawer('periodDrawer')">
                    <i class="bi bi-plus-circle me-1"></i>Generate New Period
                </button>
            @endif
        </div>

        <div class="card fade-in-up legal-card legal-table-shell mb-3">
            <div class="card-body">
                @if($periods->isNotEmpty())
                    <div class="legal-table-search-block mb-2">
                        <div id="generatedPeriodsDatatableSearchMount" class="legal-datatable-search-mount"></div>
                    </div>
                @endif
                <div class="table-container">
                    <div class="table-responsive">
                        <table class="table legal-entity-table w-100" id="generatedPeriodsTable">
                            <thead class="table-light">
                                <tr>
                                    <th>#</th>
                                    <th>Year</th>
                                    <th>Month</th>
                                    <th>Status</th>
                                    <th>Created At</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse($periods as $idx => $p)
                                    <tr>
                                        <td class="mono">{{ $idx + 1 }}</td>
                                        <td>{{ $p->reporting_year }}</td>
                                        <td>{{ $p->reporting_month }}</td>
                                        <td>
                                            @if((int)($p->status ?? 0) === 1)
                                                <span class="status-pill active">Active</span>
                                            @else
                                                <span class="status-pill neutral">Inactive</span>
                                            @endif
                                        </td>
                                        <td>{{ $p->created_at ? $p->created_at->format('Y-m-d H:i') : '—' }}</td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td colspan="5" class="text-center text-muted py-4">No June / December periods found. Add one with Generate New Period.</td>
                                    </tr>
                                @endforelse
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="offcanvas offcanvas-end" tabindex="-1" id="periodDrawer" aria-labelledby="periodDrawerLabel" data-bs-scroll="false" data-bs-backdrop="true">
        <div class="offcanvas-header border-bottom align-items-start">
            <div class="pe-2">
                <h5 class="offcanvas-title fw-bold mb-0" id="periodDrawerLabel">Generate New Period</h5>
                <div class="small text-muted mt-1">New period becomes active; others inactive.</div>
            </div>
            <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <div class="offcanvas-body">
            <form method="POST" action="{{ route('group_finance.generate_new_period.store') }}" data-ajax-form="true">
                @csrf
                <div class="mb-3">
                    <label class="form-label">Year</label>
                    @include('partials.grm-year-select', ['name' => 'year', 'selected' => $defaultYear ?? 2026, 'required' => true])
                </div>
                <div class="mb-3">
                    <label class="form-label">Month</label>
                    @include('partials.grm-month-select', ['name' => 'period', 'selected' => 'June', 'required' => true])
                </div>
                <button type="submit" class="btn btn-add btn-filter legal-filter-btn w-100">Generate</button>
            </form>
        </div>
    </div>
@endsection

@push('scripts')
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var el = document.getElementById('periodDrawer');
            if (!el || !window.bootstrap) return;
            bootstrap.Offcanvas.getOrCreateInstance(el).hide();
        });
    </script>
@endpush

@if($periods->isNotEmpty())
    @push('scripts')
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                if (!window.jQuery || !jQuery.fn.DataTable) return;
                if (!jQuery('#generatedPeriodsTable').length) return;

                var $mount = jQuery('#generatedPeriodsDatatableSearchMount');
                jQuery('#generatedPeriodsTable').DataTable({
                    pageLength: 25,
                    order: [[1, 'desc'], [2, 'asc']],
                    lengthChange: false,
                    pagingType: 'simple_numbers',
                    searching: true,
                    dom: "<'legal-common-search-wrap mb-0'f>t<'legal-table-footer d-flex justify-content-between align-items-center mt-2 pt-2'<'legal-footer-info'i><'legal-footer-pagination'p>>",
                    initComplete: function () {
                        var $wrap = jQuery('#generatedPeriodsTable_wrapper').children('.legal-common-search-wrap').first();
                        if ($wrap.length && $mount.length) {
                            $wrap.appendTo($mount);
                        } else {
                            jQuery('#generatedPeriodsTable_filter').appendTo($mount);
                        }
                        jQuery('#generatedPeriodsTable_filter input[type="search"]').attr('placeholder', 'Search...');
                    }
                });
            });
        </script>
    @endpush
@endif
