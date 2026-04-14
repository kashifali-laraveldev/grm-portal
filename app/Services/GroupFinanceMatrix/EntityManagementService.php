<?php

namespace App\Services\GroupFinanceMatrix;

use App\Models\Country;
use App\Models\Entity;
use App\Models\EntityMappingAttachment;
use App\Models\EntityPeriod;
use App\Models\EntityPeriodMapping;
use Carbon\Carbon;
use Illuminate\Contracts\Pagination\LengthAwarePaginator;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Storage;

class EntityManagementService
{
    public function resolveMonth(?string $period): string
    {
        if ($period === 'June' || $period === 'half_year') {
            return 'June';
        }

        if ($period === 'December' || $period === 'year_end') {
            return 'December';
        }

        return 'June';
    }

    public function getCountries(): Collection
    {
        return Country::query()->orderBy('country_name')->get(['id', 'country_name']);
    }

    public function getGroupStructureOptions(int $periodId): Collection
    {
        $options = EntityPeriodMapping::query()
            ->from('entity_period_mapping as child')
            ->join('entity_period_mapping as parent', function ($join) use ($periodId) {
                $join->on('parent.entity_id', '=', 'child.parent');
                $join->where('parent.period_id', '=', $periodId);
            })
            ->where('child.period_id', '=', $periodId)
            ->where('child.is_deleted', false)
            ->whereNotNull('child.parent')
            ->where('child.parent', '>', 0)
            ->distinct()
            ->orderBy('parent.entity_name')
            ->get(['child.parent as value', 'parent.entity_name as label']);

        return $options;
    }

    public function getEntities(int $year, ?string $period, ?int $groupParent, int $perPage = 50): LengthAwarePaginator
    {
        $month = $this->resolveMonth($period);

        $periodId = EntityPeriod::query()
            ->where('reporting_year', $year)
            ->where('reporting_month', $month)
            ->value('id');

        return EntityPeriodMapping::query()
            ->from('entity_period_mapping as epm')
            ->join('entity as e', 'e.id', '=', 'epm.entity_id')
            ->leftJoin('countries as c', 'c.id', '=', 'epm.country_of_incorporation')
            ->where('epm.period_id', '=', $periodId)
            ->where('epm.is_deleted', false)
            ->when($groupParent !== null && $groupParent > 0, function ($q) use ($groupParent) {
                $q->where('epm.parent', '=', $groupParent);
            })
            ->select([
                'epm.id as mapping_id',
                'epm.entity_id',
                'e.entity_short_code as entity_code',
                'epm.entity_name as entity_name',
                'epm.company_status as company_status',
                'epm.general_registered_office_address as registered_office',
                'epm.general_company_legal_type as legal_entity_type',
                'epm.general_trade_license_number as trade_license_number',
                'c.country_name as country_name',
                'epm.general_jurisdiction_of_incorporation as jurisdiction',
                'epm.general_share_capital as share_capital',
                'epm.general_trade_license_expiry_date as trade_license_expiry_date',
                'epm.parent as parent_id',
            ])
            ->orderBy('epm.id', 'desc')
            ->paginate($perPage);
    }

    public function getEntityForEdit(int $mappingId): ?array
    {
        $row = EntityPeriodMapping::query()
            ->from('entity_period_mapping as epm')
            ->join('entity as e', 'e.id', '=', 'epm.entity_id')
            ->leftJoin('countries as c', 'c.id', '=', 'epm.country_of_incorporation')
            ->where('epm.id', $mappingId)
            ->where('epm.is_deleted', false)
            ->select([
                'epm.id as mapping_id',
                'epm.entity_id',
                'e.entity_short_code as entity_code',
                'epm.entity_name',
                'epm.general_company_legal_type as legal_entity_type',
                'epm.country_of_incorporation as country_id',
                'epm.general_jurisdiction_of_incorporation as jurisdiction',
                'epm.general_incorporation_date as incorporation_date',
                'epm.general_registered_office_address as registered_office_address',
                'epm.general_trade_license_number as trade_license_number',
                'epm.general_trade_license_expiry_date as trade_license_expiry_date',
                'epm.general_share_capital as share_capital',
                'epm.general_numbers_of_shares as number_of_shares',
                'epm.company_status',
                'epm.assigned_to as assigned_to',
                'epm.parent as parent_id',
                'epm.period_id',
            ])
            ->first();

        if (!$row) {
            return null;
        }

        // We only need the selected columns/aliases as plain key => value.
        // Casting the Eloquent model to array creates nested "attributes" keys,
        // which breaks blade access like $editRow['entity_code'].
        return $row->getAttributes();
    }

