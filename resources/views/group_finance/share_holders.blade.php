@extends('layouts.admin')

@section('content')
    <div class="share-holders-page finance-statistics-page legal-entity-page">
    <div class="page-head legal-head">
        <div class="legal-head-left">
            <div class="breadcrumb-dark">Dashboard <span class="sep">/</span> Group Finance Matrix <span class="sep">/</span> Share Holders</div>
            <h4 class="page-title">Share Holders</h4>
        </div>
    </div>

    <div class="finance-kpi-grid row g-3 mb-3">
        <div class="col-12 col-md-6">
            <div class="finance-kpi-tile finance-kpi-tile--capital">
                <div class="finance-kpi-tile-icon" aria-hidden="true"><i class="bi bi-diagram-3"></i></div>
                <div>
                    <div class="finance-kpi-label">Total Relationships</div>
                    <div class="finance-kpi-value">{{ $rows->count() }}</div>
                </div>
            </div>
        </div>
        <div class="col-12 col-md-6">
            <div class="finance-kpi-tile finance-kpi-tile--shares">
                <div class="finance-kpi-tile-icon" aria-hidden="true"><i class="bi bi-people-fill"></i></div>
                <div>
                    <div class="finance-kpi-label">Unique Shareholders</div>
                    <div class="finance-kpi-value">{{ count($summary) }}</div>
                </div>
            </div>
        </div>
    </div>

    <div class="card fade-in-up legal-card legal-table-shell mb-3">
        <div class="card-body">
            @if($rows->isNotEmpty())
            <div class="legal-table-search-block mb-2">
                <div id="shareholderDatatableSearchMount" class="legal-datatable-search-mount"></div>
            </div>
            @endif
            <div class="table-container">
                <div class="table-responsive">
                    <table class="table legal-entity-table w-100" id="shareholderTable">
                        <thead class="table-light">
                            <tr>
                                <th>Shareholder Entity</th>
                                <th>Owned Entity</th>
                                <th>Ownership %</th>
                                <th>Country</th>
                                <th>Status</th>
                                <th>Category</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse($rows as $row)
                                <tr>
                                    <td class="mono">{{ $row->shareholder_code ?? 'N/A' }}</td>
                                    <td>{{ $row->owned_code }} - {{ $row->owned_name }}</td>
                                    <td class="text-end">{{ $row->ownership_percentage !== null && $row->ownership_percentage !== '' ? $row->ownership_percentage : '—' }}</td>
                                    <td>{{ $row->country_name ?? '—' }}</td>
                                    <td>
                                        @php
                                            $status = (string)($row->company_status ?? '');
                                            $statusLabel = $status !== '' ? ucwords(str_replace('_', ' ', $status)) : '—';
                                            $stRaw = strtolower($status);
                                            $pill = str_contains($stRaw, 'active') ? 'active' : (str_contains($stRaw, 'dormant') ? 'dormant' : (str_contains($stRaw, 'disposed') ? 'disposed' : (str_contains($stRaw, 'under_liquidation') ? 'under-liquidation' : (str_contains($stRaw, 'liquid') ? 'liquidation' : 'neutral'))));
                                        @endphp
                                        @if($status !== '')
                                            <span class="status-pill {{ $pill }}">{{ $statusLabel }}</span>
                                        @else
                                            —
                                        @endif
                                    </td>
                                    <td>{{ $row->category_name ?? '—' }}</td>
                                </tr>
                            @empty
                                <tr>
                                    <td colspan="6" class="text-center text-muted py-4">No shareholder relationships available.</td>
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
            if (!jQuery('#shareholderTable').length) return;

            var $mount = jQuery('#shareholderDatatableSearchMount');
            jQuery('#shareholderTable').DataTable({
                pageLength: 25,
                order: [[0, 'asc']],
                lengthChange: false,
                pagingType: 'simple_numbers',
                searching: true,
                dom: "<'legal-common-search-wrap mb-0'f>t<'legal-table-footer d-flex justify-content-between align-items-center mt-2 pt-2'<'legal-footer-info'i><'legal-footer-pagination'p>>",
                initComplete: function () {
                    var $wrap = jQuery('#shareholderTable_wrapper').children('.legal-common-search-wrap').first();
                    if ($wrap.length && $mount.length) {
                        $wrap.appendTo($mount);
                    } else {
                        jQuery('#shareholderTable_filter').appendTo($mount);
                    }
                    jQuery('#shareholderTable_filter input[type="search"]').attr('placeholder', 'Search...');
                }
            });
        });
    </script>
@endpush
@endif
