<?php

namespace Database\Seeders;

use App\Models\Audit;
use App\Models\TblAdmin;
use App\Models\EntityPeriodMapping;
use App\Models\EntityReportingMatrix;
use App\Models\EntityMappingAttachment;
use Carbon\Carbon;
use Illuminate\Database\Seeder;
use Illuminate\Support\Arr;

class AuditTrailSeeder extends Seeder
{
    public function run(): void
    {
        // Create demo audit entries so Audit Trail screen isn't empty.
        Audit::query()->delete();

        $adminIds = TblAdmin::query()->pluck('id')->all();
        if (empty($adminIds)) {
            return;
        }

        $mappingIds = EntityPeriodMapping::query()->pluck('id')->all();
        $matrixIds = EntityReportingMatrix::query()->pluck('id')->all();
        $attachmentIds = EntityMappingAttachment::query()->pluck('id')->all();

        $now = Carbon::parse('2026-03-30 12:00:00');

        $ipPool = ['127.0.0.1', '192.168.1.10', '10.0.0.22'];
        $agentPool = [
            'Mozilla/5.0 (Windows NT 10.0; Win64; x64)',
            'Chrome/123 Safari/537.36',
            'Edge/122.0',
        ];

        $routes = [
            'timeline' => '/dashboard/timeline',
            'finance' => '/dashboard/finance',
            'audit' => '/dashboard/audit',
            'legal_entity_detail' => function (int $mappingId) {
                return "/group-finance/legal-entity/{$mappingId}/detail";
            },
            'legal_entity_upload' => function (int $mappingId) {
                return "/group-finance/legal-entity/{$mappingId}/attachments/upload";
            },
            'legal_entity_attachment_delete' => function (int $mappingId, int $attachmentId) {
                return "/group-finance/legal-entity/{$mappingId}/attachments/{$attachmentId}/delete";
            },
        ];

        $rows = [];

        // Mapping events
        foreach (array_slice($mappingIds, 0, 20) as $idx => $mappingId) {
            $adminId = Arr::random($adminIds);
            $oldCompanyStatus = Arr::random(['Active', 'Dormant', 'Disposed', 'Under_liquidation']);
            $newCompanyStatus = Arr::random(['Active', 'Dormant', 'Disposed', 'Under_liquidation']);

            $rows[] = [
                'user_type' => 'admin',
                'user_id' => (int)$adminId,
                'event' => 'EntityPeriodMapping updated',
                'auditable_type' => 'EntityPeriodMapping',
                'auditable_id' => (int)$mappingId,
                'old_values' => json_encode(['company_status' => $oldCompanyStatus], JSON_UNESCAPED_SLASHES),
                'new_values' => json_encode(['company_status' => $newCompanyStatus], JSON_UNESCAPED_SLASHES),
                'url' => $routes['legal_entity_detail']((int)$mappingId),
                'ip_address' => Arr::random($ipPool),
                'user_agent' => Arr::random($agentPool),
                'created_at' => $now->copy()->subMinutes((int)$idx * 45)->toDateTimeString(),
                'updated_at' => $now->copy()->subMinutes((int)$idx * 45)->toDateTimeString(),
            ];

            // Add attachment upload event if we have attachments
            if (!empty($attachmentIds) && $idx % 3 === 0) {
                $attachmentId = (int)Arr::random($attachmentIds);
                $rows[] = [
                    'user_type' => 'admin',
                    'user_id' => (int)$adminId,
                    'event' => 'EntityMappingAttachment created',
                    'auditable_type' => 'EntityMappingAttachment',
                    'auditable_id' => (int)$attachmentId,
                    'old_values' => null,
                    'new_values' => json_encode([
                        'type' => Arr::random(['general_trade_license_number', 'financial_doa', 'tax_corporate_tax_certificate']),
                        'mapping_id' => (int)$mappingId,
                    ], JSON_UNESCAPED_SLASHES),
                    'url' => $routes['legal_entity_upload']((int)$mappingId),
                    'ip_address' => Arr::random($ipPool),
                    'user_agent' => Arr::random($agentPool),
                    'created_at' => $now->copy()->subMinutes((int)$idx * 45 + 10)->toDateTimeString(),
                    'updated_at' => $now->copy()->subMinutes((int)$idx * 45 + 10)->toDateTimeString(),
                ];
            }
        }

        // Reporting matrix events
        foreach (array_slice($matrixIds, 0, 25) as $idx => $matrixId) {
            $adminId = Arr::random($adminIds);
            $rows[] = [
                'user_type' => 'admin',
                'user_id' => (int)$adminId,
                'event' => 'EntityReportingMatrix updated',
                'auditable_type' => 'EntityReportingMatrix',
                'auditable_id' => (int)$matrixId,
                'old_values' => json_encode([
                    'submission_date' => null,
                ], JSON_UNESCAPED_SLASHES),
                'new_values' => json_encode([
                    'submission_date' => $now->copy()->subDays(Arr::random([5, 7, 10, 14]))->toDateString(),
                ], JSON_UNESCAPED_SLASHES),
                'url' => $routes['timeline'],
                'ip_address' => Arr::random($ipPool),
                'user_agent' => Arr::random($agentPool),
                'created_at' => $now->copy()->subMinutes((int)$idx * 35 + 20)->toDateTimeString(),
                'updated_at' => $now->copy()->subMinutes((int)$idx * 35 + 20)->toDateTimeString(),
            ];
        }

        // A few deletion events (attachment delete)
        if (!empty($attachmentIds) && !empty($mappingIds)) {
            for ($i = 0; $i < min(12, count($attachmentIds)); $i++) {
                $adminId = Arr::random($adminIds);
                $attachmentId = (int)$attachmentIds[$i];
                $mappingId = (int)Arr::random($mappingIds);

                $rows[] = [
                    'user_type' => 'admin',
                    'user_id' => (int)$adminId,
                    'event' => 'EntityMappingAttachment deleted',
                    'auditable_type' => 'EntityMappingAttachment',
                    'auditable_id' => (int)$attachmentId,
                    'old_values' => json_encode(['deleted_attachment_id' => $attachmentId], JSON_UNESCAPED_SLASHES),
                    'new_values' => null,
                    'url' => $routes['legal_entity_attachment_delete']($mappingId, $attachmentId),
                    'ip_address' => Arr::random($ipPool),
                    'user_agent' => Arr::random($agentPool),
                    'created_at' => $now->copy()->subMinutes((int)$i * 50 + 5)->toDateTimeString(),
                    'updated_at' => $now->copy()->subMinutes((int)$i * 50 + 5)->toDateTimeString(),
                ];
            }
        }

        // Insert in chunks to avoid very large single insert.
        foreach (array_chunk($rows, 200) as $chunk) {
            Audit::query()->insert($chunk);
        }
    }
}

