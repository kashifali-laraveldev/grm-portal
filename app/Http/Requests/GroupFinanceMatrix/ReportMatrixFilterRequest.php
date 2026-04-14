<?php

namespace App\Http\Requests\GroupFinanceMatrix;

use Illuminate\Foundation\Http\FormRequest;

class ReportMatrixFilterRequest extends FormRequest
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
            'entity_id' => ['nullable', 'integer', 'min:1', 'not_regex:/<\s*script\b/i'],
            'entity_size' => ['nullable', 'string', 'in:Small,Medium,Large', 'not_regex:/<\s*script\b/i'],
            'deliverable_id' => ['nullable', 'integer', 'min:1', 'not_regex:/<\s*script\b/i'],
            'assigned_to' => ['nullable', 'string', 'max:100', 'not_regex:/<\s*script\b/i'],
            'year' => ['nullable', 'integer', 'between:2024,2028', 'not_regex:/<\s*script\b/i'],
            'period' => ['nullable', 'string', 'in:June,December', 'not_regex:/<\s*script\b/i'],
            'export' => ['nullable', 'string', 'in:excel,pdf', 'not_regex:/<\s*script\b/i'],
        ];
    }
}

