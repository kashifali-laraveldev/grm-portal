<?php

namespace Database\Seeders;

use App\Models\DeliverableTemplate;
use App\Models\EntityItem;
use App\Models\EntityMappingAttachment;
use App\Models\EntityPeriod;
use App\Models\EntityPeriodMapping;
use Illuminate\Database\Seeder;

class DeliverableTemplatesAndAttachmentsSeeder extends Seeder
{
    public function run(): void
    {
        DeliverableTemplate::query()->delete();
        EntityMappingAttachment::query()->delete();

        $items = EntityItem::query()->orderBy('display_order')->get();
        foreach ($items as $idx => $item) {
            DeliverableTemplate::create([
                'deliverable_id' => $item->id,
                'template_name' => $item->title . ' Template',
                'template_period' => 'June',
                'template_year' => 2026,
                'template_path' => 'templates/' . strtolower($item->short_name) . '_2026_june.docx',
                'display_order' => $idx + 1,
                'is_deleted' => false,
            ]);
        }

        $periodId = EntityPeriod::query()
            ->where('reporting_year', 2026)
            ->where('reporting_month', 'June')
            ->value('id');

        if (!$periodId) {
            return;
        }

        $mappings = EntityPeriodMapping::query()
            ->where('period_id', $periodId)
            ->where('is_deleted', false)
            ->get(['id']);

        $types = [
            'general_trade_license_number',
            'general_liquidation_date',
            'financial_doa',
            'tax_corporate_tax_certificate',
        ];

        foreach ($mappings as $mapping) {
            $attachmentCount = random_int(1, 3);
            for ($i = 1; $i <= $attachmentCount; $i++) {
                $type = $types[array_rand($types)];
                EntityMappingAttachment::create([
                    'period_id' => $periodId,
                    'entity_mapping_id' => $mapping->id,
                    'attachment_path' => 'attachments/' . $mapping->id . '/' . $type . '_' . $i . '.pdf',
                    'type' => $type,
                    'filename' => strtoupper($type) . '_' . $i . '.pdf',
                    'actual_filename' => strtoupper($type) . '_' . $i . '.pdf',
                    'is_reminder' => random_int(0, 1) ? 'yes' : 'no',
                    'expiry_date' => now()->addDays(random_int(10, 365))->toDateString(),
                    'created_by' => null,
                ]);
            }
        }
    }
}

