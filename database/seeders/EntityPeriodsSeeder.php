<?php

namespace Database\Seeders;

use App\Models\EntityPeriod;
use Illuminate\Database\Seeder;

class EntityPeriodsSeeder extends Seeder
{
    /**
     * Seeds entity_periods up to and including June 2026 only (no December 2026+).
     * June/December pairs for 2024–2025, then June 2026 only; June 2026 is active.
     * Adds 2026 Annual for ReportingMatrixSeeder.
     */
    public function run(): void
    {
        EntityPeriod::query()->delete();

        $pairs = [
            [2024, 'June'],
            [2024, 'December'],
            [2025, 'June'],
            [2025, 'December'],
            [2026, 'June'],
        ];

        foreach ($pairs as [$year, $month]) {
            $isActive = $year === 2026 && $month === 'June';
            EntityPeriod::create([
                'reporting_year' => $year,
                'reporting_month' => $month,
                'is_lock_period' => false,
                'status' => $isActive ? 1 : 0,
                'created_by' => null,
            ]);
        }

        EntityPeriod::create([
            'reporting_year' => 2026,
            'reporting_month' => 'Annual',
            'is_lock_period' => false,
            'status' => 0,
            'created_by' => null,
        ]);
    }
}
