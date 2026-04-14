<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  @php
      $pageName = isset($title) ? trim((string) $title) : '';
      if ($pageName !== '' && str_starts_with($pageName, 'GRM Portal | ')) {
          $pageName = trim(substr($pageName, strlen('GRM Portal | ')));
      }
      if ($pageName !== '' && str_contains($pageName, ' > ')) {
          $pageName = trim(\Illuminate\Support\Str::afterLast($pageName, ' > '));
      }
  @endphp
  <title>{{ $pageName === '' ? 'GRM Portal' : 'GRM Portal | ' . $pageName }}</title>
  <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@300;400;500;600;700&family=IBM+Plex+Sans:wght@300;400;500;600&family=IBM+Plex+Mono:wght@400;500&display=swap" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/select2-bootstrap-5-theme@1.3.0/dist/select2-bootstrap-5-theme.min.css" rel="stylesheet">
  <link href="https://cdn.datatables.net/1.13.10/css/dataTables.bootstrap5.min.css" rel="stylesheet">
  <link href="{{ asset('css/grm-theme.css') }}" rel="stylesheet">
  <link rel="icon" type="image/svg+xml" href="{{ asset('favicon.svg') }}">
  <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.0/dist/chart.umd.min.js"></script>
  @vite(['resources/css/app.css', 'resources/js/app.js'])
</head>
<body class="grm-shell">
<nav class="navbar navbar-expand-xl grm-navbar">
  <div class="container-fluid">
    <a class="navbar-brand d-flex align-items-center" href="{{ route('dashboard.group_reporting') }}"><strong>GRM</strong> Portal</a>
    <div class="navbar-collapse">
      <ul class="navbar-nav me-auto">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle {{ request()->routeIs('dashboard.*') ? 'active' : '' }}" href="#" data-bs-toggle="dropdown">Dashboard</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="{{ route('dashboard.group_reporting') }}">Group Reporting</a></li>
            <li><a class="dropdown-item" href="{{ route('dashboard.timeline_view') }}">Timeline View</a></li>
            <li><a class="dropdown-item" href="{{ route('dashboard.finance_statistics') }}">Finance Statistics</a></li>
            <li><a class="dropdown-item" href="{{ route('dashboard.audit_trail') }}">Audit Trail</a></li>
          </ul>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle {{ request()->routeIs('group_finance.*') ? 'active' : '' }}" href="#" data-bs-toggle="dropdown">Group Finance Matrix</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="{{ route('group_finance.legal_entity_management') }}">Legal Entity Management</a></li>
            <li><a class="dropdown-item" href="{{ route('group_finance.share_holders') }}">Share Holders</a></li>
            <li><a class="dropdown-item" href="{{ route('group_finance.draft_entities') }}">Draft Entities</a></li>
            <li><a class="dropdown-item" href="{{ route('group_finance.generate_new_period') }}">Generate New Period</a></li>
            <li><a class="dropdown-item" href="{{ route('group_finance.report_matrix') }}">Report Matrix</a></li>
          </ul>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle {{ request()->routeIs('deliverables.*') ? 'active' : '' }}" href="#" data-bs-toggle="dropdown">Manage Deliverables</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="{{ route('deliverables.all') }}">All Deliverables</a></li>
            <li><a class="dropdown-item" href="{{ route('deliverables.templates') }}">Deliverable Templates</a></li>
          </ul>
        </li>
        <li class="nav-item"><a class="nav-link {{ request()->routeIs('manage_users.*') ? 'active' : '' }}" href="{{ route('manage_users.index') }}">Manage Users</a></li>
        <li class="nav-item"><a class="nav-link {{ request()->routeIs('roles.*') ? 'active' : '' }}" href="{{ route('roles.index') }}">Roles Management</a></li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle {{ request()->routeIs('manage_modules.*') ? 'active' : '' }}" href="#" data-bs-toggle="dropdown">Manage Modules</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="{{ route('manage_modules.categories') }}">Module Categories</a></li>
            <li><a class="dropdown-item" href="{{ route('manage_modules.index') }}">Modules Listing</a></li>
          </ul>
        </li>
        <li class="nav-item"><a class="nav-link {{ request()->routeIs('teams.*') ? 'active' : '' }}" href="{{ route('teams.index') }}">Teams</a></li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle {{ request()->routeIs('email_notifications.*') ? 'active' : '' }}" href="#" data-bs-toggle="dropdown">Email Notifications</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="{{ route('email_notifications.templates') }}">Templates</a></li>
            <li><a class="dropdown-item" href="{{ route('email_notifications.groups') }}">Groups</a></li>
            <li><a class="dropdown-item" href="{{ route('email_notifications.recipients') }}">Recipients</a></li>
            <li><a class="dropdown-item" href="{{ route('email_notifications.notifications') }}">Notifications</a></li>
          </ul>
        </li>
      </ul>
      <ul class="navbar-nav ms-auto">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown"><i class="bi bi-person-circle"></i> {{ session('admin_name', 'Admin') }}</a>
          <ul class="dropdown-menu dropdown-menu-end">
            <li>
              <a class="dropdown-item" href="{{ route('profile.index') }}"><i class="bi bi-person"></i> Profile</a>
            </li>
            <li><hr class="dropdown-divider"></li>
            <li>
              <form method="POST" action="{{ route('logout') }}">
                @csrf
                <button class="dropdown-item" type="submit"><i class="bi bi-box-arrow-right"></i> Logout</button>
              </form>
            </li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>

