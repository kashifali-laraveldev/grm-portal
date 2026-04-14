<?php

namespace Database\Seeders;

use App\Models\TblAdmin;
use App\Models\TblAdminUserTeam;
use App\Models\TblEmployee;
use App\Models\TblRole;
use App\Models\TblTeam;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class AdminUsersSeeder extends Seeder
{
    public function run(): void
    {
        TblAdminUserTeam::query()->delete();
        TblTeam::query()->delete();
        TblAdmin::query()->delete();
        TblEmployee::query()->delete();

        $employees = [
            ['ad_id' => 1001, 'full_name' => 'Demo Admin User', 'email' => 'admin@demo.com', 'department' => 'Finance', 'company' => 'Demo Organization'],
            ['ad_id' => 1002, 'full_name' => 'Demo Officer User', 'email' => 'officer@demo.com', 'department' => 'Legal', 'company' => 'Demo Organization'],
            ['ad_id' => 1003, 'full_name' => 'Demo Viewer User', 'email' => 'viewer@demo.com', 'department' => 'Operations', 'company' => 'Demo Organization'],
        ];

        $employeeIds = [];
        foreach ($employees as $emp) {
            $employee = TblEmployee::create([
                'employee_ad_id' => $emp['ad_id'],
                'full_name' => $emp['full_name'],
                'email_address' => $emp['email'],
                'department' => $emp['department'],
                'company' => $emp['company'],
            ]);
            $employeeIds[$emp['ad_id']] = $employee->employee_ad_id;
        }

        $demoPassword = 'demo123';

        $admins = [
            ['employee_ad_id' => 1001, 'role' => 'Super Admin'],
            ['employee_ad_id' => 1002, 'role' => 'Finance Admin'],
            ['employee_ad_id' => 1003, 'role' => 'Viewer'],
        ];

        $roles = TblRole::query()->pluck('ID', 'role_name')->all();

        foreach ($admins as $ad) {
            $admin = TblAdmin::create([
                'employee_ad_id' => $ad['employee_ad_id'],
                'is_active' => 1,
                'password' => Hash::make($demoPassword),
                'entity_type' => 'all',
                'deliverable_entity_type' => 'all',
                'deliverable_type' => 'all',
            ]);

            $roleId = $roles[$ad['role']] ?? null;
            if ($roleId) {
                $admin->roles()->attach($roleId);
            }
        }

        $teams = ['Finance Team', 'Legal Team', 'HR Team', 'Tax Team', 'Entity Team'];
        $teamIds = [];
        foreach ($teams as $name) {
            $team = TblTeam::create([
                'team_name' => $name,
                'created_by' => null,
                'display_order' => count($teamIds) + 1,
                'is_deleted' => 0,
                'is_active' => 1,
            ]);
            $teamIds[$name] = $team->id;
        }

        $adminIdByEmployee = TblAdmin::query()->pluck('id', 'employee_ad_id')->all();

        $assignments = [
            ['employee_ad_id' => 1001, 'team' => 'Finance Team'],
            ['employee_ad_id' => 1002, 'team' => 'Legal Team'],
            ['employee_ad_id' => 1003, 'team' => 'HR Team'],
        ];

        foreach ($assignments as $a) {
            $adminId = $adminIdByEmployee[$a['employee_ad_id']] ?? null;
            $teamId = $teamIds[$a['team']] ?? null;
            if (!$adminId || !$teamId) {
                continue;
            }

            TblAdminUserTeam::create([
                'admin_id' => $adminId,
                'team_id' => $teamId,
            ]);
        }
    }
}

