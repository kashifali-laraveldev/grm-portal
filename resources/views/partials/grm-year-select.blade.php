@php
    $fieldName = $name ?? 'year';
    $sel = isset($selected) ? (int) $selected : 2026;
    $sel = max(2024, min(2028, $sel));
@endphp
<select name="{{ $fieldName }}" class="form-select grm-select-year"@if(isset($id) && $id !== '') id="{{ $id }}"@endif @if(!empty($required)) required @endif>
    @for($y = 2024; $y <= 2028; $y++)
        <option value="{{ $y }}" @selected($sel === $y)>{{ $y }}</option>
    @endfor
</select>
