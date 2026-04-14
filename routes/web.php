<?php

use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\Admin\AdminDashboardController;
use App\Http\Controllers\Admin\AdminLoginController;
use App\Http\Controllers\Admin\ManageUsersController;
use App\Http\Controllers\Admin\RolesController;
use App\Http\Controllers\Admin\TeamsController;
use App\Http\Controllers\Admin\EmailNotificationsController;
use App\Http\Controllers\Admin\ModulesController;
use App\Http\Controllers\Admin\ProfileController;
use App\Http\Controllers\GroupFinanceMatrix\DeliverablesSubmissionPortalController;
use App\Http\Controllers\GroupFinanceMatrix\GroupStructurePortalController;
use App\Http\Controllers\GroupFinanceMatrix\ShareHoldersController;
use App\Http\Controllers\GroupFinanceMatrix\DraftEntitiesController;
use App\Http\Controllers\GroupFinanceMatrix\GeneratePeriodController;
use App\Http\Controllers\GroupFinanceMatrix\DeliverablesAllController;
use App\Http\Controllers\GroupFinanceMatrix\DeliverableTemplatesController;

Route::get('/', function () {
    if (session()->has('admin_id')) {
        return redirect()->route('dashboard.group_reporting');
    }

    return redirect()->route('login');
});

Route::get('/login', [AdminLoginController::class, 'showLoginForm'])->name('login');
Route::post('/login', [AdminLoginController::class, 'login'])->name('login.post');
Route::post('/logout', [AdminLoginController::class, 'logout'])->name('logout');

Route::get('/demo-reset/{key}', function (string $key) {
    $expected = (string) env('DEMO_RESET_KEY', 'grm-reset-2026');
    if (! hash_equals($expected, $key)) {
        abort(403, 'Invalid reset key');
    }

    try {
        $exitCode = Artisan::call('demo:reset');
        $output = Artisan::output();

        if ($exitCode !== 0) {
            return response()->json([
                'status' => 'error',
                'message' => trim($output) ?: 'demo:reset exited with code '.$exitCode,
            ], 500);
        }

        return response()->json([
            'status' => 'success',
            'message' => 'Demo data reset successfully',
            'time' => now()->toDateTimeString(),
            'output' => trim($output) ?: null,
        ]);
    } catch (\Throwable $e) {
        return response()->json([
            'status' => 'error',
            'message' => $e->getMessage(),
        ], 500);
    }
})->name('demo.reset');

