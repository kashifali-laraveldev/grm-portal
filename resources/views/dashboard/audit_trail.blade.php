@extends('layouts.admin')

@section('content')
    <div class="audit-trail-page legal-entity-page">
    <div class="page-head legal-head">
        <div class="legal-head-left">
            <div class="breadcrumb-dark">Dashboard <span class="sep">/</span> Audit Trail</div>
            <h4 class="page-title">Audit Trail</h4>
        </div>
    </div>

    <div class="card fade-in-up legal-card legal-table-shell mb-3">
        <div class="card-body">
            @if($rows->isNotEmpty())
            <div class="legal-table-search-block mb-2">
                <div id="auditDatatableSearchMount" class="legal-datatable-search-mount"></div>
            </div>
            @endif
            <div class="table-container">
                <div class="table-responsive">
                    <table class="table legal-entity-table w-100" id="auditTable">
                        <thead class="table-light">
                            <tr>
                                <th>When</th>
                                <th>User</th>
                                <th>Event</th>
                                <th>Auditable</th>
                                <th>URL</th>
                                <th>IP</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse($rows as $log)
                                <tr>
                                    <td class="mono">{{ $log->created_at }}</td>
                                    <td>{{ $log->user_type ?? '—' }} <span class="mono">#{{ $log->user_id ?? '—' }}</span></td>
                                    <td>{{ $log->event ?? '—' }}</td>
                                    <td>{{ $log->auditable_type ?? '—' }} #{{ $log->auditable_id ?? '—' }}</td>
                                    <td class="small text-truncate audit-url-cell" style="max-width: 220px;" title="{{ $log->url }}">{{ $log->url ?? '—' }}</td>
                                    <td>{{ $log->ip_address ?? '—' }}</td>
                                </tr>
                            @empty
                                <tr>
                                    <td colspan="6" class="text-center text-muted py-4">No audit entries found.</td>
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
            if (!jQuery('#auditTable').length) return;

            var $mount = jQuery('#auditDatatableSearchMount');
            jQuery('#auditTable').DataTable({
                pageLength: 25,
                order: [[0, 'desc']],
                lengthChange: false,
                pagingType: 'simple_numbers',
                searching: true,
                dom: "<'legal-common-search-wrap mb-0'f>t<'legal-table-footer d-flex justify-content-between align-items-center mt-2 pt-2'<'legal-footer-info'i><'legal-footer-pagination'p>>",
                initComplete: function () {
                    var $wrap = jQuery('#auditTable_wrapper').children('.legal-common-search-wrap').first();
                    if ($wrap.length && $mount.length) {
                        $wrap.appendTo($mount);
                    } else {
                        jQuery('#auditTable_filter').appendTo($mount);
                    }
                    jQuery('#auditTable_filter input[type="search"]').attr('placeholder', 'Search...');
                }
            });
        });
    </script>
@endpush
@endif
