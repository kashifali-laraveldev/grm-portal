<?php

namespace Database\Seeders;

use App\Models\EntityItem;
use App\Models\EntityItemMapping;
use Illuminate\Database\Seeder;

class DeliverablesSeeder extends Seeder
{
    public function run(): void
    {
        EntityItemMapping::query()->delete();
        EntityItem::query()->delete();

        $deliverables = [
            ['title' => 'Financial Reporting', 'short_name' => 'FR', 'years' => range(2018, 2028), 'is_reminder' => true, 'is_default' => true, 'display_order' => 1, 'is_annual' => true],
            ['title' => 'Treasury Reporting', 'short_name' => 'TR', 'years' => range(2018, 2028), 'is_reminder' => true, 'is_default' => false, 'display_order' => 2, 'is_annual' => true],
            ['title' => 'Project Champion', 'short_name' => 'PC', 'years' => range(2018, 2028), 'is_reminder' => false, 'is_default' => false, 'display_order' => 3, 'is_annual' => true],
            ['title' => 'Variance Analysis', 'short_name' => 'VA', 'years' => range(2018, 2028), 'is_reminder' => true, 'is_default' => false, 'display_order' => 4, 'is_annual' => true],
            ['title' => 'Reco Report', 'short_name' => 'RR', 'years' => range(2018, 2028), 'is_reminder' => false, 'is_default' => false, 'display_order' => 5, 'is_annual' => true],
            ['title' => 'Representation Letter', 'short_name' => 'RL', 'years' => range(2018, 2027), 'is_reminder' => true, 'is_default' => false, 'display_order' => 6, 'is_annual' => true],
            ['title' => 'Accounting Policies', 'short_name' => 'APT', 'years' => range(2018, 2028), 'is_reminder' => false, 'is_default' => false, 'display_order' => 7, 'is_annual' => true],
            ['title' => 'Signed Financial Statements', 'short_name' => 'SFS', 'years' => range(2018, 2028), 'is_reminder' => true, 'is_default' => false, 'display_order' => 8, 'is_annual' => true],
            ['title' => 'Board Resolution', 'short_name' => 'BR', 'years' => range(2020, 2028), 'is_reminder' => false, 'is_default' => false, 'display_order' => 9, 'is_annual' => true],
            ['title' => 'Management Accounts', 'short_name' => 'MA', 'years' => range(2021, 2028), 'is_reminder' => false, 'is_default' => false, 'display_order' => 10, 'is_annual' => true],
        ];

        foreach ($deliverables as $d) {
            $item = EntityItem::create([
                'title' => $d['title'],
                'short_name' => $d['short_name'],
                'is_default' => $d['is_default'],
                'status' => 1,
                'is_annual' => $d['is_annual'],
                'is_reminder' => $d['is_reminder'],
                'display_order' => $d['display_order'],
            ]);

            foreach ($d['years'] as $year) {
                EntityItemMapping::create([
                    'entity_item_id' => $item->id,
                    'year' => $year,
                ]);
            }
        }
    }
}

