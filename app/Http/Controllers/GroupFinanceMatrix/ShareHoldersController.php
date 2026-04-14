<?php

namespace App\Http\Controllers\GroupFinanceMatrix;

use App\Http\Controllers\Controller;
use App\Models\EntityPeriod;
use App\Models\EntityPeriodMapping;
use Illuminate\Http\Request;

class ShareHoldersController extends Controller
{
    public function index(Request $request)
    {
        $ym = EntityPeriod::currentYearMonth();
        $year = $ym['year'];
        $month = $ym['month'];

        $periodId = EntityPeriod::currentPeriodId();

        $rows = collect();

        if ($periodId) {
            $rows = EntityPeriodMapping::query()
                ->from('entity_period_mapping as child')
                ->join('entity as owned', 'owned.id', '=', 'child.entity_id')
                ->leftJoin('entity as holder', 'holder.id', '=', 'child.parent')
                ->leftJoin('countries as c', 'c.id', '=', 'child.country_of_incorporation')
                ->where('child.period_id', $periodId)
                ->where('child.is_deleted', false)
                ->whereNotNull('child.parent')
                ->orderBy('holder.entity_short_code')
                ->orderBy('owned.entity_short_code')
                ->get([
                    'child.id as mapping_id',
                    'holder.entity_short_code as shareholder_code',
                    'owned.entity_short_code as owned_code',
                    // entity_period_mapping contains the display name.
                    // The `entity` table does not have an `entity_name` column.
                    'child.entity_name as owned_name',
                    'child.ownership_percentage',
                    'c.country_name',
                    'child.company_status',
                    'child.category_name',
                ]);
        }

        $summary = [];
        foreach ($rows as $row) {
            $code = $row->shareholder_code ?: 'UNKNOWN';
            $summary[$code] = ($summary[$code] ?? 0) + 1;
        }
        ksort($summary);

        return view('group_finance.share_holders', [
            'title' => 'Share Holders',
            'rows' => $rows,
            'summary' => $summary,
            'year' => $year,
            'month' => $month,
        ]);
    }
}

