@php
    $storagePath = $path ?? '';
    $linkLabel = $label ?? 'Download file';
    $iconClass = $icon ?? 'bi-paperclip';
    $emptyDisplay = $empty ?? '-----';
@endphp
@if($storagePath !== '' && \Illuminate\Support\Facades\Storage::disk('public')->exists($storagePath))
    <a href="{{ asset('storage/' . $storagePath) }}" class="btn btn-sm btn-add btn-filter legal-filter-btn" download target="_blank" rel="noopener noreferrer" title="{{ $linkLabel }}">
        <i class="bi {{ $iconClass }} me-1"></i>{{ $linkLabel }}
    </a>
@else
    <span class="text-muted small">{{ $emptyDisplay }}</span>
@endif
