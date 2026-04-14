@php
    $profileName = $profile ?? 'office';
    $hintConfig = config('grm_uploads.' . $profileName);
@endphp
@if(is_array($hintConfig) && !empty($hintConfig['help']))
    <div class="form-text small text-body-secondary {{ $class ?? 'mb-2' }}">{{ $hintConfig['help'] }}</div>
@endif
