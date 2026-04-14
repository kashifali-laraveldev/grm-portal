@extends('layouts.admin')

@section('content')
    <div class="timeline-view-page legal-entity-page">
    <div class="page-head legal-head">
        <div class="legal-head-left">
            <div class="breadcrumb-dark">Dashboard <span class="sep">/</span> Timeline View</div>
            <h4 class="page-title">Timeline View</h4>
        </div>
        <div class="text-muted small align-self-start pt-1">Today: {{ $today->toDateString() }}</div>
    </div>

    <div class="card fade-in-up legal-card legal-table-shell mb-3">
        <div class="card-body">
            <div class="legal-table-search-block mb-2">
                <div id="timelineDatatableSearchMount" class="legal-datatable-search-mount"></div>
            </div>
            <div class="table-container">
                <div class="table-responsive">
                    <table class="table timeline-table legal-entity-table w-100" id="timelineTable">
                        <thead class="table-light">
                            <tr>
                                <th>Deadline</th>
                                <th>Entity</th>
                                <th>Deliverable</th>
                                <th>Submission</th>
                                <th>Reviewed</th>
                                <th>Completed</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse($rows as $row)
                                @php
                                    $deadline = \Carbon\Carbon::parse($row->deadline_date)->startOfDay();
                                    $submission = $row->submission_date ? \Carbon\Carbon::parse($row->submission_date)->startOfDay() : null;
                                    $todaySd = $today->copy()->startOfDay();

                                    $pillClass = 'neutral';
                                    $statusLabel = 'NOT DUE';

                                    if ($submission) {
                                        if ($submission->gt($deadline)) {
                                            $pillClass = 'timeline-delayed';
                                            $statusLabel = 'DELAYED';
                                        } elseif ($submission->eq($deadline)) {
                                            $pillClass = 'timeline-on-time';
                                            $statusLabel = 'ON TIME';
                                        } else {
                                            $pillClass = 'timeline-before-time';
                                            $statusLabel = 'BEFORE TIME';
                                        }
                                    } else {
                                        $inDays = $deadline->diffInDays($todaySd, false);
                                        if ($inDays < 0) {
                                            $pillClass = 'timeline-not-due';
                                            $statusLabel = 'NOT DUE';
                                        } elseif ($inDays === 0) {
                                            $pillClass = 'timeline-due-today';
                                            $statusLabel = 'DUE TODAY';
                                        } else {
                                            $pillClass = 'timeline-overdue';
                                            $statusLabel = 'OVERDUE';
                                        }
                                    }
                                @endphp
                                <tr>
                                    <td class="mono">{{ $row->deadline_date }}</td>
                                    <td>{{ $row->entity_name }}</td>
                                    <td>{{ $row->item_title }}</td>
                                    <td>{{ $row->submission_date ?? '—' }}</td>
                                    <td>{{ $row->reviewed_date ?? '—' }}</td>
                                    <td>{{ $row->completed_date ?? '—' }}</td>
                                    <td>
                                        <span class="status-pill {{ $pillClass }}">{{ $statusLabel }}</span>
                                    </td>
                                </tr>
                            @empty
                                <tr>
                                    <td colspan="7" class="text-center text-muted py-4">No timeline data available.</td>
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

@push('scripts')
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            if (window.jQuery && jQuery('#timelineTable').length) {
                var $mount = jQuery('#timelineDatatableSearchMount');
                jQuery('#timelineTable').DataTable({
                    pageLength: 25,
                    order: [[0, 'asc']],
                    lengthChange: false,
                    pagingType: 'simple_numbers',
                    searching: true,
                    dom: "<'legal-common-search-wrap mb-0'f>t<'legal-table-footer d-flex justify-content-between align-items-center mt-2 pt-2'<'legal-footer-info'i><'legal-footer-pagination'p>>",
                    initComplete: function () {
                        var $wrap = jQuery('#timelineTable_wrapper').children('.legal-common-search-wrap').first();
                        if ($wrap.length && $mount.length) {
                            $wrap.appendTo($mount);
                        } else {
                            jQuery('#timelineTable_filter').appendTo($mount);
                        }
                        jQuery('#timelineTable_filter input[type="search"]').attr('placeholder', 'Search...');
                    }
                });
            }
        });
    </script>
@endpush
