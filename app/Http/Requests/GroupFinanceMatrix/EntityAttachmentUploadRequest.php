<?php

namespace App\Http\Requests\GroupFinanceMatrix;

use App\Support\GrmUpload;
use Illuminate\Foundation\Http\FormRequest;

class EntityAttachmentUploadRequest extends FormRequest
{
    protected function prepareForValidation(): void
    {
        if ($this->has('expiry_date') && $this->input('expiry_date') === '') {
            $this->merge(['expiry_date' => null]);
        }
    }

    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        return array_merge([
            'type' => ['required', 'string', 'in:general_trade_license_number,general_liquidation_date,financial_doa,tax_corporate_tax_certificate', 'not_regex:/<\s*script\b/i'],
            'expiry_date' => ['nullable', 'date', 'not_regex:/<\s*script\b/i'],
            'is_reminder' => ['required', 'string', 'in:yes,no', 'not_regex:/<\s*script\b/i'],
        ], GrmUpload::fieldRule('attachment_file', 'entity_vault', true, ['not_regex:/<\s*script\b/i']));
    }

    /**
     * @return array<string, string>
     */
    public function messages(): array
    {
        return GrmUpload::messages('attachment_file', 'entity_vault');
    }
}

