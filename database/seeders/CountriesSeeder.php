<?php

namespace Database\Seeders;

use App\Models\Country;
use Illuminate\Database\Seeder;

class CountriesSeeder extends Seeder
{
    public function run(): void
    {
        $countries = [
            ['phone_code' => '+971', 'country_code' => 'AE', 'country_name' => 'UAE'],
            ['phone_code' => '+1', 'country_code' => 'US', 'country_name' => 'USA'],
            ['phone_code' => '+44', 'country_code' => 'GB', 'country_name' => 'UK'],
            ['phone_code' => '+966', 'country_code' => 'SA', 'country_name' => 'Saudi Arabia'],
            ['phone_code' => '+974', 'country_code' => 'QA', 'country_name' => 'Qatar'],
            ['phone_code' => '+965', 'country_code' => 'KW', 'country_name' => 'Kuwait'],
            ['phone_code' => '+973', 'country_code' => 'BH', 'country_name' => 'Bahrain'],
            ['phone_code' => '+968', 'country_code' => 'OM', 'country_name' => 'Oman'],
            ['phone_code' => '+20', 'country_code' => 'EG', 'country_name' => 'Egypt'],
            ['phone_code' => '+962', 'country_code' => 'JO', 'country_name' => 'Jordan'],
            ['phone_code' => '+92', 'country_code' => 'PK', 'country_name' => 'Pakistan'],
            ['phone_code' => '+91', 'country_code' => 'IN', 'country_name' => 'India'],
            ['phone_code' => '+65', 'country_code' => 'SG', 'country_name' => 'Singapore'],
            ['phone_code' => '+1', 'country_code' => 'KY', 'country_name' => 'Cayman Islands'],
            ['phone_code' => '+1', 'country_code' => 'VG', 'country_name' => 'British Virgin Islands'],
            ['phone_code' => '+231', 'country_code' => 'LR', 'country_name' => 'Liberia'],
            ['phone_code' => '+1', 'country_code' => 'BS', 'country_name' => 'Bahamas'],
            ['phone_code' => '+352', 'country_code' => 'LU', 'country_name' => 'Luxembourg'],
            ['phone_code' => '+31', 'country_code' => 'NL', 'country_name' => 'Netherlands'],
            ['phone_code' => '+41', 'country_code' => 'CH', 'country_name' => 'Switzerland'],
            ['phone_code' => '+49', 'country_code' => 'DE', 'country_name' => 'Germany'],
            ['phone_code' => '+33', 'country_code' => 'FR', 'country_name' => 'France'],
            ['phone_code' => '+61', 'country_code' => 'AU', 'country_name' => 'Australia'],
            ['phone_code' => '+1', 'country_code' => 'CA', 'country_name' => 'Canada'],
            ['phone_code' => '+353', 'country_code' => 'IE', 'country_name' => 'Ireland'],
            ['phone_code' => '+34', 'country_code' => 'ES', 'country_name' => 'Spain'],
            ['phone_code' => '+39', 'country_code' => 'IT', 'country_name' => 'Italy'],
            ['phone_code' => '+46', 'country_code' => 'SE', 'country_name' => 'Sweden'],
            ['phone_code' => '+47', 'country_code' => 'NO', 'country_name' => 'Norway'],
            ['phone_code' => '+45', 'country_code' => 'DK', 'country_name' => 'Denmark'],
        ];

        foreach ($countries as $c) {
            Country::create($c);
        }
    }
}

