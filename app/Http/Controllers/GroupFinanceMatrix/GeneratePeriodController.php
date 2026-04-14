<?php

namespace App\Http\Controllers\GroupFinanceMatrix;

use App\Http\Controllers\Controller;
use App\Models\EntityPeriod;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class GeneratePeriodController extends Controller
{
    /** Reporting months managed from this screen (aligned with Group Finance matrix). */
    private const PERIOD_MONTHS = ['June', 'December'];

    public function index(Request $request)
    {
        $this->reconcileReportingPeriodActiveFlag();

        $periods = EntityPeriod::query()
            ->whereIn('reporting_month', self::PERIOD_MONTHS)
            ->orderByDesc('reporting_year')
            ->orderByRaw("CASE reporting_month WHEN 'June' THEN 1 WHEN 'December' THEN 2 ELSE 3 END")
            ->get();

        $ym = EntityPeriod::currentYearMonth();

        return view('group_finance.generate_new_period', [
            'title' => 'Generate New Period',
            'periods' => $periods,
            'defaultYear' => max(2024, min(2028, (int) $ym['year'])),
        ]);
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'year' => ['required', 'integer', 'min:2024', 'max:2028'],
            'period' => ['required', 'string', Rule::in(self::PERIOD_MONTHS)],
        ]);

        $year = (int) $data['year'];
        $month = $data['period'];

        $duplicate = EntityPeriod::query()
            ->where('reporting_year', $year)
            ->where('reporting_month', $month)
            ->exists();

        if ($duplicate) {
            $msg = 'This year and month combination already exists. Choose a different year or month.';

            if ($request->ajax() || $request->expectsJson()) {
                return response()->json(['ok' => false, 'message' => $msg], 422);
            }

            return redirect()
                ->route('group_finance.generate_new_period')
                ->with('error', $msg);
        }

        $adminId = (int) $request->session()->get('admin_id', 0);

        $entry = EntityPeriod::create([
            'reporting_year' => $year,
            'reporting_month' => $month,
            'is_lock_period' => false,
            'status' => 0,
            'created_by' => $adminId > 0 ? $adminId : null,
        ]);

        $entry->activate();

        $msg = 'Period created. '.$entry->reporting_year.' '.$entry->reporting_month.' is now the active reporting period; all others are inactive.';

        if ($request->ajax() || $request->expectsJson()) {
            return response()->json([
                'ok' => true,
                'message' => $msg,
            ]);
        }

        return redirect()
            ->route('group_finance.generate_new_period')
            ->with('success', $msg);
    }

    /**
     * Ensure exactly one June/December period has status = 1 when any exist.
     * If multiple are marked active (legacy data), keep the newest by id.
     * If none are active but rows exist, activate the newest.
     */
    private function reconcileReportingPeriodActiveFlag(): void
    {
        $base = EntityPeriod::query()->whereIn('reporting_month', self::PERIOD_MONTHS);

        if (! $base->exists()) {
            return;
        }

        $activeCount = (clone $base)->where('status', 1)->count();

        if ($activeCount !== 1) {
            $winner = (clone $base)->orderByDesc('id')->first();
            if ($winner) {
                $winner->activate();
            }
        }
    }
}
