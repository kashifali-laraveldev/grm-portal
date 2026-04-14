<?php

namespace App\Http\Controllers\GroupFinanceMatrix;

use App\Http\Controllers\Controller;
use App\Models\EntityPeriod;
use App\Models\EntityPeriodMapping;
use Illuminate\Http\Request;

class DraftEntitiesController extends Controller
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
                ->from('entity_period_mapping as epm')
                ->join('entity as e', 'e.id', '=', 'epm.entity_id')
                ->leftJoin('countries as c', 'c.id', '=', 'epm.country_of_incorporation')
                ->where('epm.period_id', $periodId)
                ->where('epm.is_deleted', false)
                ->where('epm.is_lock_entity', false)
                ->whereIn('epm.company_status', ['Dormant', 'Under_liquidation', 'Disposed'])
                ->orderBy('epm.company_status')
                ->orderBy('e.entity_short_code')
                ->get([
                    'epm.id as mapping_id',
                    'e.entity_short_code as entity_code',
                    'epm.entity_name',
                    'epm.company_status',
                    'c.country_name',
                    'epm.general_company_legal_type as legal_entity_type',
                    'epm.general_incorporation_date as incorporation_date',
                    'epm.general_share_capital as share_capital',
                    'epm.general_numbers_of_shares as number_of_shares',
                    'epm.category_name',
                ]);
        }

        $byStatus = [];
        foreach ($rows as $row) {
            $status = $row->company_status ?: 'Unknown';
            $byStatus[$status] = ($byStatus[$status] ?? 0) + 1;
        }
        ksort($byStatus);

        return view('group_finance.draft_entities', [
            'title' => 'Draft Entities',
            'rows' => $rows,
            'year' => $year,
            'month' => $month,
            'byStatus' => $byStatus,
        ]);
    }
}

