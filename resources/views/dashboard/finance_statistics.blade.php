@extends('layouts.admin')

@section('content')
    <div class="finance-statistics-page legal-entity-page">
    <div class="page-head legal-head">
        <div class="legal-head-left">
            <div class="breadcrumb-dark">Dashboard <span class="sep">/</span> Finance Statistics</div>
            <h4 class="page-title">Finance Statistics</h4>
        </div>
    </div>

    <div class="finance-kpi-grid row g-3 mb-3">
        <div class="col-12 col-md-4">
            <div class="finance-kpi-tile">
                <div class="finance-kpi-tile-icon" aria-hidden="true"><i class="bi bi-building"></i></div>
                <div>
                    <div class="finance-kpi-label">Total Entities</div>
                    <div class="finance-kpi-value">{{ array_sum($byStatus) }}</div>
                </div>
            </div>
        </div>
        <div class="col-12 col-md-4">
            <div class="finance-kpi-tile finance-kpi-tile--capital">
                <div class="finance-kpi-tile-icon" aria-hidden="true"><i class="bi bi-currency-dollar"></i></div>
                <div>
                    <div class="finance-kpi-label">Total Share Capital</div>
                    <div class="finance-kpi-value">{{ number_format($totalCapital, 2) }}</div>
                </div>
            </div>
        </div>
        <div class="col-12 col-md-4">
            <div class="finance-kpi-tile finance-kpi-tile--shares">
                <div class="finance-kpi-tile-icon" aria-hidden="true"><i class="bi bi-pie-chart"></i></div>
                <div>
                    <div class="finance-kpi-label">Total Shares</div>
                    <div class="finance-kpi-value">{{ number_format($totalShares) }}</div>
                </div>
            </div>
        </div>
    </div>

    <div class="row g-3">
        <div class="col-12 col-lg-6">
            <div class="card fade-in-up legal-card h-100 finance-chart-shell border-0">
                <div class="card-header finance-stat-card-header">
                    <i class="bi bi-bar-chart-line-fill" aria-hidden="true"></i>
                    <span>Entities by Status</span>
                </div>
                <div class="card-body finance-chart-card-body">
                    <div class="finance-chart-wrap">
                        <canvas id="statusChart"></canvas>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-12 col-lg-6">
            <div class="card fade-in-up legal-card h-100 finance-chart-shell border-0">
                <div class="card-header finance-stat-card-header">
                    <i class="bi bi-globe2" aria-hidden="true"></i>
                    <span>Entities by Country</span>
                </div>
                <div class="card-body finance-chart-card-body">
                    <div class="finance-chart-wrap">
                        <canvas id="countryChart"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
@endsection

@push('scripts')
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            if (!window.Chart) return;

            Chart.defaults.font.family = "'IBM Plex Sans', 'Segoe UI', sans-serif";
            Chart.defaults.color = '#64748b';

            const tickColor = '#64748b';
            const gridColor = '#e9edf2';

            const statusLabels = @json(array_keys($byStatus));
            const statusData = @json(array_values($byStatus));
            const countryLabels = @json(array_keys($byCountry));
            const countryData = @json(array_values($byCountry));

            const countryPalette = [
                '#1a2332', '#243548', '#2d4a62', '#198754', '#157347',
                '#0d6efd', '#0a58ca', '#6f42c1', '#a371f7', '#fd7e14',
                '#ffc107', '#dc3545', '#94a3b8', '#0dcaf0', '#6610f2'
            ];

            const elStatus = document.getElementById('statusChart');
            if (elStatus) {
                const statusCtx = elStatus.getContext('2d');
                const grad = statusCtx.createLinearGradient(0, 0, 0, 300);
                grad.addColorStop(0, '#1a2332');
                grad.addColorStop(0.5, '#243548');
                grad.addColorStop(1, '#198754');

                new Chart(statusCtx, {
                    type: 'bar',
                    data: {
                        labels: statusLabels,
                        datasets: [{
                            label: 'Entities',
                            data: statusData,
                            backgroundColor: grad,
                            borderColor: 'rgba(255,255,255,0.35)',
                            borderWidth: 1,
                            borderRadius: 8,
                            borderSkipped: false,
                            maxBarThickness: 48
                        }]
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: false,
                        animation: { duration: 700, easing: 'easeOutQuart' },
                        plugins: {
                            legend: {
                                display: true,
                                position: 'top',
                                align: 'end',
                                labels: {
                                    color: tickColor,
                                    font: { size: 12, weight: '500' },
                                    usePointStyle: true,
                                    pointStyle: 'rect',
                                    padding: 16
                                }
                            },
                            tooltip: {
                                backgroundColor: 'rgba(30, 41, 59, 0.95)',
                                titleFont: { size: 12, weight: '600' },
                                bodyFont: { size: 13 },
                                padding: 12,
                                cornerRadius: 8,
                                displayColors: true
                            }
                        },
                        scales: {
                            x: {
                                ticks: { color: tickColor, font: { size: 11 } },
                                grid: { display: false }
                            },
                            y: {
                                beginAtZero: true,
                                ticks: { color: tickColor, font: { size: 11 } },
                                grid: { color: gridColor, drawBorder: false }
                            }
                        }
                    }
                });
            }

            const elCountry = document.getElementById('countryChart');
            if (elCountry) {
                const colors = countryLabels.map(function (_, i) {
                    return countryPalette[i % countryPalette.length];
                });

                new Chart(elCountry.getContext('2d'), {
                    type: 'doughnut',
                    data: {
                        labels: countryLabels,
                        datasets: [{
                            data: countryData,
                            backgroundColor: colors,
                            borderColor: '#ffffff',
                            borderWidth: 2,
                            hoverOffset: 6
                        }]
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: false,
                        cutout: '62%',
                        animation: { animateRotate: true, duration: 800 },
                        plugins: {
                            legend: {
                                position: 'bottom',
                                align: 'center',
                                labels: {
                                    color: tickColor,
                                    font: { size: 10, weight: '500' },
                                    boxWidth: 10,
                                    boxHeight: 10,
                                    padding: 10,
                                    usePointStyle: true
                                }
                            },
                            tooltip: {
                                backgroundColor: 'rgba(30, 41, 59, 0.95)',
                                padding: 12,
                                cornerRadius: 8
                            }
                        }
                    }
                });
            }
        });
    </script>
@endpush
