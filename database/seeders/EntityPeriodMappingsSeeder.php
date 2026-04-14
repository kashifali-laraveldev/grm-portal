<?php

namespace Database\Seeders;

use App\Models\Country;
use App\Models\Entity;
use App\Models\EntityPeriod;
use App\Models\EntityPeriodMapping;
use Illuminate\Database\Seeder;
use Carbon\Carbon;

class EntityPeriodMappingsSeeder extends Seeder
{
    public function run(): void
    {
        EntityPeriodMapping::query()->delete();

        $activePeriod = EntityPeriod::query()
            ->where('reporting_year', 2026)
            ->where('reporting_month', 'June')
            ->first();

        if (!$activePeriod) {
            return;
        }

        $countries = Country::query()->pluck('id')->all();
        if (empty($countries)) {
            return;
        }

        $entities = Entity::query()->orderBy('id')->get();
        $now = Carbon::parse('2026-03-30');

        $categories = ['Small' => 30, 'Medium' => 40, 'Large' => 30];
        $statuses = ['Active' => 70, 'Under_liquidation' => 10, 'Dormant' => 15, 'Disposed' => 5];

        foreach ($entities as $idx => $ent) {
            $countryId = $countries[array_rand($countries)];
            $category = $this->weightedPick($categories);
            $status = $this->weightedPick($statuses);
            $ownership = random_int(51, 100);

            // Parent must be another entity's id (same as graph node id). Use a ternary heap so
            // many entities can be parents; the old intdiv(idx, 5) rule only allowed the first ~10
            // entities as parents, so high ids (e.g. ENT0049) never had children in the graph.
            $parentId = $idx === 0
                ? null
                : ($entities[intdiv($idx - 1, 3)]->id ?? null);

            // Demo subsidiaries under ENT0049 (only 50 entities exist: ENT0001–ENT0050).
            $ent0049 = $entities->firstWhere('entity_short_code', 'ENT0049');
            if ($ent0049 && in_array($ent->entity_short_code, ['ENT0047', 'ENT0048', 'ENT0050'], true)) {
                $parentId = $ent0049->id;
            }

            $incoDate = $now->subDays(random_int(500, 4000))->toDateString();
            $tradeExpiry = $now->addDays(random_int(-200, 400))->toDateString();

            EntityPeriodMapping::create([
                'entity_id' => $ent->id,
                'entity_name' => $ent->entity_short_code . ' - ' . $ent->id,
                'general_company_legal_type' => $this->legalTypeFromCode($ent->entity_short_code),
                'country_of_incorporation' => $countryId,
                'general_jurisdiction_of_incorporation' => 'Jurisdiction ' . $ent->entity_short_code,
                'general_incorporation_date' => $incoDate,
                'general_authorised_signatories' => 'Signatory A; Signatory B',
                'general_registered_office_address' => 'Registered Office ' . $ent->entity_short_code,
                'general_trade_license_number' => 'TLN-' . $ent->entity_short_code,
                'general_trade_license_expiry_date' => $tradeExpiry,
                'general_share_capital' => (string)random_int(100000, 9000000) . '.00',
                'general_numbers_of_shares' => random_int(1000, 2000000),
                'general_liquidation_date' => $status === 'Disposed' ? $now->subDays(random_int(30, 800))->toDateString() : null,
                'assigned_to' => $this->assignedToFromStatus($status),
                'ownership_percentage' => $ownership,
                'category_name' => $category,
                'company_status' => $status,
                'auditor' => 'Auditor ' . chr(65 + ($idx % 26)),
                'classification' => $category . ' Group',
                'parent' => $parentId,
                'legal_ownership' => 'Direct',
                'principal_activities' => 'Principal activities for ' . $ent->entity_short_code,
                'is_reporting_entity' => true,
                'period_id' => $activePeriod->id,
                'is_lock_entity' => false,
                'is_deleted' => false,
            ]);
        }
    }

    private function weightedPick(array $weights): string
    {
        $total = array_sum($weights);
        $r = random_int(1, $total);
        $c = 0;
        foreach ($weights as $value => $w) {
            $c += $w;
            if ($r <= $c) {
                return (string)$value;
            }
        }
        return (string)array_key_first($weights);
    }

    private function legalTypeFromCode(string $code): string
    {
        $types = ['LLC', 'Ltd', 'Corp', 'Investments', 'Holdings', 'Trading LLC'];
        $idx = (int)substr($code, -2) % count($types);
        return $types[$idx];
    }

    private function assignedToFromStatus(string $status): string
    {
        return match ($status) {
            'Active' => 'Finance',
            'Under_liquidation' => 'Legal',
            'Dormant' => 'Legal',
            'Disposed' => 'Legal',
            default => 'Finance',
        };
    }
}

