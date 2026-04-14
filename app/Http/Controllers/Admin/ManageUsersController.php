<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\TblAdmin;
use App\Models\TblAdminUserTeam;
use App\Models\TblEmployee;
use App\Models\TblRole;
use App\Models\TblTeam;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Throwable;

class ManageUsersController extends Controller
{
    public function index(Request $request)
    {
        $admins = TblAdmin::query()
            ->orderByDesc('id')
            ->get();

        $employeeByAdId = TblEmployee::query()
            ->get()
            ->keyBy('employee_ad_id');

        $roles = TblRole::query()->orderBy('display_order')->get();
        $teams = TblTeam::query()->where('is_deleted', 0)->orderBy('display_order')->get();

        $teamIdsByAdminId = TblAdminUserTeam::query()
            ->get()
            ->groupBy('admin_id')
            ->map(fn($rows) => $rows->pluck('team_id')->map(fn($v) => (int)$v)->all())
            ->all();

        $roleNamesByAdminId = [];
        foreach ($admins as $a) {
            $roleNamesByAdminId[$a->id] = $a->roles()->pluck('tbl_roles.role_name')->all();
        }

        return view('users.index', [
            'title' => 'Manage Users',
            'admins' => $admins,
            'employeeByAdId' => $employeeByAdId,
            'roles' => $roles,
            'teams' => $teams,
            'teamIdsByAdminId' => $teamIdsByAdminId,
            'roleNamesByAdminId' => $roleNamesByAdminId,
        ]);
    }

    public function store(Request $request)
    {
        try {
            $roleNames = $request->session()->get('admin_role_names', []);
            $canEdit = in_array('Super Admin', $roleNames, true);
            if (!$canEdit) {
                abort(403);
            }

            $rules = [
                'action' => ['required', 'in:create,update,toggle,delete'],
                'admin_id' => ['nullable', 'integer'],
                'employee_ad_id' => ['required_if:action,create', 'nullable', 'integer'],
                'full_name' => ['required_if:action,create', 'nullable', 'string', 'max:255'],
                'email' => ['required_if:action,create', 'nullable', 'email'],
                'department' => ['nullable', 'string', 'max:255'],
                'company' => ['nullable', 'string', 'max:255'],
                'password' => ['required_if:action,create', 'nullable', 'string', 'min:6'],
                'role_id' => ['nullable', 'integer'],
                'team_ids' => ['nullable', 'array'],
                'team_ids.*' => ['integer'],
            ];

            $validator = Validator::make($request->all(), $rules);
            $validator->validate();
            $data = $validator->validated();

            $action = (string)$data['action'];

            if ($action === 'create') {
                $adId = (int)$data['employee_ad_id'];

                TblEmployee::query()->updateOrCreate(
                    ['employee_ad_id' => $adId],
                    [
                        'full_name' => (string)$data['full_name'],
                        'email_address' => (string)$data['email'],
                        'department' => $data['department'] ?? null,
                        'company' => $data['company'] ?? null,
                    ]
                );

                $admin = TblAdmin::query()->updateOrCreate(
                    ['employee_ad_id' => $adId],
                    [
                        'is_active' => 1,
                        'password' => Hash::make((string)$data['password']),
                        'entity_type' => 'all',
                        'deliverable_entity_type' => 'all',
                        'deliverable_type' => 'all',
                    ]
                );

                if (!empty($data['role_id'])) {
                    $admin->roles()->sync([(int)$data['role_id']]);
                }

                $teamIds = array_map('intval', $data['team_ids'] ?? []);
                TblAdminUserTeam::query()->where('admin_id', $admin->id)->delete();
                foreach ($teamIds as $tid) {
                    TblAdminUserTeam::create(['admin_id' => $admin->id, 'team_id' => $tid]);
                }

                return redirect()->route('manage_users.index')->with('success', 'User created successfully (demo).');
            }

            $adminId = (int)($data['admin_id'] ?? 0);
            $admin = TblAdmin::query()->where('id', $adminId)->first();
            if (!$admin) {
                return redirect()->route('manage_users.index')->with('error', 'User not found.');
            }

            if ($action === 'toggle') {
                $admin->update(['is_active' => $admin->is_active ? 0 : 1]);
                return redirect()->route('manage_users.index')->with('success', 'User status updated.');
            }

            if ($action === 'delete') {
                TblAdminUserTeam::query()->where('admin_id', $admin->id)->delete();
                $admin->roles()->detach();
                $admin->delete();
                return redirect()->route('manage_users.index')->with('success', 'User deleted successfully.');
            }

            // update: role/team assignment only (demo)
            if (!empty($data['role_id'])) {
                $admin->roles()->sync([(int)$data['role_id']]);
            }

            $teamIds = array_map('intval', $data['team_ids'] ?? []);
            TblAdminUserTeam::query()->where('admin_id', $admin->id)->delete();
            foreach ($teamIds as $tid) {
                TblAdminUserTeam::create(['admin_id' => $admin->id, 'team_id' => $tid]);
            }

            return redirect()->route('manage_users.index')->with('success', 'User updated successfully (demo).');
        } catch (Throwable $e) {
            return redirect()->route('manage_users.index')->with('error', 'Action failed.');
        }
    }
}

