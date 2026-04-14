<!DOCTYPE html>
<html lang="en" class="grm-login-html">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>GRM Portal | Sign in</title>
    <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700&family=IBM+Plex+Sans:wght@300;400;500;600&family=IBM+Plex+Mono:wght@400;500&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
    <link href="{{ asset('css/grm-theme.css') }}" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css" rel="stylesheet">
    <link rel="icon" type="image/svg+xml" href="{{ asset('favicon.svg') }}">
</head>
<body class="grm-login-page">
    <div class="grm-login-split">
        <main class="grm-login-form-wrap">
            <div class="grm-login-card">
                <div class="grm-login-card-head">
                    <h2>Sign in</h2>
                    <p>Use your credentials to access the portal.</p>
                </div>

                <form method="POST" action="{{ route('login.post') }}" id="loginForm" autocomplete="on">
                    @csrf

                    <div class="mb-3">
                        <label class="form-label" for="login-email">Email <span class="text-danger">*</span></label>
                        <input type="email" id="login-email" name="email" class="form-control @error('email') is-invalid @enderror" value="{{ old('email', 'admin@demo.com') }}" autocomplete="username" required>
                        @error('email')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>

                    <div class="mb-3">
                        <label class="form-label" for="login-password">Password <span class="text-danger">*</span></label>
                        <input type="password" id="login-password" name="password" class="form-control @error('password') is-invalid @enderror" autocomplete="current-password" required>
                        @error('password')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>

                    <button type="submit" class="btn btn-add w-100">
                        <i class="bi bi-box-arrow-in-right me-1"></i> Sign In
                    </button>
                </form>

                <div class="grm-login-demo">
                    <div class="grm-login-demo-label"><i class="bi bi-key-fill me-1"></i> Demo access</div>
                    <dl class="mb-0">
                        <div class="grm-login-demo-row">
                            <dt>Email</dt>
                            <dd>admin@demo.com</dd>
                        </div>
                        <div class="grm-login-demo-row">
                            <dt>Password</dt>
                            <dd>demo123</dd>
                        </div>
                    </dl>
                </div>
            </div>
        </main>

        <aside class="grm-login-brand" aria-hidden="true">
            <div class="grm-login-brand-inner">
                <div class="grm-login-brand-mark" aria-hidden="true">G</div>
                <h1 class="grm-login-brand-title">GRM Portal</h1>
                <p class="grm-login-brand-tagline">Executive Group Finance Matrix Platform — legal entities, ownership, and reporting in one place.</p>
                <div class="grm-login-brand-divider"></div>
            </div>
        </aside>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            if (!window.Swal) return;
            @if($errors->any())
            @php
                $loginErrHtml = '<ul class="text-start mb-0 ps-3">' . collect($errors->all())->map(fn ($m) => '<li>' . e($m) . '</li>')->implode('') . '</ul>';
            @endphp
            Swal.fire({
                icon: 'error',
                title: 'Please check your input',
                html: @json($loginErrHtml),
                confirmButtonText: 'OK',
                confirmButtonColor: '#1a2332',
            });
            @elseif(session('error'))
            Swal.fire({
                icon: 'error',
                title: 'Error',
                text: @json(session('error')),
                confirmButtonText: 'OK',
                confirmButtonColor: '#1a2332',
            });
            @endif
            var loginForm = document.getElementById('loginForm');
            if (loginForm) {
                loginForm.addEventListener('submit', function () {
                    Swal.fire({
                        title: 'Signing in…',
                        allowOutsideClick: false,
                        allowEscapeKey: false,
                        showConfirmButton: false,
                        didOpen: function () { Swal.showLoading(); },
                    });
                });
            }
        });
    </script>
</body>
</html>
