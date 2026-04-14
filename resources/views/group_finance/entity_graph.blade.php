@extends('layouts.admin')

@section('content')
    <div class="legal-entity-page">
        <div class="page-head legal-head">
            <div class="legal-head-left">
                <div class="breadcrumb-dark">Dashboard <span class="sep">/</span> Legal Entity Management <span class="sep">/</span> Ownership Graph</div>
                <h4 class="page-title">Entity Ownership Graph</h4>
            </div>
            <div class="d-flex flex-wrap gap-2 justify-content-end align-items-center">
                <button type="button" class="btn btn-add btn-sm legal-filter-btn" id="exportEntityGraphPdf" data-fallback-url="{{ route('group_finance.legal_entity_management.graph_pdf', ['mappingId' => $selectedMappingId]) }}">
                    <i class="bi bi-file-earmark-pdf me-1"></i>Export to PDF
                </button>
                <a href="{{ route('group_finance.legal_entity_management') }}" class="btn btn-ghost btn-sm legal-filter-btn"><i class="bi bi-arrow-left me-1"></i>Back</a>
            </div>
        </div>

        <div class="card fade-in-up legal-card">
            <div class="card-body">
                <div class="row g-3 mb-3 align-items-end">
                    <div class="col-12 col-md-8 col-lg-6">
                        <label class="form-label fw-semibold small text-uppercase text-muted mb-1">Focus entity</label>
                        <select class="form-select" id="nodeSelector">
                            @foreach($nodes as $n)
                                <option value="{{ $n['id'] }}" @selected((int) ($defaultFocusEntityId ?? 0) === (int) $n['id'])>{{ $n['name'] }} ({{ $n['ownership'] ?? '-' }}%)</option>
                            @endforeach
                        </select>
                        <div class="form-text small text-muted">Graph shows the selected entity as root, with every subsidiary and nested subsidiary in the structure.</div>
                    </div>
                </div>

                <div class="grm-entity-graph-workspace" id="graphExportCapture">
                    <div class="grm-graph-toolbar">
                        <p class="grm-graph-toolbar-label mb-0">Entity Graph</p>
                        <div class="d-flex flex-wrap align-items-center gap-2">
                            <span class="grm-graph-zoom-pill" id="graphZoomPct" title="Current zoom">100%</span>
                            <div class="grm-graph-toolbar-actions">
                                <button type="button" class="btn btn-grm-graph" id="graphZoomIn" title="Zoom in"><i class="bi bi-zoom-in"></i> Zoom in</button>
                                <button type="button" class="btn btn-grm-graph" id="graphZoomOut" title="Zoom out"><i class="bi bi-zoom-out"></i> Zoom out</button>
                                <button type="button" class="btn btn-grm-graph" id="graphResetView" title="Reset pan and zoom"><i class="bi bi-arrows-angle-expand"></i> Reset view</button>
                                <button type="button" class="btn btn-grm-graph-primary" id="graphExpandAll" title="Expand all branches"><i class="bi bi-arrows-expand"></i> Expand all</button>
                                <button type="button" class="btn btn-grm-graph" id="graphCollapseAll" title="Collapse all branches"><i class="bi bi-arrows-collapse"></i> Collapse all</button>
                            </div>
                        </div>
                    </div>
                    <div class="grm-graph-viewport" id="graphViewport" role="application" aria-label="Top-down entity org chart. Drag to pan, scroll wheel to zoom.">
                        <div class="grm-graph-canvas" id="graphContainer">
                            <ul id="treeRoot" class="list-unstyled mb-0"></ul>
                        </div>
                    </div>
                    <div class="grm-graph-legend">
                        <span><i class="grm-leg-subsidiary" aria-hidden="true"></i> Subsidiary</span>
                        <span><i class="grm-leg-associate" aria-hidden="true"></i> Associate</span>
                        <span><i class="grm-leg-jv" aria-hidden="true"></i> Joint venture</span>
                        <span><i class="grm-leg-branch" aria-hidden="true"></i> Branch</span>
                        <span class="ms-auto text-muted"><i class="bi bi-diagram-3 me-1"></i>Top-down org chart · Drag to pan · Wheel to zoom</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('scripts')
