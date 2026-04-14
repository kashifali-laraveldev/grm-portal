<?php

namespace App\Http\Controllers\GroupFinanceMatrix;

use App\Http\Controllers\Controller;
use App\Models\EntityItem;
use App\Models\EntityItemMapping;
use Illuminate\Http\Request;

class DeliverablesAllController extends Controller
{
    public function index(Request $request)
    {
        $items = EntityItem::query()
            ->orderBy('display_order')
            ->get();

        $allYears = EntityItemMapping::query()
            ->distinct()
            ->orderBy('year')
            ->pluck('year')
            ->toArray();

        $itemsWithYears = $items->map(function (EntityItem $item) {
            $years = EntityItemMapping::query()
                ->where('entity_item_id', $item->id)
                ->orderBy('year')
                ->pluck('year')
                ->toArray();

            return [
                'item' => $item,
                'years' => $years,
            ];
        });

        return view('deliverables.all', [
            'title' => 'All Deliverables',
            'itemsWithYears' => $itemsWithYears,
            'allYears' => $allYears,
        ]);
    }
}

