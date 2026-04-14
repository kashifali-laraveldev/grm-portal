@extends('layouts.admin')

@section('content')
    @php
        $roleNames = session('admin_role_names', []);
        $displayName = trim((string) ($employee?->full_name ?? 'User'));
        $parts = $displayName !== '' ? preg_split('/\s+/', $displayName) : [];
        $initials = 'U';
        if (count($parts) >= 2) {
            $initials = strtoupper(substr($parts[0], 0, 1) . substr($parts[count($parts) - 1], 0, 1));
        } elseif ($displayName !== '') {
            $initials = strtoupper(substr($displayName, 0, 2));
        }
        $isActive = $admin && $admin->is_active;
    @endphp
    <div class="legal-entity-page">
    <div class="page-head legal-head">
        <div class="legal-head-left">
            <div class="breadcrumb-dark">Admin <span class="sep">/</span> Profile</div>
            <h4 class="page-title">Profile</h4>
        </div>
    </div>

    <div class="row justify-content-center">
        <div class="col-12">
            <div class="card fade-in-up legal-card grm-profile-card mb-3">
                <div class="card-body">
                    <div class="grm-profile-hero">
                        <div class="grm-profile-avatar" aria-hidden="true">{{ $initials }}</div>
                        <div class="grm-profile-hero-text">
                            <h2 class="grm-profile-name">{{ $displayName }}</h2>
                            <p class="grm-profile-email">
                                <i class="bi bi-envelope" aria-hidden="true"></i>
                                <span>{{ $employee?->email_address ?? '—' }}</span>
                            </p>
                            <div class="grm-profile-meta">
                                <span class="status-pill {{ $isActive ? 'active' : 'neutral' }}">{{ $isActive ? 'Active account' : 'Inactive account' }}</span>
                                @foreach($roleNames as $rn)
                                    <span class="grm-profile-role-pill">{{ $rn }}</span>
                                @endforeach
                            </div>
                        </div>
                    </div>

                    <form method="POST" action="{{ route('profile.update') }}" class="grm-profile-form filter-card legal-filter-card mb-0">
                        @csrf

                        <div class="grm-profile-section grm-profile-section--first">
                            <span class="permission-module-card-title">Contact &amp; organization</span>
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label class="form-label grm-profile-label" for="profile_full_name">Full name</label>
                                    <div class="grm-profile-input-wrap">
                                        <i class="bi bi-person grm-profile-input-icon" aria-hidden="true"></i>
                                        <input id="profile_full_name" type="text" class="form-control" name="full_name" value="{{ $employee?->full_name }}" required autocomplete="name">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label grm-profile-label" for="profile_email">Work email</label>
                                    <div class="grm-profile-input-wrap">
                                        <i class="bi bi-at grm-profile-input-icon" aria-hidden="true"></i>
                                        <input id="profile_email" type="email" class="form-control" name="email_address" value="{{ $employee?->email_address }}" required autocomplete="email">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label grm-profile-label" for="profile_department">Department</label>
                                    <div class="grm-profile-input-wrap">
                                        <i class="bi bi-building grm-profile-input-icon" aria-hidden="true"></i>
                                        <input id="profile_department" type="text" class="form-control" name="department" value="{{ $employee?->department }}" autocomplete="organization-title">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label grm-profile-label" for="profile_company">Company</label>
                                    <div class="grm-profile-input-wrap">
                                        <i class="bi bi-briefcase grm-profile-input-icon" aria-hidden="true"></i>
                                        <input id="profile_company" type="text" class="form-control" name="company" value="{{ $employee?->company }}" autocomplete="organization">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="grm-profile-section">
                            <span class="permission-module-card-title">Account identifiers</span>
                            <p class="small text-muted mb-3">These fields are managed by your administrator and cannot be changed here.</p>
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label class="form-label grm-profile-label" for="profile_ad_id">Employee AD ID</label>
                                    <div class="grm-profile-input-wrap">
                                        <i class="bi bi-hash grm-profile-input-icon" aria-hidden="true"></i>
                                        <input id="profile_ad_id" type="text" class="form-control grm-profile-readonly" value="{{ $employee?->employee_ad_id }}" disabled>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label grm-profile-label" for="profile_status_display">Sign-in status</label>
                                    <div class="grm-profile-input-wrap">
                                        <i class="bi bi-shield-check grm-profile-input-icon" aria-hidden="true"></i>
                                        <input id="profile_status_display" type="text" class="form-control grm-profile-readonly" value="{{ $isActive ? 'You can sign in to GRM Portal' : 'Account disabled — contact an administrator' }}" disabled>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="grm-profile-footer">
                            <span class="grm-profile-footer-hint">Changes to your name and email update how you appear in the portal header and in employee records.</span>
                            <button type="submit" class="btn btn-add legal-filter-btn"><i class="bi bi-check-lg me-1"></i>Save changes</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    </div>
@endsection
