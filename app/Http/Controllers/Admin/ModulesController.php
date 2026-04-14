<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\TblModule;
use App\Models\TblModuleCategory;
use App\Models\TblRole;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class ModulesController extends Controller
{
    public function categories()
    {
        $categories = TblModuleCategory::query()->orderBy('category_name')->get();
        $modules = TblModule::query()->get(['module_category_ID', 'module_name']);
        $moduleNamesByCategory = $modules->groupBy('module_category_ID')->map(function ($rows) {
            return $rows->pluck('module_name')->values()->all();
        })->all();

        return view('admin.module_categories', [
            'title' => 'Module Categories',
            'categories' => $categories,
            'moduleNamesByCategory' => $moduleNamesByCategory,
        ]);
    }

    public function storeCategory(Request $request)
    {
        $this->authorizeSuperAdmin($request);
        $data = Validator::make($request->all(), [
            'category_name' => ['required', 'string', 'max:255'],
            'css_class' => ['nullable', 'string', 'max:255'],
            'display_order' => ['nullable', 'integer'],
        ])->validate();

        TblModuleCategory::query()->create([
            'category_name' => (string)$data['category_name'],
            'css_class' => (string)($data['css_class'] ?? ''),
            'display_order' => (int)($data['display_order'] ?? 1),
            'created_at' => now(),
            'updated_at' => now(),
        ]);

        return redirect()->route('manage_modules.categories')->with('success', 'Module category created.');
    }

    public function updateCategory(int $id, Request $request)
    {
        $this->authorizeSuperAdmin($request);
        $data = Validator::make($request->all(), [
            'category_name' => ['required', 'string', 'max:255'],
            'css_class' => ['nullable', 'string', 'max:255'],
            'display_order' => ['nullable', 'integer'],
        ])->validate();

        TblModuleCategory::query()->where('ID', $id)->update([
            'category_name' => (string)$data['category_name'],
            'css_class' => (string)($data['css_class'] ?? ''),
            'display_order' => (int)($data['display_order'] ?? 1),
            'updated_at' => now(),
        ]);

        return redirect()->route('manage_modules.categories')->with('success', 'Module category updated.');
    }

    public function destroyCategory(int $id, Request $request)
    {
        $this->authorizeSuperAdmin($request);
        TblModule::query()->where('module_category_ID', $id)->update(['module_category_ID' => null, 'updated_at' => now()]);
        TblModuleCategory::query()->where('ID', $id)->delete();
        return redirect()->route('manage_modules.categories')->with('success', 'Module category deleted.');
    }

    public function index()
    {
        $modules = TblModule::query()->orderBy('module_name')->get();
        $categories = TblModuleCategory::query()->pluck('category_name', 'ID')->all();
        $roles = TblRole::query()->pluck('role_name', 'ID')->all();

        $roleIdsByModule = DB::table('tbl_role_privileges')
            ->select('module_ID', 'role_ID')
            ->get()
            ->groupBy('module_ID')
            ->map(fn($rows) => $rows->pluck('role_ID')->all())
            ->all();

        return view('admin.modules', [
            'title' => 'Modules Listing',
            'modules' => $modules,
            'categories' => $categories,
            'roles' => $roles,
            'roleIdsByModule' => $roleIdsByModule,
        ]);
    }

    private function authorizeSuperAdmin(Request $request): void
    {
        if (!in_array('Super Admin', $request->session()->get('admin_role_names', []), true)) {
            abort(403);
        }
    }
}