<script src="https://cdn.jsdelivr.net/npm/html2canvas@1.4.1/dist/html2canvas.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jspdf@2.5.2/dist/jspdf.umd.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@panzoom/panzoom@4.5.1/dist/panzoom.min.js"></script>
<script>
(function ($) {
    'use strict';

    var graphPanzoomRef = null;

    function getPanzoomCtor() {
        if (typeof window.Panzoom === 'function') return window.Panzoom;
        if (window.Panzoom && typeof window.Panzoom.default === 'function') return window.Panzoom.default;
        return null;
    }

    function classificationClass(c) {
        var val = (c || '').toLowerCase();
        if (val.indexOf('associate') !== -1) return 'grm-graph-node--associate';
        if (val.indexOf('joint') !== -1) return 'grm-graph-node--jv';
        if (val.indexOf('branch') !== -1) return 'grm-graph-node--branch';
        return 'grm-graph-node--subsidiary';
    }

    $(function () {
        var allNodes = @json($nodes);
        var treeRoot = document.getElementById('treeRoot');
        var graphViewport = document.getElementById('graphViewport');
        var graphContainer = document.getElementById('graphContainer');
        var $zoomPct = $('#graphZoomPct');

        function setZoomLabel(scale) {
            $zoomPct.text(Math.round(scale * 100) + '%');
        }

        /**
         * Descendants of rootEntityId (including root). Parent links use entity id.
         * Virtual parent 0 attaches only the focus entity as tree root.
         */
        function buildNodeByParentMap(rootEntityId) {
            var rootId = parseInt(rootEntityId, 10);
            if (!allNodes.length || !rootId) {
                return {};
            }
            var byId = {};
            allNodes.forEach(function (n) {
                byId[n.id] = n;
            });
            if (!byId[rootId]) {
                return {};
            }

            var allowed = {};
            function walk(id) {
                allowed[id] = true;
                allNodes.forEach(function (n) {
                    if (n.parent === id) {
                        walk(n.id);
                    }
                });
            }
            walk(rootId);

            var map = {};
            allNodes.forEach(function (n) {
                if (!allowed[n.id]) {
                    return;
                }
                var p = n.id === rootId ? 0 : n.parent;
                if (p === null || p === undefined) {
                    p = 0;
                }
                if (n.id !== rootId && !allowed[p]) {
                    return;
                }
                if (!map[p]) {
                    map[p] = [];
                }
                map[p].push(n);
            });

            Object.keys(map).forEach(function (k) {
                map[k].sort(function (a, b) {
                    return String(a.name || '').localeCompare(String(b.name || ''), undefined, { sensitivity: 'base' });
                });
            });

            return map;
        }

        function buildTreeFromMap(nodeByParent, parentId) {
            var list = document.createElement('ul');
            list.className = 'grm-graph-tree list-unstyled mb-0';
            if (parentId === 0) {
                list.classList.add('grm-graph-tree--root');
            }
            var children = nodeByParent[parentId] || [];
            children.forEach(function (node) {
                var li = document.createElement('li');
                li.className = 'grm-graph-branch';
                li.dataset.nodeId = String(node.id);

                var box = document.createElement('div');
                box.className = 'grm-graph-node ' + classificationClass(node.classification);

                var title = document.createElement('strong');
                title.className = 'grm-graph-node-title';
                title.textContent = node.name || '';

                var meta = document.createElement('small');
                meta.className = 'grm-graph-node-meta';
                meta.textContent = (node.type || '—') + ' · Ownership: ' + (node.ownership != null ? node.ownership : '—') + '%';

                box.appendChild(title);
                box.appendChild(meta);
                li.appendChild(box);

                var childList = buildTreeFromMap(nodeByParent, node.id);
                if (childList.children.length > 0) {
                    li.appendChild(childList);
                }
                list.appendChild(li);
            });
            return list;
        }

        var panzoom = null;
        var fallbackScale = 1;

        function renderGraphForFocus(focusEntityId) {
            var map = buildNodeByParentMap(focusEntityId);
            treeRoot.innerHTML = '';
            var top = buildTreeFromMap(map, 0);
            if (top.children.length) {
                treeRoot.appendChild(top);
            }
            if (graphPanzoomRef) {
                graphPanzoomRef.reset({ animate: false });
            } else if (graphContainer) {
                graphContainer.style.transform = 'scale(1)';
                graphContainer.style.transformOrigin = '0 0';
                fallbackScale = 1;
                setZoomLabel(1);
            }
        }

        var initialFocus = parseInt($('#nodeSelector').val(), 10);
        if (!initialFocus && allNodes[0]) {
            initialFocus = allNodes[0].id;
        }
        renderGraphForFocus(initialFocus);

        var PanzoomCtor = getPanzoomCtor();

        if (PanzoomCtor && graphContainer && graphViewport) {
            panzoom = PanzoomCtor(graphContainer, {
                maxScale: 3.5,
                minScale: 0.12,
                step: 0.18,
                contain: 'outside',
                canvas: true,
                cursor: 'move'
            });

            graphViewport.addEventListener('wheel', function (e) {
                panzoom.zoomWithWheel(e);
            }, { passive: false });

            graphContainer.addEventListener('panzoomchange', function (ev) {
                var d = ev.detail;
                if (d && typeof d.scale === 'number') setZoomLabel(d.scale);
            });

            graphViewport.addEventListener('mousedown', function () {
                graphViewport.classList.add('grm-graph-viewport--dragging');
            });
            graphViewport.addEventListener('mouseup', function () {
                graphViewport.classList.remove('grm-graph-viewport--dragging');
            });
            graphViewport.addEventListener('mouseleave', function () {
                graphViewport.classList.remove('grm-graph-viewport--dragging');
            });

            setZoomLabel(panzoom.getScale());
            graphPanzoomRef = panzoom;
        }

        $('#graphZoomIn').on('click', function () {
            if (panzoom) {
                panzoom.zoomIn();
                return;
            }
            fallbackScale = Math.min(3.5, fallbackScale + 0.15);
            graphContainer.style.transform = 'scale(' + fallbackScale + ')';
            graphContainer.style.transformOrigin = '0 0';
            setZoomLabel(fallbackScale);
        });
        $('#graphZoomOut').on('click', function () {
            if (panzoom) {
                panzoom.zoomOut();
                return;
            }
            fallbackScale = Math.max(0.2, fallbackScale - 0.15);
            graphContainer.style.transform = 'scale(' + fallbackScale + ')';
            graphContainer.style.transformOrigin = '0 0';
            setZoomLabel(fallbackScale);
        });
        $('#graphResetView').on('click', function () {
            if (panzoom) {
                panzoom.reset({ animate: true });
                return;
            }
            fallbackScale = 1;
            graphContainer.style.transform = 'scale(1)';
            setZoomLabel(1);
        });

        function toggleBranches(show) {
            $(graphContainer).find('ul ul').css('display', show ? 'flex' : 'none');
        }

        $('#graphExpandAll').on('click', function () {
            toggleBranches(true);
        });
        $('#graphCollapseAll').on('click', function () {
            toggleBranches(false);
        });

        $('#nodeSelector').on('change', function () {
            var fid = parseInt($(this).val(), 10);
            if (!fid) {
                return;
            }
            var url = new URL(window.location.href);
            url.searchParams.set('focus', String(fid));
            window.location.assign(url.toString());
        });

        $(document).on('keydown', function (e) {
            if (!graphViewport || !graphViewport.getBoundingClientRect) return;
            var r = graphViewport.getBoundingClientRect();
            if (r.bottom < 0 || r.top > window.innerHeight) return;
            if (e.target && (e.target.tagName === 'INPUT' || e.target.tagName === 'SELECT' || e.target.tagName === 'TEXTAREA')) return;
            if (!panzoom) return;
            if (e.ctrlKey || e.metaKey) {
                if (e.key === '=' || e.key === '+') {
                    e.preventDefault();
                    panzoom.zoomIn();
                } else if (e.key === '-' || e.key === '_') {
                    e.preventDefault();
                    panzoom.zoomOut();
                } else if (e.key === '0') {
                    e.preventDefault();
                    panzoom.reset({ animate: true });
                }
            }
        });

        $('#exportEntityGraphPdf').on('click', function () {
            var fallbackUrl = $(this).data('fallback-url');
            var captureEl = document.getElementById('graphExportCapture');
            var viewport = document.getElementById('graphViewport');

            var JsPDFCtor = (window.jspdf && window.jspdf.jsPDF) || window.jsPDF;
            if (!captureEl || typeof html2canvas === 'undefined' || !JsPDFCtor) {
                if (fallbackUrl) window.location.href = fallbackUrl;
                return;
            }

            var prevVp = viewport ? {
                overflow: viewport.style.overflow,
                height: viewport.style.height,
                maxHeight: viewport.style.maxHeight,
                minHeight: viewport.style.minHeight
            } : null;

            var closeLoader = function () {
                if (window.Swal) Swal.close();
            };

            if (window.GrmUI && window.Swal) {
                window.GrmUI.showLoader('Building PDF…');
            }

            var run = function () {
                if (graphPanzoomRef) {
                    graphPanzoomRef.reset({ animate: false });
                } else if (graphContainer) {
                    graphContainer.style.transform = 'scale(1)';
                    graphContainer.style.transformOrigin = '0 0';
                    $('#graphZoomPct').text('100%');
                }
                $('#graphExpandAll').trigger('click');

                if (viewport && prevVp) {
                    viewport.style.overflow = 'visible';
                    viewport.style.height = 'auto';
                    viewport.style.maxHeight = 'none';
                    viewport.style.minHeight = '0';
                }

                var graphToolbar = captureEl.querySelector('.grm-graph-toolbar');
                var prevToolbarDisplay = graphToolbar ? graphToolbar.style.display : '';

                return new Promise(function (resolve) {
                    setTimeout(resolve, 220);
                }).then(function () {
                    if (graphToolbar) graphToolbar.style.display = 'none';
                    return html2canvas(captureEl, {
                        scale: 2,
                        useCORS: true,
                        allowTaint: true,
                        logging: false,
                        backgroundColor: '#f4f6f9',
                        scrollX: 0,
                        scrollY: 0
                    });
                }).then(function (canvas) {
                    if (graphToolbar) graphToolbar.style.display = prevToolbarDisplay;
                    if (viewport && prevVp) {
                        viewport.style.overflow = prevVp.overflow;
                        viewport.style.height = prevVp.height;
                        viewport.style.maxHeight = prevVp.maxHeight;
                        viewport.style.minHeight = prevVp.minHeight;
                    }

                    var pdf = new JsPDFCtor({ orientation: 'landscape', unit: 'mm', format: 'a3' });
                    var pageW = pdf.internal.pageSize.getWidth();
                    var pageH = pdf.internal.pageSize.getHeight();
                    var margin = 10;
                    var titleBlockMm = 14;
                    pdf.setFont('helvetica', 'bold');
                    pdf.setFontSize(16);
                    pdf.setTextColor(26, 35, 50);
                    pdf.text('Entity Graph', margin, margin + 6);
                    pdf.setFont('helvetica', 'normal');
                    pdf.setFontSize(9);
                    pdf.setTextColor(100, 116, 139);
                    pdf.text('GRM Portal · Entity ownership structure', margin, margin + 11);

                    var pxToMm = 0.264583;
                    var imgWmm = canvas.width * pxToMm;
                    var imgHmm = canvas.height * pxToMm;
                    var availW = pageW - 2 * margin;
                    var availH = pageH - 2 * margin - titleBlockMm;
                    var fit = Math.min(availW / imgWmm, availH / imgHmm, 1);
                    var drawW = imgWmm * fit;
                    var drawH = imgHmm * fit;
                    var imgData = canvas.toDataURL('image/jpeg', 0.92);
                    pdf.addImage(imgData, 'JPEG', margin, margin + titleBlockMm, drawW, drawH);
                    pdf.save('entity-ownership-graph.pdf');
                    closeLoader();
                }).catch(function (err) {
                    if (graphToolbar) graphToolbar.style.display = prevToolbarDisplay;
                    if (viewport && prevVp) {
                        viewport.style.overflow = prevVp.overflow;
                        viewport.style.height = prevVp.height;
                        viewport.style.maxHeight = prevVp.maxHeight;
                        viewport.style.minHeight = prevVp.minHeight;
                    }
                    closeLoader();
                    console.error(err);
                    if (window.Swal) {
                        Swal.fire({
                            icon: 'error',
                            title: 'PDF export failed',
                            text: 'Opening table-based PDF instead.',
                            timer: 2200,
                            showConfirmButton: false
                        });
                    }
                    if (fallbackUrl) window.location.href = fallbackUrl;
                });
            };

            run();
        });
    });
})(jQuery);
</script>
@endpush
