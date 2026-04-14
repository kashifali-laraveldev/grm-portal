<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\TblAdmin;
use App\Models\TblEmployee;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Throwable;

class AdminLoginController extends Controller
{
    public function showLoginForm()
    {
        return view('login');
    }

    public function login(Request $request)
    {
        try {
            $rules = [
                'email' => ['required', 'string', 'email:rfc,dns', 'not_regex:/<\s*script\b/i'],
                'password' => ['required', 'string', 'min:6', 'not_regex:/<\s*script\b/i'],
            ];

            $validator = Validator::make($request->all(), $rules, [
                'email.email' => 'Please enter a valid email address.',
                'email.not_regex' => 'Invalid email value.',
                'password.min' => 'Password must be at least 6 characters.',
                'password.not_regex' => 'Invalid password value.',
            ]);

            if ($validator->fails()) {
                return back()->withErrors($validator)->withInput();
            }

            $employee = TblEmployee::query()
                ->where('email_address', $request->input('email'))
                ->first();

            if (!$employee) {
                return back()->with('error', 'Invalid credentials.')->withInput();
            }

            $admin = TblAdmin::query()
                ->where('employee_ad_id', $employee->employee_ad_id)
                ->where('is_active', 1)
                ->first();

            if (!$admin || !Hash::check($request->input('password'), $admin->password)) {
                return back()->with('error', 'Invalid credentials.')->withInput();
            }

            $request->session()->put('admin_id', $admin->id);
            $request->session()->put('admin_name', $employee->full_name);
            $roleNames = $admin->roles()->pluck('tbl_roles.role_name')->all();
            $request->session()->put('admin_role_names', $roleNames);
            $request->session()->forget('allowed_module_routes');

            return redirect()->route('dashboard.group_reporting');
        } catch (Throwable $e) {
            return back()->with('error', 'Login failed.')->withInput();
        }
    }

    public function logout(Request $request)
    {
        $request->session()->forget(['admin_id', 'admin_name', 'allowed_module_routes']);

        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return redirect()->route('login');
    }
}

