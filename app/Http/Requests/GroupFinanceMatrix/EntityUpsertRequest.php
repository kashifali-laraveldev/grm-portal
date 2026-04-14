<?php

namespace App\Http\Requests\GroupFinanceMatrix;

use Illuminate\Foundation\Http\FormRequest;

class EntityUpsertRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    protected function prepareForValidation(): void
    {
        $y = $this->input('year');
        if ($y !== null && $y !== '') {
            $yi = (int) $y;
            $this->merge(['year' => max(2024, min(2028, $yi))]);
        }

        $p = $this->input('period');
        if ($p === 'half_year') {
            $this->merge(['period' => 'June']);
        } elseif ($p === 'year_end') {
            $this->merge(['period' => 'December']);
        }
    }

    public function rules(): array
    {
        return [
            'action' => ['required', 'in:create,update,delete', 'not_regex:/<\s*script\b/i'],
            'entity_id' => ['nullable', 'integer', 'min:1', 'not_regex:/<\s*script\b/i'],
            'mapping_id' => ['nullable', 'integer', 'min:1', 'not_regex:/<\s*script\b/i'],
            'year' => ['required', 'integer', 'between:2024,2028', 'not_regex:/<\s*script\b/i'],
            'period' => ['required', 'string', 'in:June,December', 'not_regex:/<\s*script\b/i'],
            'entity_name' => [
                'required',
                'string',
                'max:255',
                'not_regex:/<\s*script\b/i',
                'not_regex:/^[0-9]+$/',
                'regex:/^(?=.*[A-Za-z])[A-Za-z0-9\\s\\-\\_\\&\\.\\/]+$/',
            ],
            'legal_entity_type' => [
                'required',
                'string',
                'max:50',
                'not_regex:/<\s*script\b/i',
                'not_regex:/^[0-9]+$/',
                'regex:/^(?=.*[A-Za-z])[A-Za-z0-9\\s\\-\\_\\&\\.\\/]+$/',
            ],
            'country_id' => ['required', 'integer', 'min:1', 'not_regex:/<\s*script\b/i'],
            'jurisdiction' => ['nullable', 'string', 'max:255', 'not_regex:/<\s*script\b/i'],
            'incorporation_date' => ['required', 'date', 'not_regex:/<\s*script\b/i'],
            'registered_office_address' => ['nullable', 'string', 'max:1000', 'not_regex:/<\s*script\b/i'],
            'trade_license_number' => [
                'nullable',
                'string',
                'max:100',
                'not_regex:/<\s*script\b/i',
                'regex:/^$|^(?=.*[A-Za-z])[A-Za-z0-9\\-\\_\\&\\.\\/]+$/',
            ],
            'trade_license_expiry_date' => ['nullable', 'date', 'not_regex:/<\s*script\b/i'],
            'share_capital' => ['required', 'numeric', 'min:0', 'not_regex:/<\s*script\b/i'],
            'number_of_shares' => ['nullable', 'integer', 'min:0', 'not_regex:/<\s*script\b/i'],
            'company_status' => ['required', 'string', 'in:Active,Disposed,Under_liquidation,Dormant', 'not_regex:/<\s*script\b/i'],
            'assigned_to' => ['nullable', 'string', 'in:Finance,Legal', 'not_regex:/<\s*script\b/i'],
        ];
    }
}

