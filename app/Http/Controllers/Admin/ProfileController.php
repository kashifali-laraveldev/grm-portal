<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\TblAdmin;
use App\Models\TblEmployee;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class ProfileController extends Controller
{
    public function index(Request $request)
    {
        $admin = TblAdmin::query()->where('id', (int)$request->session()->get('admin_id', 0))->first();
        $employee = $admin ? TblEmployee::query()->where('employee_ad_id', $admin->employee_ad_id)->first() : null;

        return view('admin.profile', [
            'title' => 'Profile',
            'admin' => $admin,
            'employee' => $employee,
        ]);
    }

    public function update(Request $request)
    {
        $admin = TblAdmin::query()->where('id', (int)$request->session()->get('admin_id', 0))->firstOrFail();
        $employee = TblEmployee::query()->where('employee_ad_id', $admin->employee_ad_id)->firstOrFail();

        $data = Validator::make($request->all(), [
            'full_name' => ['required', 'string', 'max:255'],
            'email_address' => ['required', 'email', 'max:255'],
            'department' => ['nullable', 'string', 'max:255'],
            'company' => ['nullable', 'string', 'max:255'],
        ])->validate();

        $employee->update($data);
        $request->session()->put('admin_name', (string)$data['full_name']);

        return redirect()->route('profile.index')->with('success', 'Profile updated successfully.');
    }
}

