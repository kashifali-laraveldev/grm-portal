<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        $this->call([
            CountriesSeeder::class,
            EntityPeriodsSeeder::class,
            GeneratePeriodSeeder::class,
            DeliverablesSeeder::class,
            EntitiesSeeder::class,
            EntityPeriodMappingsSeeder::class,
            ReportingMatrixSeeder::class,
            DeliverableTemplatesAndAttachmentsSeeder::class,
            AclSeeder::class,
            AdminUsersSeeder::class,
            AuditTrailSeeder::class,
            EmailNotificationsSeeder::class,
        ]);
    }
}
