@extends('layouts.admin')

@section('content')
    @php $roleNames = session('admin_role_names', []); @endphp
    @php $canEdit = in_array('Super Admin', $roleNames, true) || in_array('Entity Manager', $roleNames, true); @endphp
    @php $attachmentCount = $attachments->count(); @endphp
    @php
        $status = (string)($detail['company_status'] ?? '');
        $statusLabel = $status !== '' ? ucwords(str_replace('_', ' ', $status)) : '—';
        $stRaw = strtolower($status);
        $statusPill = str_contains($stRaw, 'active') ? 'active' : (str_contains($stRaw, 'dormant') ? 'dormant' : (str_contains($stRaw, 'disposed') ? 'disposed' : (str_contains($stRaw, 'under_liquidation') ? 'under-liquidation' : (str_contains($stRaw, 'liquid') ? 'liquidation' : 'neutral'))));
    @endphp

    <div class="legal-entity-page">
        <div class="page-head legal-head">
            <div class="legal-head-left">
                <div class="breadcrumb-dark">Dashboard <span class="sep">/</span> Legal Entity Management <span class="sep">/</span> Entity Detail</div>
                <h4 class="page-title">Entity Detail</h4>
            </div>
            <a href="{{ route('group_finance.legal_entity_management') }}" class="btn btn-ghost legal-add-btn align-self-start"><i class="bi bi-arrow-left me-1"></i>Back</a>
        </div>

        <div class="card fade-in-up legal-card legal-filter-shell mb-3">
            <div class="card-body">
                <div class="d-flex flex-wrap align-items-center justify-content-between gap-2 mb-3">
                    <h6 class="permission-module-card-title mb-0">Entity information</h6>
                </div>
                <div class="row g-3 grm-entity-detail-grid">
                    <div class="col-12 col-md-4">
                        <div class="grm-profile-label">Entity #</div>
                        <div class="fw-medium mono">{{ $detail['entity_code'] }}</div>
                    </div>
                    <div class="col-12 col-md-4">
                        <div class="grm-profile-label">Cognos code</div>
                        <div class="fw-medium mono">{{ $detail['cognos_code'] }}</div>
                    </div>
                    <div class="col-12 col-md-4">
                        <div class="grm-profile-label">Name</div>
                        <div class="fw-medium">{{ $detail['entity_name'] }}</div>
                    </div>
                    <div class="col-12 col-md-4">
                        <div class="grm-profile-label">Legal type</div>
                        <div class="fw-medium">{{ $detail['legal_entity_type'] }}</div>
                    </div>
                    <div class="col-12 col-md-4">
                        <div class="grm-profile-label">Country</div>
                        <div class="fw-medium">{{ $detail['country_name'] }}</div>
                    </div>
                    <div class="col-12 col-md-4">
                        <div class="grm-profile-label">Jurisdiction</div>
                        <div class="fw-medium">{{ $detail['jurisdiction'] }}</div>
                    </div>
                    <div class="col-12 col-md-4">
                        <div class="grm-profile-label">Incorporation date</div>
                        <div class="fw-medium mono">{{ $detail['incorporation_date'] }}</div>
                    </div>
                    <div class="col-12 col-md-4">
                        <div class="grm-profile-label">Trade license #</div>
                        <div class="fw-medium">{{ $detail['trade_license_number'] }}</div>
                    </div>
                    <div class="col-12 col-md-4">
                        <div class="grm-profile-label">Trade license expiry</div>
                        <div class="fw-medium mono">{{ $detail['trade_license_expiry_date'] }}</div>
                    </div>
                    <div class="col-12 col-md-4">
                        <div class="grm-profile-label">Share capital</div>
                        <div class="fw-medium text-end text-md-start">{{ $detail['share_capital'] }}</div>
                    </div>
                    <div class="col-12 col-md-4">
                        <div class="grm-profile-label">No. of shares</div>
                        <div class="fw-medium">{{ $detail['number_of_shares'] }}</div>
                    </div>
                    <div class="col-12 col-md-4">
                        <div class="grm-profile-label">Status</div>
                        <div><span class="status-pill {{ $statusPill }}">{{ $statusLabel }}</span></div>
                    </div>
                    <div class="col-12">
                        <div class="grm-profile-label">Registered office</div>
                        <div class="fw-medium">{{ $detail['registered_office_address'] }}</div>
                    </div>
                    <div class="col-12">
                        <div class="grm-profile-label">Principal activities</div>
                        <div class="fw-medium">{{ $detail['principal_activities'] }}</div>
                    </div>
                </div>
            </div>
        </div>

        <div class="card fade-in-up legal-card legal-table-shell mb-3">
            <div class="card-body">
                <div class="d-flex flex-wrap align-items-center justify-content-between gap-2">
                    <div>
                        <h6 class="permission-module-card-title mb-1">Document vault</h6>
                        <p class="text-muted small mb-0">{{ $attachmentCount }} file(s) on record</p>
                    </div>
                    @if($canEdit || $attachmentCount > 0)
                        <button type="button" class="btn btn-add legal-add-btn" data-bs-toggle="offcanvas" data-bs-target="#entityVaultDrawer" aria-controls="entityVaultDrawer">
                            <i class="bi bi-folder2-open me-1"></i>{{ $canEdit ? 'Manage documents' : 'View documents' }} ({{ $attachmentCount }})
                        </button>
                    @endif
                </div>
                @if(!$canEdit && $attachmentCount === 0)
                    <p class="text-muted small mb-0 mt-3">No documents uploaded for this entity.</p>
                @endif
            </div>
        </div>

        <div class="offcanvas offcanvas-end" tabindex="-1" id="entityVaultDrawer" aria-labelledby="entityVaultDrawerLabel">
            <div class="offcanvas-header border-bottom align-items-start">
                <div class="pe-2">
                    <h5 class="offcanvas-title fw-bold" id="entityVaultDrawerLabel">Document vault</h5>
                    <div class="small text-muted mt-1">{{ $detail['entity_name'] }}</div>
                </div>
                <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body p-0 d-flex flex-column">
                <div class="p-3 flex-grow-1 overflow-auto">
                    <div class="table-container grm-entity-vault-table-wrap border rounded overflow-hidden">
                        <div class="table-responsive">
                            <table class="table legal-entity-table w-100 mb-0 grm-entity-vault-table">
                                <thead class="table-light">
                                    <tr>
                                        <th class="grm-ev-th-num">#</th>
                                        <th class="grm-ev-th-file">Attachment</th>
                                        <th class="grm-ev-th-type">Type</th>
                                        <th class="grm-ev-th-exp">Expiry</th>
                                        <th class="grm-ev-th-rem">Reminder</th>
                                        <th class="grm-ev-th-act">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @forelse($attachments as $att)
                                        <tr>
                                            <td class="mono grm-ev-td-num">{{ $loop->iteration }}</td>
                                            <td class="grm-ev-td-file">
                                                @include('partials.grm-storage-download-link', ['path' => $att->attachment_path, 'label' => 'Download attachment'])
                                            </td>
                                            <td class="grm-ev-td-type"><span class="text-break">{{ $att->type }}</span></td>
                                            <td class="mono grm-ev-td-exp">{{ $att->expiry_date }}</td>
                                            <td class="grm-ev-td-rem">{{ strtoupper((string)$att->is_reminder) }}</td>
                                            <td class="grm-ev-td-act">
                                                @if($canEdit)
                                                    <form method="POST" action="{{ route('group_finance.legal_entity_management.attachments.delete', ['mappingId' => $detail['mapping_id'], 'attachmentId' => $att->id]) }}" class="d-inline m-0" data-delete-form="true" data-delete-message="Delete this attachment?">
                                                        @csrf
                                                        <button type="submit" class="icon-action delete" title="Delete"><i class="bi bi-trash"></i></button>
                                                    </form>
                                                @else
                                                    <span class="text-muted">—</span>
                                                @endif
                                            </td>
                                        </tr>
                                    @empty
                                        <tr>
                                            <td colspan="6" class="text-center text-muted py-4">No attachments</td>
                                        </tr>
                                    @endforelse
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                @if($canEdit)
                    <div class="border-top bg-light p-3 mt-auto">
                        <div class="small fw-semibold text-body-secondary mb-2">Upload file</div>
                        <form id="entityVaultUploadForm" method="POST" action="{{ route('group_finance.legal_entity_management.attachments.upload', ['mappingId' => $detail['mapping_id']]) }}" enctype="multipart/form-data" class="legal-filter-card">
                            @csrf
                            <div class="row g-2 align-items-end">
                                <div class="col-12">
                                    <label class="form-label">Attachment type <span class="text-danger">*</span></label>
                                    <select name="type" class="form-select @error('type') is-invalid @enderror">
                                        <option value="">Select</option>
                                        @foreach(['general_trade_license_number','general_liquidation_date','financial_doa','tax_corporate_tax_certificate'] as $t)
                                            <option value="{{ $t }}" @if(old('type') === $t) selected @endif>{{ $t }}</option>
                                        @endforeach
                                    </select>
                                    @error('type')
                                        <div class="invalid-feedback d-block">{{ $message }}</div>
                                    @enderror
                                </div>
                                <div class="col-12 col-sm-6">
                                    <label class="form-label">Expiry date</label>
                                    <input type="date" name="expiry_date" class="form-control @error('expiry_date') is-invalid @enderror" value="{{ old('expiry_date') }}">
                                    @error('expiry_date')
                                        <div class="invalid-feedback d-block">{{ $message }}</div>
                                    @enderror
                                </div>
                                <div class="col-12 col-sm-6">
                                    <label class="form-label">Set reminder <span class="text-danger">*</span></label>
                                    <select name="is_reminder" class="form-select @error('is_reminder') is-invalid @enderror">
                                        <option value="">Select</option>
                                        <option value="yes" @if(old('is_reminder') === 'yes') selected @endif>Yes</option>
                                        <option value="no" @if(old('is_reminder') === 'no') selected @endif>No</option>
                                    </select>
                                    @error('is_reminder')
                                        <div class="invalid-feedback d-block">{{ $message }}</div>
                                    @enderror
                                </div>
                                <div class="col-12">
                                    <label class="form-label">File <span class="text-danger">*</span></label>
                                    <input type="file" name="attachment_file" class="form-control @error('attachment_file') is-invalid @enderror" accept="{{ config('grm_uploads.entity_vault.accept') }}">
                                    @error('attachment_file')
                                        <div class="invalid-feedback d-block">{{ $message }}</div>
                                    @enderror
                                    @include('partials.grm-upload-hint', ['profile' => 'entity_vault', 'class' => 'mt-1'])
                                </div>
                                <div class="col-12 pt-1">
                                    <button type="submit" class="btn btn-add btn-filter legal-filter-btn w-100"><i class="bi bi-cloud-upload me-1"></i>Upload file</button>
                                </div>
                            </div>
                        </form>
                    </div>
                @endif
            </div>
        </div>
    </div>

    @if($canEdit)
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                var form = document.getElementById('entityVaultUploadForm');
                if (form && window.GrmUI && window.Swal) {
                    form.addEventListener('submit', function () {
                        window.GrmUI.showLoader('Uploading…');
                    });
                }
                @if($errors->has('type') || $errors->has('expiry_date') || $errors->has('is_reminder') || $errors->has('attachment_file'))
                var drawer = document.getElementById('entityVaultDrawer');
                if (drawer && window.bootstrap) {
                    bootstrap.Offcanvas.getOrCreateInstance(drawer).show();
                }
                @endif
            });
        </script>
    @endif
@endsection
