<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Report Matrix PDF</title>
    <style>
        body { font-family: DejaVu Sans, Arial, sans-serif; font-size: 12px; }
        table { width: 100%; border-collapse: collapse; }
        th, td { border: 1px solid #e5e7eb; padding: 6px; vertical-align: top; }
        th { background: #f3f4f6; }
        .badge { padding: 2px 6px; border-radius: 4px; display: inline-block; font-weight: 600; }
        .bg-success { background: #16a34a; color: #fff; }
        .bg-danger { background: #dc2626; color: #fff; }
        .bg-warning { background: #f59e0b; color: #111827; }
        .bg-primary { background: #1d4ed8; color: #fff; }
        .bg-secondary { background: #6b7280; color: #fff; }
        .text-dark { color: #111827; }
        .muted { color: #6b7280; }
    </style>
</head>
<body>
    <div style="margin-bottom:12px;">
        <div style="font-size:16px;font-weight:700;">Group Finance Matrix - Report Matrix</div>
        <div class="muted">Year: {{ $year }} | Period: {{ $month }}</div>
    </div>

    <table>
        <thead>
            <tr>
                <th>#</th>
                <th>Entity Name</th>
                <th>Submission Type</th>
                <th>Assigned To</th>
                <th>Deliverable</th>
                <th>Deadline</th>
                <th>Submission</th>
                <th>Reviewed</th>
                <th>Completed</th>
                <th>Attachments</th>
                <th>Template</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            @foreach($rows as $row)
                <tr>
                    <td>{{ $loop->iteration }}</td>
                    <td>{{ $row->entity_name }}</td>
                    <td>{{ $row->deliverable_short_name }}</td>
                    <td>{{ $row->assigned_to }}</td>
                    <td>{{ $row->deliverable_title }}</td>
                    <td>{{ $row->deadline_date ?? '-' }}</td>
                    <td>{{ $row->submission_date ?? '-' }}</td>
                    <td>{{ $row->reviewed_date ?? '-' }}</td>
                    <td>{{ $row->completed_date ?? '-' }}</td>
                    <td>{{ $row->attachment_count ?? 0 }}</td>
                    <td>{{ $row->template_name ?? 'N/A' }}</td>
                    <td>
                        <span class="badge {{ $row->status_class }}">{{ $row->status_label }}</span>
                    </td>
                </tr>
            @endforeach
        </tbody>
    </table>
</body>
</html>

