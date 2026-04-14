<?php

namespace App\Support;

class GrmUpload
{
    public static function profile(string $name): array
    {
        return config("grm_uploads.{$name}", []);
    }

    /**
     * @param  array<int, string|\Illuminate\Contracts\Validation\Rule|object>  $append
     * @return array<string, array<int, string|\Illuminate\Contracts\Validation\Rule|object>>
     */
    public static function fieldRule(string $field, string $profile, bool $required, array $append = []): array
    {
        $c = self::profile($profile);
        $rules = array_merge(
            $required ? ['required'] : ['nullable'],
            ['file', 'mimes:'.$c['mimes'], 'max:'.$c['max_kb']],
            $append
        );

        return [$field => $rules];
    }

    /**
     * @return array<string, string>
     */
    public static function messages(string $field, string $profile): array
    {
        $c = self::profile($profile);
        $mb = max(1, (int) round(($c['max_kb'] ?? 1024) / 1024));

        return [
            "{$field}.required" => 'Please choose a file to upload.',
            "{$field}.mimes" => 'This file type is not allowed. '.$c['help'],
            "{$field}.max" => "The file is too large. Maximum size is {$mb} MB.",
            "{$field}.uploaded" => 'The file could not be uploaded. Try a smaller file or check your connection.',
        ];
    }
}
