@extends('layouts.admin')

@section('content')
    <div class="draft-entities-page finance-statistics-page legal-entity-page">
        <div class="page-head legal-head">
            <div class="legal-head-left">
                <div class="breadcrumb-dark">Dashboard <span class="sep">/</span> Group Finance Matrix <span class="sep">/</span> Draft Entities</div>
                <h4 class="page-title">Draft Entities</h4>
            </div>
        </div>

        <div class="finance-kpi-grid row g-3 mb-3">
            <div class="col-12 col-md-6">
                <div class="finance-kpi-tile finance-kpi-tile--capital">
                    <div class="finance-kpi-tile-icon" aria-hidden="true"><i class="bi bi-file-earmark-text"></i></div>
                    <div>
                        <div class="finance-kpi-label">Total Draft Entities</div>
                        <div class="finance-kpi-value">{{ $rows->count() }}</div>
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-6">
                <div class="finance-kpi-tile finance-kpi-tile--shares">
                    <div class="finance-kpi-tile-icon" aria-hidden="true"><i class="bi bi-hourglass-split"></i></div>
                    <div>
                        <div class="finance-kpi-label">By Status</div>
                        @if(!empty($byStatus))
                            <div class="mt-1">
                                @foreach($byStatus as $status => $count)
                                    <div class="d-flex align-items-center justify-content-between gap-3">
                                        <span class="small text-muted">{{ ucwords(str_replace('_', ' ', (string)$status)) }}</span>
                                        <span class="small fw-semibold text-body">{{ $count }}</span>
                                    </div>
                                @endforeach
                            </div>
                        @else
                            <div class="small text-muted mt-1">No draft entities found.</div>
                        @endif
                    </div>
                </div>
            </div>
        </div>

        <div class="card fade-in-up legal-card legal-table-shell mb-3">
            <div class="card-body">
                @if($rows->isNotEmpty())
                    <div class="legal-table-search-block mb-2">
                        <div id="draftDatatableSearchMount" class="legal-datatable-search-mount"></div>
                    </div>
                @endif

                <div class="table-container">
                    <div class="table-responsive">
                        <table class="table legal-entity-table w-100" id="draftEntitiesTable">
                            <thead class="table-light">
                                <tr>
                                    <th>Entity #</th>
                                    <th>Legal Entity Name</th>
                                    <th>Status</th>
                                    <th>Legal Type</th>
                                    <th>Country</th>
                                    <th>Incorporation Date</th>
                                    <th class="text-end">Share Capital</th>
                                    <th class="text-end">No. of Shares</th>
                                    <th>Category</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse($rows as $row)
                                    <tr>
                                        <td class="mono">{{ $row->entity_code }}</td>
                                        <td>{{ $row->entity_name }}</td>
                                        <td>
                                            @php
                                                $status = (string)($row->company_status ?? '');
                                                $statusLabel = $status !== '' ? ucwords(str_replace('_', ' ', $status)) : '—';
                                                $pill = 'neutral';
                                                if ($status !== '') {
                                                    $stRaw = strtolower($status);
                                                    $pill = str_contains($stRaw, 'active') ? 'active'
                                                        : (str_contains($stRaw, 'dormant') ? 'dormant'
                                                        : (str_contains($stRaw, 'disposed') ? 'disposed'
                                                        : (str_contains($stRaw, 'under_liquidation') ? 'under-liquidation'
                                                        : (str_contains($stRaw, 'liquid') ? 'liquidation' : 'neutral'))));
                                                }
                                            @endphp

                                            @if($status !== '')
                                                <span class="status-pill {{ $pill }}">{{ $statusLabel }}</span>
                                            @else
                                                —
                                            @endif
                                        </td>
                                        <td>{{ $row->legal_entity_type ?? '—' }}</td>
                                        <td>{{ $row->country_name ?? '—' }}</td>
                                        <td>{{ $row->incorporation_date ?? '—' }}</td>
                                        <td class="text-end">
                                            {{ isset($row->share_capital) && $row->share_capital !== null && $row->share_capital !== '' ? number_format((float)$row->share_capital, 0) : '—' }}
                                        </td>
                                        <td class="text-end">
                                            {{ isset($row->number_of_shares) && $row->number_of_shares !== null && $row->number_of_shares !== '' ? number_format((float)$row->number_of_shares, 0) : '—' }}
                                        </td>
                                        <td>{{ $row->category_name ?? '—' }}</td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td colspan="9" class="text-center text-muted py-4">No draft entities available.</td>
                                    </tr>
                                @endforelse
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@if($rows->isNotEmpty())
    @push('scripts')
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                if (!window.jQuery || !jQuery.fn.DataTable) return;
                if (!jQuery('#draftEntitiesTable').length) return;

                var $mount = jQuery('#draftDatatableSearchMount');
                jQuery('#draftEntitiesTable').DataTable({
                    pageLength: 25,
                    order: [[0, 'asc']],
                    lengthChange: false,
                    pagingType: 'simple_numbers',
                    searching: true,
                    dom: "<'legal-common-search-wrap mb-0'f>t<'legal-table-footer d-flex justify-content-between align-items-center mt-2 pt-2'<'legal-footer-info'i><'legal-footer-pagination'p>>",
                    initComplete: function () {
                        var $wrap = jQuery('#draftEntitiesTable_wrapper').children('.legal-common-search-wrap').first();
                        if ($wrap.length && $mount.length) {
                            $wrap.appendTo($mount);
                        } else {
                            jQuery('#draftEntitiesTable_filter').appendTo($mount);
                        }
                        jQuery('#draftEntitiesTable_filter input[type=\"search\"]').attr('placeholder', 'Search...');
                    }
                });
            });
        </script>
    @endpush
@endif

