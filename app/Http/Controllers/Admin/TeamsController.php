<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\TblAdmin;
use App\Models\TblAdminUserTeam;
use App\Models\TblEmployee;
use App\Models\TblTeam;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class TeamsController extends Controller
{
    public function index(Request $request)
    {
        $teams = TblTeam::query()
            ->where('is_deleted', 0)
            ->orderBy('display_order')
            ->get();

        $admins = TblAdmin::query()->orderByDesc('id')->get();
        $employeeByAdId = TblEmployee::query()->get()->keyBy('employee_ad_id');

        $membersByTeamId = TblAdminUserTeam::query()
            ->get()
            ->groupBy('team_id');

        $memberCounts = [];
        foreach ($membersByTeamId as $teamId => $rows) {
            $memberCounts[(int)$teamId] = $rows->count();
        }

        return view('teams.index', [
            'title' => 'Teams',
            'teams' => $teams,
            'admins' => $admins,
            'employeeByAdId' => $employeeByAdId,
            'membersByTeamId' => $membersByTeamId,
            'memberCounts' => $memberCounts,
        ]);
    }

    public function store(Request $request)
    {
        $roleNames = $request->session()->get('admin_role_names', []);
        $canEdit = in_array('Super Admin', $roleNames, true);
        if (!$canEdit) {
            abort(403);
        }

        $validator = Validator::make($request->all(), [
            'action' => ['required', 'in:create,assign,update,delete'],
            'team_name' => ['required_if:action,create', 'nullable', 'string', 'max:255'],
            'team_id' => ['required_if:action,assign,update,delete', 'nullable', 'integer'],
            'admin_ids' => ['nullable', 'array'],
            'admin_ids.*' => ['integer'],
        ]);
        $validator->validate();
        $data = $validator->validated();

        if ($data['action'] === 'create') {
            $maxOrder = (int)TblTeam::query()->max('display_order');
            TblTeam::create([
                'team_name' => (string)$data['team_name'],
                'created_by' => null,
                'display_order' => $maxOrder + 1,
                'is_deleted' => 0,
                'is_active' => 1,
            ]);

            return redirect()->route('teams.index')->with('success', 'Team created successfully (demo).');
        }

        if ($data['action'] === 'update') {
            TblTeam::query()->where('id', (int)$data['team_id'])->update([
                'team_name' => (string)$request->input('team_name', 'Team'),
            ]);
            return redirect()->route('teams.index')->with('success', 'Team updated successfully.');
        }

        if ($data['action'] === 'delete') {
            $teamId = (int)$data['team_id'];
            TblAdminUserTeam::query()->where('team_id', $teamId)->delete();
            TblTeam::query()->where('id', $teamId)->delete();
            return redirect()->route('teams.index')->with('success', 'Team deleted successfully.');
        }

        $teamId = (int)$data['team_id'];
        TblAdminUserTeam::query()->where('team_id', $teamId)->delete();
        foreach (array_map('intval', $data['admin_ids'] ?? []) as $adminId) {
            TblAdminUserTeam::create(['team_id' => $teamId, 'admin_id' => $adminId]);
        }

        return redirect()->route('teams.index')->with('success', 'Team members updated (demo).');
    }
}

