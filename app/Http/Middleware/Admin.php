<?php

namespace App\Http\Middleware;

use App\Models\TblAdmin;
use App\Models\TblModule;
use App\Models\TblRolePrivilege;
use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class Admin
{
    public function handle(Request $request, Closure $next): Response
    {
        $adminId = $request->session()->get('admin_id');

        if (!$adminId) {
            return redirect()->route('login');
        }

        $routeName = $request->route()?->getName();

        if (!$routeName) {
            return $next($request);
        }

        // Always resolve from DB so new modules (e.g. roles.edit) apply without stale session cache.
        $allowed = $this->resolveAllowedRoutes($adminId);
        $request->session()->put('allowed_module_routes', $allowed);

        if (is_array($allowed) && count($allowed) > 0) {
            $isAllowed = in_array($routeName, $allowed, true);

            if (!$isAllowed) {
                foreach ($allowed as $allowedRoute) {
                    if (str_starts_with($routeName, $allowedRoute . '.')) {
                        $isAllowed = true;
                        break;
                    }
                }
            }

            if (!$isAllowed) {
                abort(403);
            }
        }

        $request->attributes->set('allowed_module_routes', $allowed);

        return $next($request);
    }

    private function resolveAllowedRoutes(int $adminId): array
    {
        $admin = TblAdmin::query()->where('id', $adminId)->first();

        if (!$admin) {
            return [];
        }

        $roleIds = $admin->roles()->pluck('tbl_roles.ID')->all();

        if (empty($roleIds)) {
            return [];
        }

        $privilegesQuery = TblRolePrivilege::query()->whereIn('role_ID', $roleIds);

        $moduleIds = $privilegesQuery->pluck('tbl_role_privileges.module_ID')->all();

        if (empty($moduleIds)) {
            return [];
        }

        $routes = TblModule::query()->whereIn('ID', $moduleIds)->pluck('route')->all();

        return array_values(array_unique(array_filter($routes)));
    }
}

