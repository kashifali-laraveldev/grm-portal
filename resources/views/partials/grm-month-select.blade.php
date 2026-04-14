@php
    $fieldName = $name ?? 'period';
    $sel = (string) ($selected ?? 'June');
    if ($sel === 'half_year') {
        $sel = 'June';
    } elseif ($sel === 'year_end') {
        $sel = 'December';
    }
    if (! in_array($sel, ['June', 'December'], true)) {
        $sel = 'June';
    }
@endphp
<select name="{{ $fieldName }}" class="form-select grm-select-month"@if(isset($id) && $id !== '') id="{{ $id }}"@endif @if(!empty($required)) required @endif>
    <option value="June" @selected($sel === 'June')>June</option>
    <option value="December" @selected($sel === 'December')>December</option>
</select>
