@extends('layouts.admin')

@section('content')
    @php
        $attachmentsJsonUrl = route('group_finance.report_matrix.mapping_attachments');
    @endphp
    <div class="legal-entity-page">
    <div class="page-head legal-head">
        <div class="legal-head-left">
            <div class="breadcrumb-dark">Dashboard <span class="sep">/</span> Group Finance Matrix <span class="sep">/</span> Report Matrix</div>
            <h4 class="page-title">Report Matrix</h4>
        </div>
        @if(isset($filters['export']) && $filters['export'])
            <a href="{{ route('group_finance.report_matrix') }}" class="btn btn-ghost legal-add-btn align-self-start"><i class="bi bi-arrow-left me-1"></i>Back</a>
        @endif
    </div>

    <div class="card fade-in-up legal-card legal-filter-shell mb-3">
        <div class="card-body">
            <form method="GET" action="{{ route('group_finance.report_matrix') }}" id="reportMatrixFilterForm" class="filter-card legal-filter-card mb-0">
                <div class="row g-2 align-items-end">
                    <div class="col-12 col-md-3">
                        <label class="form-label">Year</label>
                        @include('partials.grm-year-select', ['name' => 'year', 'selected' => $filters['year'] ?? 2026])
                    </div>

                    <div class="col-12 col-md-3">
                        <label class="form-label">Month</label>
                        @include('partials.grm-month-select', ['name' => 'period', 'selected' => $filters['period'] ?? 'June'])
                    </div>

                    <div class="col-12 col-md-3">
                        <label class="form-label">Entity</label>
                        <select name="entity_id" class="form-select">
                            <option value="">All</option>
                            @foreach($options['entities'] as $e)
                                <option value="{{ $e->entity_id }}" @if(($filters['entity_id'] ?? '') == $e->entity_id) selected @endif>{{ $e->entity_name }}</option>
                            @endforeach
                        </select>
                    </div>

                    <div class="col-12 col-md-3">
                        <label class="form-label">Entity Size</label>
                        <select name="entity_size" class="form-select">
                            <option value="">All</option>
                            @foreach($options['entity_sizes'] as $s)
                                <option value="{{ $s }}" @if(($filters['entity_size'] ?? '') == $s) selected @endif>{{ $s }}</option>
                            @endforeach
                        </select>
                    </div>

                    <div class="col-12 col-md-3">
                        <label class="form-label">Deliverable</label>
                        <select name="deliverable_id" class="form-select">
                            <option value="">All</option>
                            @foreach($options['deliverables'] as $d)
                                <option value="{{ $d->id }}" @if(($filters['deliverable_id'] ?? '') == $d->id) selected @endif>{{ $d->title }} ({{ $d->short_name }})</option>
                            @endforeach
                        </select>
                    </div>

                    <div class="col-12 col-md-3">
                        <label class="form-label">Assigned To</label>
                        <select name="assigned_to" class="form-select">
                            <option value="">All</option>
                            @foreach($options['assigned_to_list'] as $a)
                                <option value="{{ $a }}" @if(($filters['assigned_to'] ?? '') == $a) selected @endif>{{ $a }}</option>
                            @endforeach
                        </select>
                    </div>

                    <div class="col-12 col-md-6 d-flex gap-2 legal-filter-actions justify-content-md-end">
                        <button type="submit" class="btn btn-add btn-filter legal-filter-btn" name="action" value="filter"><i class="bi bi-funnel me-1"></i>Apply Filter</button>
                        <a href="{{ route('group_finance.report_matrix') }}" class="btn btn-ghost btn-filter legal-filter-btn"><i class="bi bi-arrow-counterclockwise me-1"></i>Reset</a>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <div class="card fade-in-up legal-card legal-table-shell mb-3">
        <div class="card-body">
            <div class="grm-rm-table-toolbar d-flex flex-wrap align-items-center justify-content-between gap-2 mb-2">
                <div class="grm-rm-search-slot flex-grow-1" style="min-width: 200px;">
                    <div id="reportMatrixTableSearchMount" class="legal-datatable-search-mount"></div>
                </div>
                <div class="d-flex flex-wrap gap-2 legal-filter-actions align-items-center flex-shrink-0">
                    <button type="submit" form="reportMatrixFilterForm" name="export" value="excel" class="btn btn-add btn-filter legal-filter-btn"><i class="bi bi-file-earmark-spreadsheet me-1"></i>Export to Excel</button>
                    <button type="submit" form="reportMatrixFilterForm" name="export" value="pdf" class="btn btn-ghost btn-filter legal-filter-btn"><i class="bi bi-file-earmark-pdf me-1"></i>Export to PDF</button>
                </div>
            </div>
            <div class="table-container grm-report-matrix-table-wrap">
            <div class="table-responsive">
                <table class="table legal-entity-table w-100 grm-report-matrix-table" id="reportMatrixTable">
                    <thead class="table-light">
                        <tr>
                            <th class="grm-rm-th-num">#</th>
                            <th class="grm-rm-th-entity">Entity Name</th>
                            <th class="grm-rm-th-type">Type</th>
                            <th class="grm-rm-th-assign">Assigned</th>
                            <th class="grm-rm-th-deliverable">Deliverable</th>
                            <th class="grm-rm-th-date">Deadline</th>
                            <th class="grm-rm-th-date">Submission</th>
                            <th class="grm-rm-th-date">Reviewed</th>
                            <th class="grm-rm-th-date">Completed</th>
                            <th class="grm-rm-th-attach">Attachments</th>
                            <th class="grm-rm-th-template">Template</th>
                            <th class="grm-rm-th-status">Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        @php $roleNames = session('admin_role_names', []); @endphp
                        @php $canEditDates = in_array('Super Admin', $roleNames, true) || in_array('Finance Admin', $roleNames, true); @endphp
                        @php $startIndex = $rows->firstItem(); @endphp
                        @foreach($rows as $row)
                            <tr>
                                <td class="mono grm-rm-td-num">{{ $startIndex++ }}</td>
                                <td class="grm-rm-td-entity"><span class="grm-rm-ellipsis" title="{{ $row->entity_name }}">{{ $row->entity_name }}</span></td>
                                <td class="grm-rm-td-type"><span class="grm-rm-ellipsis" title="{{ $row->deliverable_short_name }}">{{ $row->deliverable_short_name }}</span></td>
                                <td class="grm-rm-td-assign"><span class="grm-rm-ellipsis" title="{{ $row->assigned_to }}">{{ $row->assigned_to }}</span></td>
                                <td class="grm-rm-td-deliverable"><span class="grm-rm-ellipsis" title="{{ $row->deliverable_title }}">{{ $row->deliverable_title }}</span></td>
                                <td class="mono grm-rm-td-date">{{ $row->deadline_date ?? '-' }}</td>
                                @php $submissionVal = $row->submission_date; @endphp
                                @php $reviewedVal = $row->reviewed_date; @endphp
                                @php $completedVal = $row->completed_date; @endphp
                                <td class="mono grm-rm-td-date">
                                    @if($canEditDates)
                                        <a href="#" class="grmEditDate" data-rowid="{{ $row->id }}" data-field="submission_date" data-date="{{ $submissionVal }}">{{ $submissionVal ?? '-' }}</a>
                                    @else
                                        {{ $submissionVal ?? '-' }}
                                    @endif
                                </td>
                                <td class="mono grm-rm-td-date">
                                    @if($canEditDates)
                                        <a href="#" class="grmEditDate" data-rowid="{{ $row->id }}" data-field="reviewed_date" data-date="{{ $reviewedVal }}">{{ $reviewedVal ?? '-' }}</a>
                                    @else
                                        {{ $reviewedVal ?? '-' }}
                                    @endif
                                </td>
                                <td class="mono grm-rm-td-date">
                                    @if($canEditDates)
                                        <a href="#" class="grmEditDate" data-rowid="{{ $row->id }}" data-field="completed_date" data-date="{{ $completedVal }}">{{ $completedVal ?? '-' }}</a>
                                    @else
                                        {{ $completedVal ?? '-' }}
                                    @endif
                                </td>
                                <td class="grm-rm-td-attach">
                                    <button type="button" class="btn btn-ghost btn-filter btn-sm js-rm-open-docs"
                                        data-mapping-id="{{ $row->entity_mapping_id }}"
                                        data-entity="{{ $row->entity_name }}"
                                        data-deliverable="{{ $row->deliverable_title }}"
                                        data-count="{{ (int)($row->attachment_count ?? 0) }}">
                                        <i class="bi bi-folder2-open me-1"></i>Manage ({{ $row->attachment_count ?? 0 }})
                                    </button>
                                </td>
                                <td class="grm-rm-td-template"><span class="grm-rm-ellipsis" title="{{ $row->template_name ?? 'N/A' }}">{{ $row->template_name ?? 'N/A' }}</span></td>
                                <td class="grm-rm-td-status">
                                    @php
                                        $st = strtolower((string)$row->status_label);
                                        $cl = str_contains($st, 'overdue') ? 'disposed' : (str_contains($st, 'delay') ? 'dormant' : (str_contains($st, 'time') ? 'active' : 'neutral'));
                                    @endphp
                                    <span class="status-pill {{ $cl }} grm-rm-status-pill">{{ $row->status_label }}</span>
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
            </div>

            <div class="mt-3 grm-report-matrix-laravel-page">
                {{ $rows->onEachSide(1)->links('pagination::bootstrap-5') }}
            </div>
        </div>
    </div>

    <div class="offcanvas offcanvas-end" tabindex="-1" id="reportMatrixDocsDrawer" aria-labelledby="reportMatrixDocsDrawerLabel">
        <div class="offcanvas-header border-bottom align-items-start">
            <div class="pe-2">
                <h5 class="offcanvas-title fw-bold" id="reportMatrixDocsDrawerLabel">Document vault</h5>
                <div class="small text-muted mt-1" id="reportMatrixDocsDrawerMeta"></div>
            </div>
            <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <div class="offcanvas-body p-0 d-flex flex-column" id="reportMatrixDocsDrawerBody">
            <div class="p-3 text-muted small" id="reportMatrixDocsDrawerLoading">Loading…</div>
            <div class="p-3 d-none flex-grow-1 overflow-auto" id="reportMatrixDocsDrawerContent"></div>
        </div>
    </div>

    <div class="modal fade" id="grmEditDateModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <form method="POST" action="{{ route('group_finance.report_matrix.update_date') }}">
                    @csrf
                    <div class="modal-header">
                        <h5 class="modal-title">Edit Date</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" name="row_id" id="grmEditDateRowId" value="">
                        <input type="hidden" name="field" id="grmEditDateField" value="">
                        <div class="mb-3">
                            <label class="form-label">Date</label>
                            <input type="date" name="date" id="grmEditDateInput" class="form-control">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-add">Save</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var filterForm = document.getElementById('reportMatrixFilterForm');
            if (filterForm && window.GrmUI && window.Swal) {
                filterForm.addEventListener('submit', function () {
                    window.GrmUI.showLoader('Please wait...');
                });
            }

            var attachmentsUrl = @json($attachmentsJsonUrl);

            function rmEsc(s) {
                var d = document.createElement('div');
                d.textContent = s == null ? '' : String(s);
                return d.innerHTML;
            }

            function rmEscAttr(s) {
                return String(s == null ? '' : s).replace(/&/g, '&amp;').replace(/"/g, '&quot;').replace(/</g, '&lt;');
            }

            var docsDrawerEl = document.getElementById('reportMatrixDocsDrawer');
            var docsDrawerBody = document.getElementById('reportMatrixDocsDrawerBody');
            var docsDrawerLoading = document.getElementById('reportMatrixDocsDrawerLoading');
            var docsDrawerContent = document.getElementById('reportMatrixDocsDrawerContent');
            var docsDrawerMeta = document.getElementById('reportMatrixDocsDrawerMeta');
            var docsDrawerTitle = document.getElementById('reportMatrixDocsDrawerLabel');
            var docsDrawerBs = docsDrawerEl && window.bootstrap ? bootstrap.Offcanvas.getOrCreateInstance(docsDrawerEl) : null;

            document.querySelectorAll('.js-rm-open-docs').forEach(function (btn) {
                btn.addEventListener('click', function () {
                    var mappingId = this.getAttribute('data-mapping-id');
                    var entity = this.getAttribute('data-entity') || '';
                    var deliverable = this.getAttribute('data-deliverable') || '';
                    if (!mappingId || !docsDrawerBs) return;

                    docsDrawerTitle.textContent = 'Document vault';
                    docsDrawerMeta.innerHTML = rmEsc(entity) + (deliverable ? '<br><span class="text-body-secondary">' + rmEsc(deliverable) + '</span>' : '');
                    docsDrawerLoading.classList.remove('d-none');
                    docsDrawerContent.classList.add('d-none');
                    docsDrawerContent.innerHTML = '';
                    docsDrawerBs.show();

                    fetch(attachmentsUrl + '?mapping_id=' + encodeURIComponent(mappingId), {
                        headers: { 'Accept': 'application/json', 'X-Requested-With': 'XMLHttpRequest' }
                    }).then(function (r) { return r.json().then(function (j) { return { ok: r.ok, j: j }; }); })
                        .then(function (res) {
                            docsDrawerLoading.classList.add('d-none');
                            docsDrawerContent.classList.remove('d-none');
                            if (!res.ok || !res.j || !res.j.ok) {
                                var msg = (res.j && res.j.message) ? res.j.message : 'Could not load documents.';
                                docsDrawerContent.innerHTML = '<div class="p-3 text-danger small">' + rmEsc(msg) + '</div>';
                                if (window.GrmUI && window.Swal) window.GrmUI.showError(msg);
                                return;
                            }
                            var data = res.j;
                            var list = data.attachments || [];
                            var html = '';
                            if (list.length === 0) {
                                html = '<div class="p-4 text-center text-muted">No documents uploaded for this entity in the vault.</div>';
                            } else {
                                html += '<ul class="list-group list-group-flush grm-rm-doc-list">';
                                list.forEach(function (a) {
                                    var name = a.filename || 'File';
                                    var type = a.type || '—';
                                    var exp = a.expiry_date || '—';
                                    var link = a.download_url
                                        ? '<a class="btn btn-sm btn-add" href="' + rmEscAttr(a.download_url) + '" target="_blank" rel="noopener"><i class="bi bi-download me-1"></i>Open</a>'
                                        : '<span class="text-muted small">No file</span>';
                                    html += '<li class="list-group-item grm-rm-doc-item px-3 py-3">' +
                                        '<div class="d-flex justify-content-between align-items-start gap-2 flex-wrap">' +
                                        '<div class="min-w-0 flex-grow-1">' +
                                        '<div class="fw-semibold text-truncate" title="' + rmEscAttr(name) + '">' + rmEsc(name) + '</div>' +
                                        '<div class="small text-muted mt-1">Type: ' + rmEsc(type) + ' · Expires: ' + rmEsc(exp) + '</div>' +
                                        '</div>' +
                                        '<div class="flex-shrink-0">' + link + '</div>' +
                                        '</div></li>';
                                });
                                html += '</ul>';
                            }
                            if (data.detail_url) {
                                html += '<div class="p-3 border-top bg-light mt-auto"><a class="btn btn-ghost btn-filter legal-filter-btn w-100" href="' +
                                    rmEscAttr(data.detail_url) + '"><i class="bi bi-box-arrow-up-right me-1"></i>Open full entity page</a></div>';
                            }
                            docsDrawerContent.innerHTML = html;
                        })
                        .catch(function () {
                            docsDrawerLoading.classList.add('d-none');
                            docsDrawerContent.classList.remove('d-none');
                            docsDrawerContent.innerHTML = '<div class="p-3 text-danger small">Network error.</div>';
                            if (window.GrmUI && window.Swal) window.GrmUI.showError('Could not load documents.');
                        });
                });
            });

            if (window.jQuery && $('#reportMatrixTable').length) {
                const $mount = $('#reportMatrixTableSearchMount');
                $('#reportMatrixTable').DataTable({
                    pageLength: 50,
                    order: [[0, 'desc']],
                    lengthChange: false,
                    pagingType: 'simple_numbers',
                    searching: true,
                    autoWidth: false,
                    columnDefs: [
                        { orderable: false, targets: [9, 10] },
                        { width: '44px', targets: [0] },
                        { width: '11%', targets: [1] },
                        { width: '72px', targets: [2] },
                        { width: '88px', targets: [3] },
                        { width: '12%', targets: [4] },
                        { width: '102px', targets: [5, 6, 7, 8] },
                        { width: '120px', targets: [9] },
                        { width: '11%', targets: [10] },
                        { width: '128px', targets: [11] },
                    ],
                    dom: "<'legal-common-search-wrap mb-0'f>t<'legal-table-footer d-flex justify-content-between align-items-center mt-2 pt-2'<'legal-footer-info'i><'legal-footer-pagination'p>>",
                    initComplete: function () {
                        const $wrap = $('#reportMatrixTable_wrapper').children('.legal-common-search-wrap').first();
                        if ($wrap.length && $mount.length) {
                            $wrap.appendTo($mount);
                        } else {
                            $('#reportMatrixTable_filter').appendTo($mount);
                        }
                        $('#reportMatrixTable_filter input[type="search"]').attr('placeholder', 'Search...');
                    }
                });
            }

            const editModalEl = document.getElementById('grmEditDateModal');
            const editFieldEl = document.getElementById('grmEditDateField');
            const editRowIdEl = document.getElementById('grmEditDateRowId');
            const editDateEl = document.getElementById('grmEditDateInput');
            if (editModalEl) {
                const editModal = new bootstrap.Modal(editModalEl);
                document.querySelectorAll('.grmEditDate').forEach(function (link) {
                    link.addEventListener('click', function (e) {
                        e.preventDefault();
                        const rowId = this.getAttribute('data-rowid');
                        const field = this.getAttribute('data-field');
                        const date = this.getAttribute('data-date');
                        if (editRowIdEl) editRowIdEl.value = rowId || '';
                        if (editFieldEl) editFieldEl.value = field || '';
                        if (editDateEl) editDateEl.value = date || '';
                        editModal.show();
                    });
                });
            }
        });
    </script>
    </div>
@endsection