<div class="grm-content-fill">
@php
    $grmFlashPayload = [
        'flash' => array_filter([
            'success' => session('success'),
            'error' => session('error'),
            'warning' => session('warning'),
            'status' => session('status'),
        ], fn ($v) => $v !== null && $v !== ''),
        'validation' => (isset($errors) && $errors->any()) ? $errors->all() : [],
    ];
@endphp
@if(!empty($grmFlashPayload['flash']) || !empty($grmFlashPayload['validation']))
<script type="application/json" id="grm-page-flash">@json($grmFlashPayload)</script>
@endif

<div class="container-fluid px-3 py-3 flex-grow-1"><div class="grm-sync-page">@yield('content')</div></div>
</div>

<footer class="grm-footer text-center text-muted py-3" style="font-size: 12px; border-top: 1px solid #dee2e6;">2026 © GRM Portal - Portfolio Demo</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<script src="https://cdn.datatables.net/1.13.10/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.10/js/dataTables.bootstrap5.min.js"></script>
<script>
if (window.jQuery && jQuery.fn && jQuery.fn.dataTable) {
  jQuery.extend(true, jQuery.fn.dataTable.defaults, {
    pagingType: 'simple',
    lengthChange: false,
    language: {
      search: '',
      searchPlaceholder: 'Search...'
    }
  });
}

function confirmDelete(formId) {
  Swal.fire({ title: 'Are you sure?', text: 'This action cannot be undone.', icon: 'warning', showCancelButton: true, confirmButtonColor: '#dc3545', cancelButtonColor: '#6c757d', confirmButtonText: 'Yes, delete it!', cancelButtonText: 'Cancel' })
    .then((result) => { if (result.isConfirmed) document.getElementById(formId).submit(); });
}
function comingSoon() {
  if (!window.Swal) return;
  Swal.fire({
    icon: 'info',
    title: 'Feature Available',
    text: 'This feature is available in the full version.',
    timer: 2000,
    showConfirmButton: false,
    toast: true,
    position: 'top-end'
  });
}
function openDrawer(id) {
  if (window.GrmUI && typeof window.GrmUI.openDrawer === 'function') {
    window.GrmUI.openDrawer(id);
    return;
  }
  openAddDrawer(id);
}
function openAddDrawer(drawerId) {
  const el = document.getElementById(drawerId);
  if (!el || !window.bootstrap) return;
  bootstrap.Offcanvas.getOrCreateInstance(el).show();
}
function openEditDrawer(drawerId, data) {
  Object.keys(data).forEach(key => {
    const field = document.querySelector('#' + drawerId + ' [name=\"' + key + '\"]');
    if (field) field.value = data[key];
  });
  if (window.jQuery) {
    jQuery('#' + drawerId).find('select').trigger('change.select2');
  }
  const el = document.getElementById(drawerId);
  if (!el || !window.bootstrap) return;
  bootstrap.Offcanvas.getOrCreateInstance(el).show();
}
function addRow(containerId, template) { const c = document.getElementById(containerId); const d = document.createElement('div'); d.className = 'dynamic-row'; d.innerHTML = template; c.appendChild(d); }
function removeRow(btn) { btn.closest('.dynamic-row').remove(); }
document.addEventListener('DOMContentLoaded', function () {
  if (window.jQuery) {
    $('select').each(function() {
      const $el = $(this);
      if ($el.hasClass('no-select2')) return;
      const $oc = $el.closest('.offcanvas');
      const $shell = $el.closest('.dashboard-filter-shell, .legal-filter-shell');
      const $parent = $oc.length ? $oc : ($shell.length ? $shell : $(document.body));
      $el.select2({
        theme: 'bootstrap-5',
        width: '100%',
        dropdownParent: $parent
      });
    });
  }
});
</script>
@stack('scripts')
</body>
</html>

