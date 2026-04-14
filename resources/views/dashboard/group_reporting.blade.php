@extends('layouts.admin')

@section('content')
    <div class="dashboard-page legal-entity-page">
    <div class="page-head legal-head">
        <div class="legal-head-left">
            <div class="breadcrumb-dark">Dashboard <span class="sep">/</span> Group Reporting</div>
            <h4 class="page-title">Group Reporting</h4>
        </div>
    </div>

    <div class="card fade-in-up dashboard-filter-shell mb-3">
        <div class="card-body">
            <form class="filter-card dashboard-filter-card mb-0" method="get" action="{{ route('dashboard.group_reporting') }}">
                <div class="row g-2 align-items-end">
                    <div class="col-12 col-md-3">
                        <label class="form-label">Select Entities</label>
                        <select class="form-select no-select2 dashboard-filter-select2" name="entity_id">
                            <option value="">All entities</option>
                            @foreach($entityOptions as $ent)
                                <option value="{{ $ent['entity_id'] }}" @selected((int)($currentEntityId ?? 0) === (int)$ent['entity_id'])>{{ $ent['entity_name'] }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="col-12 col-md-3">
                        <label class="form-label">Select Deliverables</label>
                        <select class="form-select no-select2 dashboard-filter-select2" name="item_id">
                            <option value="">All deliverables</option>
                            @foreach($deliverableItems as $d)
                                <option value="{{ $d->id }}" @selected((int)($currentItemId ?? 0) === (int)$d->id)>{{ $d->title }} ({{ $d->short_name }})</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="col-12 col-md-2">
                        <label class="form-label">Select Year</label>
                        @include('partials.grm-year-select', ['name' => 'year', 'selected' => $currentYear])
                    </div>
                    <div class="col-12 col-md-2">
                        <label class="form-label">Select Month</label>
                        @include('partials.grm-month-select', ['name' => 'month', 'selected' => $currentMonth])
                    </div>
                    <div class="col-12 col-md-2">
                        <label class="form-label">Select Size</label>
                        <select class="form-select no-select2 dashboard-filter-select2" name="size">
                            <option value="" @selected($currentSize === null || $currentSize === '')>All</option>
                            <option value="Small" @selected($currentSize === 'Small')>Small</option>
                            <option value="Medium" @selected($currentSize === 'Medium')>Medium</option>
                            <option value="Large" @selected($currentSize === 'Large')>Large</option>
                        </select>
                    </div>
                    <div class="col-12 d-flex justify-content-end gap-2 mt-2">
                        <button class="btn btn-add btn-filter dashboard-filter-btn" type="submit"><i class="bi bi-funnel me-1"></i>Filter</button>
                        <a class="btn btn-ghost btn-filter dashboard-filter-btn" href="{{ route('dashboard.group_reporting') }}"><i class="bi bi-arrow-counterclockwise me-1"></i>Reset</a>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <div class="card fade-in-up dashboard-group-card">
        <div class="card-header">Group Deliverables</div>
        <div class="card-body">
            <div class="small mb-3 text-secondary dashboard-legend">
                <strong>Legend:</strong>
                <span class="ms-2"><span style="display:inline-block;width:8px;height:8px;background:#28a745;border-radius:50%;"></span> SUCCESS</span>
                <span class="ms-2"><span style="display:inline-block;width:8px;height:8px;background:#007bff;border-radius:50%;"></span> DUE TODAY</span>
                <span class="ms-2"><span style="display:inline-block;width:8px;height:8px;background:#6c757d;border-radius:50%;"></span> NOT DUE</span>
                <span class="ms-2"><span style="display:inline-block;width:8px;height:8px;background:#fd7e14;border-radius:50%;"></span> DELAYED</span>
                <span class="ms-2"><span style="display:inline-block;width:8px;height:8px;background:#dc3545;border-radius:50%;"></span> OVERDUE</span>
            </div>
            <div class="row g-3">
                @foreach($chartCards as $idx => $card)
                    <div class="col-12 col-md-6 col-xl-3">
                        <div class="chart-card">
                            <div class="chart-title">{{ $card['label'] }}</div>
                            <canvas id="donut_{{ $idx }}" style="max-height:210px;"></canvas>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
    </div>
    </div>
@endsection

@push('scripts')
    <script>
        (function () {
            const cards = @json($chartCards);
            document.addEventListener('DOMContentLoaded', function () {
                if (window.jQuery && jQuery.fn.select2) {
                    jQuery('.dashboard-filter-card select').each(function () {
                        var $el = jQuery(this);
                        if ($el.hasClass('select2-hidden-accessible')) {
                            return;
                        }
                        var name = $el.attr('name');
                        var cfg = {
                            theme: 'bootstrap-5',
                            width: '100%',
                            dropdownParent: jQuery(document.body)
                        };
                        if (name === 'entity_id') {
                            cfg.placeholder = 'All entities';
                            cfg.allowClear = true;
                        } else if (name === 'item_id') {
                            cfg.placeholder = 'All deliverables';
                            cfg.allowClear = true;
                        } else if (name === 'size') {
                            cfg.placeholder = 'All';
                            cfg.allowClear = true;
                        }
                        $el.select2(cfg);
                    });
                }
                cards.forEach(function (card, idx) {
                    var el = document.getElementById('donut_' + idx);
                    if (!el) return;
                    new Chart(el.getContext('2d'), {
                        type: 'doughnut',
                        data: {
                            labels: ['SUCCESS', 'DUE TODAY', 'NOT DUE', 'DELAYED', 'OVERDUE'],
                            datasets: [{
                                data: card.counts,
                                backgroundColor: ['#28a745', '#007bff', '#6c757d', '#fd7e14', '#dc3545'],
                                borderWidth: 0
                            }]
                        },
                        options: {
                            plugins: { legend: { display: false } },
                            responsive: true,
                            maintainAspectRatio: true,
                            aspectRatio: 1.1,
                            cutout: '36%'
                        }
                    });
                });
            });
        })();
    </script>
@endpush
