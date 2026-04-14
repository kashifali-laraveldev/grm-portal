<?php

namespace Database\Seeders;

use App\Models\TblModule;
use App\Models\TblModuleCategory;
use App\Models\TblRole;
use App\Models\TblRolePrivilege;
use Illuminate\Database\Seeder;
use Throwable;

/**
 * ACL: one tbl_modules row per named route under Route::middleware(['admin','xss']) in routes/web.php.
 * No placeholder / unused.* modules. Super Admin receives every module privilege.
 *
 * When adding admin routes in web.php, add a matching entry here and adjust role allow-lists below.
 */
class AclSeeder extends Seeder
{
    public function run(): void
    {
        try {
            TblRolePrivilege::query()->delete();
            TblModule::query()->delete();
            TblModuleCategory::query()->delete();
            TblRole::query()->delete();

            $categories = [
                ['name' => 'Dashboard', 'css' => 'dashboard'],
                ['name' => 'Group Finance Matrix', 'css' => 'gfm'],
                ['name' => 'Manage Deliverables', 'css' => 'deliverables'],
                ['name' => 'Manage Users', 'css' => 'users'],
                ['name' => 'Roles Management', 'css' => 'roles'],
                ['name' => 'Teams', 'css' => 'teams'],
                ['name' => 'Email Notifications', 'css' => 'emails'],
                ['name' => 'Manage Modules', 'css' => 'modules'],
            ];

            $categoryIds = [];
            foreach ($categories as $idx => $cat) {
                $category = TblModuleCategory::create([
                    'category_name' => $cat['name'],
                    'css_class' => $cat['css'],
                    'display_order' => $idx + 1,
                ]);
                $categoryIds[$cat['name']] = $category->ID;
            }

            $cid = fn (string $name): int => $categoryIds[$name];

            /** @var list<array{0: string, 1: string, 2: string, 3: int}> $routeRows category, route, module_name, show_in_menu */
            $routeRows = [
                [$cid('Dashboard'), 'dashboard.group_reporting', 'Group Reporting', 1],
                [$cid('Dashboard'), 'dashboard.timeline_view', 'Timeline View', 1],
                [$cid('Dashboard'), 'dashboard.finance_statistics', 'Finance Statistics', 1],
                [$cid('Dashboard'), 'dashboard.audit_trail', 'Audit Trail', 1],
                [$cid('Dashboard'), 'profile.index', 'Profile', 0],
                [$cid('Dashboard'), 'profile.update', 'Profile Update', 0],

                [$cid('Group Finance Matrix'), 'group_finance.legal_entity_management', 'Legal Entity Management', 1],
                [$cid('Group Finance Matrix'), 'group_finance.legal_entity_management.detail', 'Legal Entity — Detail', 0],
                [$cid('Group Finance Matrix'), 'group_finance.legal_entity_management.graph', 'Legal Entity — Graph', 0],
                [$cid('Group Finance Matrix'), 'group_finance.legal_entity_management.graph_pdf', 'Legal Entity — Graph PDF', 0],
                [$cid('Group Finance Matrix'), 'group_finance.legal_entity_management.attachments.upload', 'Legal Entity — Upload attachment', 0],
                [$cid('Group Finance Matrix'), 'group_finance.legal_entity_management.attachments.delete', 'Legal Entity — Delete attachment', 0],
                [$cid('Group Finance Matrix'), 'group_finance.share_holders', 'Share Holders', 1],
                [$cid('Group Finance Matrix'), 'group_finance.draft_entities', 'Draft Entities', 1],
                [$cid('Group Finance Matrix'), 'group_finance.generate_new_period', 'Generate New Period', 1],
                [$cid('Group Finance Matrix'), 'group_finance.generate_new_period.store', 'Generate New Period — Store', 0],
                [$cid('Group Finance Matrix'), 'group_finance.report_matrix', 'Report Matrix', 1],
                [$cid('Group Finance Matrix'), 'group_finance.report_matrix.mapping_attachments', 'Report Matrix — Mapping attachments (JSON)', 0],
                [$cid('Group Finance Matrix'), 'group_finance.report_matrix.update_date', 'Report Matrix — Update date', 0],

                [$cid('Manage Deliverables'), 'deliverables.all', 'All Deliverables', 1],
                [$cid('Manage Deliverables'), 'deliverables.templates', 'Deliverable Templates', 1],
                [$cid('Manage Deliverables'), 'deliverables.templates.store', 'Deliverable Templates — Store', 0],

                [$cid('Manage Users'), 'manage_users.index', 'Manage Users', 1],
                [$cid('Manage Users'), 'manage_users.store', 'Manage Users — Actions', 0],

                [$cid('Roles Management'), 'roles.index', 'Roles Management', 1],
                [$cid('Roles Management'), 'roles.store', 'Roles — Store', 0],
                [$cid('Roles Management'), 'roles.edit', 'Roles — Edit', 0],
                [$cid('Roles Management'), 'roles.update', 'Roles — Update', 0],

                [$cid('Teams'), 'teams.index', 'Teams', 1],
                [$cid('Teams'), 'teams.store', 'Teams — Actions', 0],

                [$cid('Manage Modules'), 'manage_modules.index', 'Modules Listing', 1],
                [$cid('Manage Modules'), 'manage_modules.categories', 'Module Categories', 0],
                [$cid('Manage Modules'), 'manage_modules.categories.store', 'Module Categories — Store', 0],
                [$cid('Manage Modules'), 'manage_modules.categories.update', 'Module Categories — Update', 0],
                [$cid('Manage Modules'), 'manage_modules.categories.destroy', 'Module Categories — Destroy', 0],

                [$cid('Email Notifications'), 'email_notifications.templates', 'Email Templates', 1],
                [$cid('Email Notifications'), 'email_notifications.templates.store', 'Email Templates — Store', 0],
                [$cid('Email Notifications'), 'email_notifications.templates.update', 'Email Templates — Update', 0],
                [$cid('Email Notifications'), 'email_notifications.templates.destroy', 'Email Templates — Destroy', 0],
                [$cid('Email Notifications'), 'email_notifications.groups', 'Email Groups', 1],
                [$cid('Email Notifications'), 'email_notifications.groups.store', 'Email Groups — Store', 0],
                [$cid('Email Notifications'), 'email_notifications.groups.update', 'Email Groups — Update', 0],
                [$cid('Email Notifications'), 'email_notifications.groups.destroy', 'Email Groups — Destroy', 0],
                [$cid('Email Notifications'), 'email_notifications.recipients', 'Email Recipients', 1],
                [$cid('Email Notifications'), 'email_notifications.recipients.store', 'Email Recipients — Store', 0],
                [$cid('Email Notifications'), 'email_notifications.recipients.update', 'Email Recipients — Update', 0],
                [$cid('Email Notifications'), 'email_notifications.recipients.destroy', 'Email Recipients — Destroy', 0],
                [$cid('Email Notifications'), 'email_notifications.notifications', 'Email Notifications', 1],
                [$cid('Email Notifications'), 'email_notifications.notifications.store', 'Email Notifications — Store', 0],
                [$cid('Email Notifications'), 'email_notifications.notifications.update', 'Email Notifications — Update', 0],
                [$cid('Email Notifications'), 'email_notifications.notifications.destroy', 'Email Notifications — Destroy', 0],
            ];

            $orderByCategory = [];
            $modulesByRoute = [];
            foreach ($routeRows as [$categoryId, $route, $moduleName, $showMenu]) {
                $orderByCategory[$categoryId] = ($orderByCategory[$categoryId] ?? 0) + 1;
                $module = TblModule::create([
                    'module_category_ID' => $categoryId,
                    'module_name' => $moduleName,
                    'route' => $route,
                    'show_in_menu' => $showMenu,
                    'display_order' => $orderByCategory[$categoryId],
                ]);
                $modulesByRoute[$route] = $module->ID;
            }

            $roles = [
                'Super Admin',
                'Finance Admin',
                'Legal Officer',
                'Viewer',
                'Entity Manager',
            ];

            $roleIds = [];
            foreach ($roles as $rIdx => $roleName) {
                $role = TblRole::create([
                    'role_name' => $roleName,
                    'display_order' => $rIdx + 1,
                ]);
                $roleIds[$roleName] = $role->ID;
            }

            $viewerAllowed = [
                'dashboard.group_reporting',
                'dashboard.timeline_view',
                'dashboard.finance_statistics',
                'dashboard.audit_trail',
                'profile.index',
                'profile.update',
                'group_finance.legal_entity_management',
                'group_finance.share_holders',
                'group_finance.draft_entities',
                'group_finance.generate_new_period',
                'group_finance.report_matrix',
                'group_finance.report_matrix.mapping_attachments',
                'deliverables.all',
                'deliverables.templates',
                'manage_users.index',
                'roles.index',
                'teams.index',
                'email_notifications.templates',
                'email_notifications.groups',
                'email_notifications.recipients',
                'email_notifications.notifications',
            ];

            $financeAllowed = array_values(array_unique(array_merge($viewerAllowed, [
                'group_finance.report_matrix.update_date',
            ])));

            $legalAllowed = $viewerAllowed;

            $grant = function (int $roleId, array $routes) use ($modulesByRoute): void {
                foreach ($routes as $route) {
                    if (!isset($modulesByRoute[$route])) {
                        continue;
                    }
                    TblRolePrivilege::create([
                        'role_ID' => $roleId,
                        'module_ID' => $modulesByRoute[$route],
                        'created_at' => now(),
                        'updated_at' => now(),
                    ]);
                }
            };

            foreach ($modulesByRoute as $moduleId) {
                TblRolePrivilege::create([
                    'role_ID' => $roleIds['Super Admin'],
                    'module_ID' => $moduleId,
                    'created_at' => now(),
                    'updated_at' => now(),
                ]);
            }

            $grant($roleIds['Finance Admin'], $financeAllowed);
            $grant($roleIds['Legal Officer'], $legalAllowed);
            $grant($roleIds['Viewer'], $viewerAllowed);
            $grant($roleIds['Entity Manager'], $viewerAllowed);
        } catch (Throwable $e) {
            throw $e;
        }
    }
}
