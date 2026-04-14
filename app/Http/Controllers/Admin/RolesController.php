<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\TblModule;
use App\Models\TblRole;
use App\Models\TblRolePrivilege;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;

class RolesController extends Controller
{
    public function index(Request $request)
    {
        $roles = TblRole::query()->orderBy('display_order')->get();

        $moduleNamesByRoleId = [];
        $rows = DB::table('tbl_role_privileges as rp')
            ->join('tbl_modules as m', 'm.ID', '=', 'rp.module_ID')
            ->orderBy('m.module_name')
            ->get(['rp.role_ID', 'm.module_name']);

        foreach ($rows as $row) {
            $rid = (int) $row->role_ID;
            if (!isset($moduleNamesByRoleId[$rid])) {
                $moduleNamesByRoleId[$rid] = [];
            }
            $moduleNamesByRoleId[$rid][] = (string) $row->module_name;
        }

        $userCounts = DB::table('tbl_admin_user_roles')
            ->selectRaw('role_ID as role_id, COUNT(*) as cnt')
            ->groupBy('role_ID')
            ->pluck('cnt', 'role_id')
            ->all();

        return view('roles.index', [
            'title' => 'Roles Management',
            'roles' => $roles,
            'moduleNamesByRoleId' => $moduleNamesByRoleId,
            'userCounts' => $userCounts,
        ]);
    }

    public function edit(int $id, Request $request)
    {
        $this->authorizeSuperAdmin($request);
        $role = TblRole::query()->where('ID', $id)->firstOrFail();
        $modules = TblModule::query()->orderBy('module_category_ID')->orderBy('display_order')->get();
        $moduleCategories = \App\Models\TblModuleCategory::query()->pluck('category_name', 'ID')->all();
        $selectedModuleIds = TblRolePrivilege::query()->where('role_ID', $id)->pluck('module_ID')->map(fn($v) => (int)$v)->all();

        return view('roles.edit', [
            'title' => 'Edit Role — ' . $role->role_name,
            'role' => $role,
            'modules' => $modules,
            'moduleCategories' => $moduleCategories,
            'selectedModuleIds' => $selectedModuleIds,
        ]);
    }

    public function update(int $id, Request $request)
    {
        $this->authorizeSuperAdmin($request);
        $data = Validator::make($request->all(), [
            'role_name' => ['required', 'string', 'max:255'],
            'module_ids' => ['nullable', 'array'],
            'module_ids.*' => ['integer'],
        ])->validate();

        DB::transaction(function () use ($id, $data) {
            TblRole::query()->where('ID', $id)->update(['role_name' => (string)$data['role_name'], 'updated_at' => now()]);
            TblRolePrivilege::query()->where('role_ID', $id)->delete();
            foreach (array_map('intval', $data['module_ids'] ?? []) as $mid) {
                TblRolePrivilege::query()->create([
                    'role_ID' => $id,
                    'module_ID' => $mid,
                    'created_at' => now(),
                    'updated_at' => now(),
                ]);
            }
        });

        return redirect()->route('roles.index')->with('success', 'Role and permissions updated.');
    }

    public function store(Request $request)
    {
        $roleNames = $request->session()->get('admin_role_names', []);
        $canEdit = in_array('Super Admin', $roleNames, true);
        if (!$canEdit) {
            abort(403);
        }

        $validator = Validator::make($request->all(), [
            'action' => ['nullable', 'in:create,update,delete'],
            'role_name' => ['required', 'string', 'max:255'],
            'role_id' => ['nullable', 'integer'],
        ]);
        $validator->validate();

        $action = (string)$request->input('action', 'create');
        $roleId = (int)$request->input('role_id', 0);

        if ($action === 'update' && $roleId > 0) {
            TblRole::query()->where('ID', $roleId)->update([
                'role_name' => (string)$request->input('role_name'),
            ]);
            return redirect()->route('roles.index')->with('success', 'Role updated successfully.');
        }

        if ($action === 'delete' && $roleId > 0) {
            $hasUsers = \Illuminate\Support\Facades\DB::table('tbl_admin_user_roles')->where('role_ID', $roleId)->exists();
            if ($hasUsers) {
                return redirect()->route('roles.index')->with('error', 'Cannot delete role assigned to users.');
            }
            TblRolePrivilege::query()->where('role_ID', $roleId)->delete();
            TblRole::query()->where('ID', $roleId)->delete();
            return redirect()->route('roles.index')->with('success', 'Role deleted successfully.');
        }

        $maxOrder = (int)TblRole::query()->max('display_order');
        TblRole::create([
            'role_name' => (string)$request->input('role_name'),
            'display_order' => $maxOrder + 1,
        ]);

        return redirect()->route('roles.index')->with('success', 'Role created successfully (demo).');
    }

    private function authorizeSuperAdmin(Request $request): void
    {
        $roleNames = $request->session()->get('admin_role_names', []);
        if (!in_array('Super Admin', $roleNames, true)) {
            abort(403);
        }
    }
}