    public function getEntityDetail(int $mappingId): ?array
    {
        $row = EntityPeriodMapping::query()
            ->from('entity_period_mapping as epm')
            ->join('entity as e', 'e.id', '=', 'epm.entity_id')
            ->leftJoin('countries as c', 'c.id', '=', 'epm.country_of_incorporation')
            ->leftJoin('entity_periods as p', 'p.id', '=', 'epm.period_id')
            ->where('epm.id', $mappingId)
            ->where('epm.is_deleted', false)
            ->select([
                'epm.id as mapping_id',
                'epm.entity_id',
                'e.entity_short_code as entity_code',
                'e.cognos_code',
                'epm.entity_name',
                'epm.general_company_legal_type as legal_entity_type',
                'c.country_name',
                'epm.general_jurisdiction_of_incorporation as jurisdiction',
                'epm.general_incorporation_date as incorporation_date',
                'epm.general_authorised_signatories as authorised_signatories',
                'epm.general_registered_office_address as registered_office_address',
                'epm.general_trade_license_number as trade_license_number',
                'epm.general_trade_license_expiry_date as trade_license_expiry_date',
                'epm.general_share_capital as share_capital',
                'epm.general_numbers_of_shares as number_of_shares',
                'epm.general_liquidation_date as liquidation_date',
                'epm.assigned_to',
                'epm.ownership_percentage',
                'epm.category_name',
                'epm.company_status',
                'epm.auditor',
                'epm.classification',
                'epm.parent',
                'epm.legal_ownership',
                'epm.principal_activities',
                'epm.is_reporting_entity',
                'epm.period_id',
                'p.reporting_year',
                'p.reporting_month',
            ])
            ->first();

        if (!$row) {
            return null;
        }

        $attachments = EntityMappingAttachment::query()
            ->where('entity_mapping_id', $mappingId)
            ->orderBy('id', 'desc')
            ->get([
                'id',
                'filename',
                'actual_filename',
                'type',
                'is_reminder',
                'expiry_date',
                'attachment_path',
            ]);

        return [
            'entity' => $row->getAttributes(),
            'attachments' => $attachments,
        ];
    }

    public function getOwnershipNodes(int $mappingId): array
    {
        $base = EntityPeriodMapping::query()->where('id', $mappingId)->first(['id', 'period_id', 'entity_id']);
        if (!$base) {
            return [];
        }

        $nodes = EntityPeriodMapping::query()
            ->where('period_id', $base->period_id)
            ->where('is_deleted', false)
            ->orderBy('id')
            ->get(['id', 'entity_id', 'entity_name', 'general_company_legal_type', 'ownership_percentage', 'parent', 'classification']);

        $mapped = [];
        foreach ($nodes as $n) {
            $mapped[] = [
                'id' => (int)$n->entity_id,
                'mapping_id' => (int)$n->id,
                'name' => $n->entity_name,
                'type' => $n->general_company_legal_type,
                'ownership' => $n->ownership_percentage,
                'parent' => $n->parent ? (int)$n->parent : null,
                'classification' => $n->classification,
            ];
        }

        return $mapped;
    }

    public function uploadEntityAttachment(int $mappingId, array $data, $file, int $adminId): bool
    {
        $mapping = EntityPeriodMapping::query()->where('id', $mappingId)->where('is_deleted', false)->first(['period_id']);
        if (!$mapping) {
            return false;
        }

        $type = (string)$data['type'];
        $isReminder = (string)$data['is_reminder'];
        $expiryDate = $data['expiry_date'] ?? null;

        $originalName = $file->getClientOriginalName();
        $ext = $file->getClientOriginalExtension();
        $safeBase = preg_replace('/[^A-Za-z0-9\\-_.]/', '_', pathinfo($originalName, PATHINFO_FILENAME));
        $unique = uniqid('att_', true);
        $storedName = $safeBase . '_' . $unique . ($ext ? '.' . $ext : '');

        $dir = 'attachments/' . (int)$mapping->period_id . '/' . $mappingId . '/' . $type;

        $storedPath = $file->storeAs($dir, $storedName, 'public');
        if (!$storedPath) {
            return false;
        }

        EntityMappingAttachment::create([
            'period_id' => (int)$mapping->period_id,
            'entity_mapping_id' => $mappingId,
            'attachment_path' => $storedPath,
            'type' => $type,
            'filename' => $originalName,
            'actual_filename' => $storedName,
            'is_reminder' => $isReminder,
            'expiry_date' => $expiryDate,
            'created_by' => $adminId,
        ]);

        return true;
    }

