<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Entity Graph</title>
    <style>
        body { font-family: DejaVu Sans, Arial, sans-serif; font-size: 12px; }
        .node { border: 1px solid #e5e7eb; padding: 8px; margin-bottom: 8px; border-radius: 6px; }
        .title { font-size: 16px; font-weight: 700; margin-bottom: 8px; }
        .muted { color: #6b7280; }
        table { width: 100%; border-collapse: collapse; }
        th, td { border: 1px solid #e5e7eb; padding: 6px; vertical-align: top; }
        th { background: #f3f4f6; }
        .badge { display:inline-block; padding:2px 6px; border-radius:4px; font-weight:600; }
        .blue { background:#93c5fd; color:#0b1220; }
        .yellow { background:#fde68a; color:#0b1220; }
        .cream { background:#fef3c7; color:#0b1220; }
        .grey { background:#d1d5db; color:#0b1220; }
    </style>
</head>
<body>
    <div class="title">Entity Graph</div>
    <div class="muted">Mapping ID: {{ $selectedMappingId }}</div>
    <div style="height:10px;"></div>
    <table>
        <thead>
            <tr>
                <th>Entity</th>
                <th>Type</th>
                <th>Ownership %</th>
                <th>Parent</th>
                <th>Classification</th>
            </tr>
        </thead>
        <tbody>
            @foreach($nodes as $n)
                <tr>
                    <td>{{ $n['name'] ?? '' }}</td>
                    <td>{{ $n['type'] ?? '' }}</td>
                    <td>{{ $n['ownership'] ?? '-' }}</td>
                    <td>{{ $n['parent'] ?? '-' }}</td>
                    <td>
                        @php
                            $class = strtolower((string)($n['classification'] ?? ''));
                            $badgeClass = 'blue';
                            if (str_contains($class,'associate')) $badgeClass='yellow';
                            if (str_contains($class,'joint')) $badgeClass='cream';
                            if (str_contains($class,'branch')) $badgeClass='grey';
                        @endphp
                        <span class="badge {{ $badgeClass }}">{{ $n['classification'] ?? '-' }}</span>
                    </td>
                </tr>
            @endforeach
        </tbody>
    </table>
</body>
</html>

