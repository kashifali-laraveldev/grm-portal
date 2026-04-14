<?php

namespace App\Http\Requests\GroupFinanceMatrix;

use Illuminate\Foundation\Http\FormRequest;

class ReportMatrixDateUpdateRequest extends FormRequest
{
    protected function prepareForValidation(): void
    {
        if ($this->has('date') && $this->input('date') === '') {
            $this->merge(['date' => null]);
        }
    }

    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        return [
            'row_id' => ['required', 'integer', 'min:1', 'not_regex:/<\s*script\b/i'],
            'field' => ['required', 'string', 'in:submission_date,reviewed_date,completed_date', 'not_regex:/<\s*script\b/i'],
            'date' => ['nullable', 'date', 'not_regex:/<\s*script\b/i'],
        ];
    }
}

