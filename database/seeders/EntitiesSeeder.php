<?php

namespace Database\Seeders;

use App\Models\Entity;
use Illuminate\Database\Seeder;

class EntitiesSeeder extends Seeder
{
    public function run(): void
    {
        Entity::query()->delete();

        $base = [
            'Alpha Holdings LLC',
            'Beta Capital Ltd',
            'Gamma Investments',
            'Delta Finance Corp',
            'Epsilon Trading LLC',
            'Zeta Properties Ltd',
            'Eta Tech Ventures',
            'Theta Real Estate',
            'Iota Manufacturing',
            'Kappa Logistics',
            'Lambda Energy Ltd',
            'Mu Healthcare Corp',
            'Nu Retail Holdings',
            'Xi Construction LLC',
            'Omicron Media Group',
            'Pi Financial Services',
            'Rho Industrial Ltd',
            'Sigma Commodities',
            'Tau Digital Solutions',
            'Upsilon Leasing Corp',
        ];

        $names = [];
        for ($i = 0; $i < 50; $i++) {
            if ($i < count($base)) {
                $names[] = $base[$i];
            } else {
                $suffix = $i - count($base) + 1;
                $prefix = $base[$suffix % count($base)];
                $names[] = preg_replace('/\s+(\d+)\s*$/', '', $prefix) . ' ' . $suffix;
            }
        }

        foreach ($names as $idx => $name) {
            $code = 'ENT' . str_pad((string)($idx + 1), 4, '0', STR_PAD_LEFT);
            Entity::create([
                'entity_short_code' => $code,
                'is_deleted' => false,
                'created_by' => null,
                'updated_by' => null,
                'mapping_id' => 'MAP-' . str_pad((string)($idx + 1), 4, '0', STR_PAD_LEFT),
                'cognos_code' => 'COG-' . str_pad((string)($idx + 1), 4, '0', STR_PAD_LEFT),
            ]);
        }
    }
}