Route::middleware(['admin', 'xss'])->group(function () {
    Route::get('/dashboard', [AdminDashboardController::class, 'groupReporting'])->name('dashboard.group_reporting');
    Route::get('/dashboard/timeline', [AdminDashboardController::class, 'timelineView'])->name('dashboard.timeline_view');
    Route::get('/dashboard/finance', [AdminDashboardController::class, 'financeStatistics'])->name('dashboard.finance_statistics');
    Route::get('/dashboard/audit', [AdminDashboardController::class, 'auditTrail'])->name('dashboard.audit_trail');
    Route::match(['get', 'post'], '/group-finance/legal-entity', [GroupStructurePortalController::class, 'indexOrStore'])->name('group_finance.legal_entity_management');
    Route::get('/group-finance/legal-entity/{mappingId}/detail', [GroupStructurePortalController::class, 'detail'])->name('group_finance.legal_entity_management.detail');
    Route::get('/group-finance/legal-entity/{mappingId}/graph', [GroupStructurePortalController::class, 'graph'])->name('group_finance.legal_entity_management.graph');
    Route::get('/group-finance/legal-entity/{mappingId}/graph-pdf', [GroupStructurePortalController::class, 'graphPdf'])->name('group_finance.legal_entity_management.graph_pdf');
    Route::post('/group-finance/legal-entity/{mappingId}/attachments/upload', [GroupStructurePortalController::class, 'uploadAttachment'])->name('group_finance.legal_entity_management.attachments.upload');
    Route::post('/group-finance/legal-entity/{mappingId}/attachments/{attachmentId}/delete', [GroupStructurePortalController::class, 'deleteAttachment'])->name('group_finance.legal_entity_management.attachments.delete');
    Route::get('/group-finance/share-holders', [ShareHoldersController::class, 'index'])->name('group_finance.share_holders');
    Route::get('/group-finance/draft-entities', [DraftEntitiesController::class, 'index'])->name('group_finance.draft_entities');
    Route::get('/group-finance/generate-new-period', [GeneratePeriodController::class, 'index'])->name('group_finance.generate_new_period');
    Route::post('/group-finance/generate-new-period', [GeneratePeriodController::class, 'store'])->name('group_finance.generate_new_period.store');
    Route::get('/group-finance/report-matrix', [DeliverablesSubmissionPortalController::class, 'reportMatrix'])->name('group_finance.report_matrix');
    Route::get('/group-finance/report-matrix/mapping-attachments', [DeliverablesSubmissionPortalController::class, 'mappingAttachmentsJson'])->name('group_finance.report_matrix.mapping_attachments');
    Route::post('/group-finance/report-matrix/update-date', [DeliverablesSubmissionPortalController::class, 'updateDate'])->name('group_finance.report_matrix.update_date');
    Route::get('/deliverables', [DeliverablesAllController::class, 'index'])->name('deliverables.all');
    Route::get('/deliverables/templates', [DeliverableTemplatesController::class, 'index'])->name('deliverables.templates');
    Route::post('/deliverables/templates', [DeliverableTemplatesController::class, 'store'])->name('deliverables.templates.store');
    Route::get('/manage-users', [ManageUsersController::class, 'index'])->name('manage_users.index');
    Route::post('/manage-users', [ManageUsersController::class, 'store'])->name('manage_users.store');
    Route::get('/roles', [RolesController::class, 'index'])->name('roles.index');
    Route::post('/roles', [RolesController::class, 'store'])->name('roles.store');
    Route::get('/teams', [TeamsController::class, 'index'])->name('teams.index');
    Route::post('/teams', [TeamsController::class, 'store'])->name('teams.store');
    Route::get('/manage-modules', [ModulesController::class, 'index'])->name('manage_modules.index');
    Route::get('/manage-modules/categories', [ModulesController::class, 'categories'])->name('manage_modules.categories');
    Route::post('/manage-modules/categories', [ModulesController::class, 'storeCategory'])->name('manage_modules.categories.store');
    Route::put('/manage-modules/categories/{id}', [ModulesController::class, 'updateCategory'])->name('manage_modules.categories.update');
    Route::delete('/manage-modules/categories/{id}', [ModulesController::class, 'destroyCategory'])->name('manage_modules.categories.destroy');
    Route::get('/roles/{id}/edit', [RolesController::class, 'edit'])->name('roles.edit');
    Route::put('/roles/{id}', [RolesController::class, 'update'])->name('roles.update');
    Route::get('/profile', [ProfileController::class, 'index'])->name('profile.index');
    Route::post('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::get('/email-notifications/templates', [EmailNotificationsController::class, 'templates'])->name('email_notifications.templates');
    Route::post('/email-notifications/templates', [EmailNotificationsController::class, 'storeTemplate'])->name('email_notifications.templates.store');
    Route::put('/email-notifications/templates/{id}', [EmailNotificationsController::class, 'updateTemplate'])->name('email_notifications.templates.update');
    Route::delete('/email-notifications/templates/{id}', [EmailNotificationsController::class, 'destroyTemplate'])->name('email_notifications.templates.destroy');
    Route::get('/email-notifications/groups', [EmailNotificationsController::class, 'groups'])->name('email_notifications.groups');
    Route::post('/email-notifications/groups', [EmailNotificationsController::class, 'storeGroup'])->name('email_notifications.groups.store');
    Route::put('/email-notifications/groups/{id}', [EmailNotificationsController::class, 'updateGroup'])->name('email_notifications.groups.update');
    Route::delete('/email-notifications/groups/{id}', [EmailNotificationsController::class, 'destroyGroup'])->name('email_notifications.groups.destroy');
    Route::get('/email-notifications/recipients', [EmailNotificationsController::class, 'recipients'])->name('email_notifications.recipients');
    Route::post('/email-notifications/recipients', [EmailNotificationsController::class, 'storeRecipient'])->name('email_notifications.recipients.store');
    Route::put('/email-notifications/recipients/{id}', [EmailNotificationsController::class, 'updateRecipient'])->name('email_notifications.recipients.update');
    Route::delete('/email-notifications/recipients/{id}', [EmailNotificationsController::class, 'destroyRecipient'])->name('email_notifications.recipients.destroy');
    Route::get('/email-notifications/notifications', [EmailNotificationsController::class, 'notifications'])->name('email_notifications.notifications');
    Route::post('/email-notifications/notifications', [EmailNotificationsController::class, 'storeNotification'])->name('email_notifications.notifications.store');
    Route::put('/email-notifications/notifications/{id}', [EmailNotificationsController::class, 'updateNotification'])->name('email_notifications.notifications.update');
    Route::delete('/email-notifications/notifications/{id}', [EmailNotificationsController::class, 'destroyNotification'])->name('email_notifications.notifications.destroy');
});