    public function deleteEntityAttachment(int $mappingId, int $attachmentId, int $adminId): bool
    {
        $att = EntityMappingAttachment::query()
            ->where('id', $attachmentId)
            ->where('entity_mapping_id', $mappingId)
            ->first();

        if (!$att) {
            return false;
        }

        $path = (string)$att->attachment_path;
        if ($path !== '') {
            Storage::disk('public')->delete($path);
        }

        $att->delete();

        return true;
    }

    public function createEntity(array $data, int $adminId): void
    {
        $year = (int)$data['year'];
        $month = $this->resolveMonth($data['period']);

        $periodId = EntityPeriod::query()
            ->where('reporting_year', $year)
            ->where('reporting_month', $month)
            ->value('id');

        $entity = Entity::create([
            'entity_short_code' => null,
            'is_deleted' => false,
            'created_at' => now(),
            'created_by' => $adminId,
        ]);

        $entity->update([
            'entity_short_code' => 'ENT' . str_pad((string)$entity->id, 4, '0', STR_PAD_LEFT),
            'mapping_id' => 'MAP-' . str_pad((string)$entity->id, 4, '0', STR_PAD_LEFT),
            'cognos_code' => 'COG-' . str_pad((string)$entity->id, 4, '0', STR_PAD_LEFT),
            'updated_at' => now(),
        ]);

        $categoryName = $this->randomCategory();

        EntityPeriodMapping::create([
            'entity_id' => $entity->id,
            'entity_name' => $data['entity_name'],
            'general_company_legal_type' => $data['legal_entity_type'],
            'country_of_incorporation' => (int)$data['country_id'],
            'general_jurisdiction_of_incorporation' => $data['jurisdiction'] ?? null,
            'general_incorporation_date' => $data['incorporation_date'],
            'general_registered_office_address' => $data['registered_office_address'] ?? null,
            'general_trade_license_number' => $data['trade_license_number'] ?? null,
            'general_trade_license_expiry_date' => $data['trade_license_expiry_date'] ?? null,
            'general_share_capital' => $data['share_capital'],
            'general_numbers_of_shares' => $data['number_of_shares'] ?? null,
            'assigned_to' => $data['assigned_to'] ?? null,
            'ownership_percentage' => null,
            'category_name' => $categoryName,
            'company_status' => $data['company_status'],
            'parent' => null,
            'period_id' => $periodId,
            'is_lock_entity' => false,
            'is_deleted' => false,
            'created_at' => now(),
            'updated_at' => now(),
        ]);
    }

    public function updateEntity(int $mappingId, array $data, int $adminId): void
    {
        $mapping = EntityPeriodMapping::query()->where('id', $mappingId)->first();

        if (!$mapping) {
            return;
        }

        $mapping->update([
            'entity_name' => $data['entity_name'],
            'general_company_legal_type' => $data['legal_entity_type'],
            'country_of_incorporation' => (int)$data['country_id'],
            'general_jurisdiction_of_incorporation' => $data['jurisdiction'] ?? null,
            'general_incorporation_date' => $data['incorporation_date'],
            'general_registered_office_address' => $data['registered_office_address'] ?? null,
            'general_trade_license_number' => $data['trade_license_number'] ?? null,
            'general_trade_license_expiry_date' => $data['trade_license_expiry_date'] ?? null,
            'general_share_capital' => $data['share_capital'],
            'general_numbers_of_shares' => $data['number_of_shares'] ?? null,
            'assigned_to' => $data['assigned_to'] ?? null,
            'company_status' => $data['company_status'],
            'updated_at' => now(),
        ]);
    }

    public function deleteEntity(int $mappingId, int $adminId): void
    {
        $mapping = EntityPeriodMapping::query()->where('id', $mappingId)->first();

        if (!$mapping) {
            return;
        }

        $entityId = $mapping->entity_id;

        $mapping->update([
            'is_deleted' => true,
            'updated_at' => now(),
        ]);

        Entity::query()->where('id', $entityId)->update([
            'is_deleted' => true,
            'updated_by' => $adminId,
            'updated_at' => now(),
        ]);
    }

    private function randomCategory(): string
    {
        $r = random_int(1, 100);
        if ($r <= 30) {
            return 'Small';
        }
        if ($r <= 70) {
            return 'Medium';
        }
        return 'Large';
    }
}

