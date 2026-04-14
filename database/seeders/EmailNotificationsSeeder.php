<?php

namespace Database\Seeders;

use App\Models\EmailGroup;
use App\Models\EmailNotification;
use App\Models\EmailRecipient;
use App\Models\EmailTemplate;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class EmailNotificationsSeeder extends Seeder
{
    public function run(): void
    {
        DB::table('email_groups_recipients')->delete();
        EmailNotification::query()->delete();
        EmailGroup::query()->delete();
        EmailRecipient::query()->delete();
        EmailTemplate::query()->delete();

        $templates = [
            ['name' => 'Deadline Reminder', 'body' => 'Please submit before deadline.'],
            ['name' => 'Overdue Alert', 'body' => 'Submission is overdue. Please take action.'],
            ['name' => 'Completion Confirmation', 'body' => 'Submission completed successfully.'],
        ];
        $templateIds = [];
        foreach ($templates as $idx => $t) {
            $m = EmailTemplate::create([
                'template_name' => $t['name'],
                'template_body' => $t['body'],
                'sts' => 1,
                'created_by' => null,
            ]);
            $templateIds[] = $m->id;
        }

        $recipients = [
            ['name' => 'Demo Finance Lead', 'email' => 'finance.lead@demo.com', 'designation' => 'Finance Lead'],
            ['name' => 'Demo Legal Lead', 'email' => 'legal.lead@demo.com', 'designation' => 'Legal Lead'],
            ['name' => 'Demo Auditor', 'email' => 'auditor@demo.com', 'designation' => 'Auditor'],
            ['name' => 'Demo Group CFO', 'email' => 'cfo@demo.com', 'designation' => 'Group CFO'],
            ['name' => 'Demo Controller', 'email' => 'controller@demo.com', 'designation' => 'Controller'],
        ];
        $recipientIds = [];
        foreach ($recipients as $r) {
            $rec = EmailRecipient::create([
                'full_name' => $r['name'],
                'email_address' => $r['email'],
                'designation' => $r['designation'],
                'contact_number' => '+971500000000',
                'created_by' => null,
            ]);
            $recipientIds[] = $rec->id;
        }

        $groups = [
            ['name' => 'Finance Team Recipients', 'default' => '1', 'members' => [0, 3, 4]],
            ['name' => 'Legal Team Recipients', 'default' => '0', 'members' => [1, 2]],
            ['name' => 'Executive Recipients', 'default' => '0', 'members' => [3]],
        ];
        $groupIds = [];
        foreach ($groups as $g) {
            $group = EmailGroup::create([
                'group_name' => $g['name'],
                'is_default' => $g['default'],
                'created_by' => null,
            ]);
            $groupIds[] = $group->id;

            foreach ($g['members'] as $idx) {
                DB::table('email_groups_recipients')->insert([
                    'group_id' => $group->id,
                    'recipient_id' => $recipientIds[$idx],
                    'type' => 'to',
                    'created_at' => now(),
                    'updated_at' => now(),
                ]);
            }
        }

        $notifications = [
            ['title' => 'FR Deadline Alert', 'subject' => 'FR due in 7 days', 'deadline' => '7_days_before', 'status' => 'active', 'offset' => 2],
            ['title' => 'TR Overdue Alert', 'subject' => 'TR overdue submission', 'deadline' => 'overdue', 'status' => 'active', 'offset' => 1],
            ['title' => 'Monthly Summary', 'subject' => 'Monthly submission summary', 'deadline' => 'month_end', 'status' => 'inactive', 'offset' => 10],
        ];

        foreach ($notifications as $idx => $n) {
            EmailNotification::create([
                'notification_title' => $n['title'],
                'notification_subject' => $n['subject'],
                'group_id' => $groupIds[$idx % count($groupIds)],
                'template_id' => $templateIds[$idx % count($templateIds)],
                'deadline_condition' => $n['deadline'],
                'sts' => $n['status'],
                'reporting_period_id' => null,
                'from_email' => 'noreply@demo.com',
                'from_name' => 'GRM Portal',
                'email_send_date' => now()->addDays($n['offset']),
            ]);
        }
    }
}

