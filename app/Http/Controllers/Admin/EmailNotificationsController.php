<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\EmailGroup;
use App\Models\EmailNotification;
use App\Models\EmailRecipient;
use App\Models\EmailTemplate;
use App\Support\GrmUpload;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Throwable;

class EmailNotificationsController extends Controller
{
    public function templates()
    {
        $templates = EmailTemplate::query()->orderByDesc('id')->get();

        return view('email_notifications.templates', [
            'title' => 'Email Templates',
            'templates' => $templates,
        ]);
    }

    public function storeTemplate(Request $request)
    {
        $this->authorizeSuperAdmin($request);

        $validator = Validator::make(
            $request->all(),
            array_merge([
                'template_name' => ['required', 'string', 'max:255'],
                'template_body' => ['nullable', 'string'],
                'sts' => ['nullable', 'in:0,1'],
            ], GrmUpload::fieldRule('attachment_file', 'office', false)),
            GrmUpload::messages('attachment_file', 'office')
        );
        $validator->validate();

        try {
            $attachmentPath = $request->hasFile('attachment_file')
                ? $request->file('attachment_file')->store('email-templates', 'public')
                : null;

            EmailTemplate::create([
                'template_name' => (string) $request->input('template_name'),
                'template_body' => (string) $request->input('template_body', ''),
                'attachment_path' => $attachmentPath,
                'sts' => (int) $request->input('sts', 1),
                'created_by' => (int) $request->session()->get('admin_id', 0) ?: null,
            ]);
        } catch (Throwable $e) {
            report($e);

            return back()
                ->withInput()
                ->with('error', 'Could not save the template or attachment. Check allowed file types and size, then try again.');
        }

        return redirect()->route('email_notifications.templates')->with('success', 'Template created successfully.');
    }

    public function updateTemplate(int $id, Request $request)
    {
        $this->authorizeSuperAdmin($request);
        $data = $request->validate(
            array_merge([
                'template_name' => ['required', 'string', 'max:255'],
                'template_body' => ['nullable', 'string'],
                'sts' => ['nullable', 'in:0,1'],
            ], GrmUpload::fieldRule('attachment_file', 'office', false)),
            GrmUpload::messages('attachment_file', 'office')
        );

        try {
            $attachmentPath = $request->hasFile('attachment_file')
                ? $request->file('attachment_file')->store('email-templates', 'public')
                : null;
            $updatePayload = [
                'template_name' => (string) $data['template_name'],
                'template_body' => (string) ($data['template_body'] ?? ''),
                'sts' => (int) ($data['sts'] ?? 1),
            ];
            if ($attachmentPath) {
                $updatePayload['attachment_path'] = $attachmentPath;
            }
            EmailTemplate::query()->where('id', $id)->update($updatePayload);
        } catch (Throwable $e) {
            report($e);

            return back()
                ->withInput()
                ->with('error', 'Could not update the template or attachment. Check allowed file types and size, then try again.');
        }

        return redirect()->route('email_notifications.templates')->with('success', 'Template updated successfully.');
    }

    public function destroyTemplate(int $id, Request $request)
    {
        $this->authorizeSuperAdmin($request);
        EmailTemplate::query()->where('id', $id)->delete();
        return redirect()->route('email_notifications.templates')->with('success', 'Template deleted successfully.');
    }

    public function groups()
    {
        $groups = EmailGroup::query()->orderByDesc('id')->get();
        $recipients = EmailRecipient::query()->orderBy('full_name')->get();

        $pivot = DB::table('email_groups_recipients')->get();
        $recipientIdsByGroup = [];
        foreach ($pivot as $row) {
            $gid = (int)$row->group_id;
            $rid = (int)$row->recipient_id;
            if (!isset($recipientIdsByGroup[$gid])) {
                $recipientIdsByGroup[$gid] = [];
            }
            $recipientIdsByGroup[$gid][] = $rid;
        }

        return view('email_notifications.groups', [
            'title' => 'Email Groups',
            'groups' => $groups,
            'recipients' => $recipients,
            'recipientIdsByGroup' => $recipientIdsByGroup,
        ]);
    }

    public function storeGroup(Request $request)
    {
        $this->authorizeSuperAdmin($request);

        $validator = Validator::make($request->all(), [
            'group_name' => ['required', 'string', 'max:255'],
            'is_default' => ['nullable', 'in:0,1'],
            'recipient_ids' => ['nullable', 'array'],
            'recipient_ids.*' => ['integer'],
        ]);
        $validator->validate();

        $group = EmailGroup::create([
            'group_name' => (string)$request->input('group_name'),
            'is_default' => (string)$request->input('is_default', '0'),
            'created_by' => (int)$request->session()->get('admin_id', 0) ?: null,
        ]);

        foreach (array_map('intval', $request->input('recipient_ids', [])) as $rid) {
            DB::table('email_groups_recipients')->insert([
                'group_id' => $group->id,
                'recipient_id' => $rid,
                'type' => 'to',
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }

        return redirect()->route('email_notifications.groups')->with('success', 'Group created successfully.');
    }

    public function updateGroup(int $id, Request $request)
    {
        $this->authorizeSuperAdmin($request);
        $data = $request->validate([
            'group_name' => ['required', 'string', 'max:255'],
            'is_default' => ['nullable', 'in:0,1'],
            'recipient_ids' => ['nullable', 'array'],
            'recipient_ids.*' => ['integer'],
        ]);
        EmailGroup::query()->where('id', $id)->update([
            'group_name' => (string)$data['group_name'],
            'is_default' => (string)($data['is_default'] ?? '0'),
        ]);
        DB::table('email_groups_recipients')->where('group_id', $id)->delete();
        foreach (array_map('intval', $data['recipient_ids'] ?? []) as $rid) {
            DB::table('email_groups_recipients')->insert([
                'group_id' => $id,
                'recipient_id' => $rid,
                'type' => 'to',
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
        return redirect()->route('email_notifications.groups')->with('success', 'Group updated successfully.');
    }

    public function destroyGroup(int $id, Request $request)
    {
        $this->authorizeSuperAdmin($request);
        DB::table('email_groups_recipients')->where('group_id', $id)->delete();
        EmailGroup::query()->where('id', $id)->delete();
        return redirect()->route('email_notifications.groups')->with('success', 'Group deleted successfully.');
    }

    public function recipients()
    {
        $recipients = EmailRecipient::query()->orderByDesc('id')->get();

        return view('email_notifications.recipients', [
            'title' => 'Email Recipients',
            'recipients' => $recipients,
        ]);
    }

    public function storeRecipient(Request $request)
    {
        $this->authorizeSuperAdmin($request);

        $validator = Validator::make($request->all(), [
            'full_name' => ['required', 'string', 'max:255'],
            'email_address' => ['required', 'email', 'max:255'],
            'designation' => ['nullable', 'string', 'max:255'],
            'contact_number' => ['nullable', 'string', 'max:255'],
        ]);
        $validator->validate();

        EmailRecipient::create([
            'full_name' => (string)$request->input('full_name'),
            'email_address' => (string)$request->input('email_address'),
            'designation' => (string)$request->input('designation', ''),
            'contact_number' => (string)$request->input('contact_number', ''),
            'created_by' => (int)$request->session()->get('admin_id', 0) ?: null,
        ]);

        return redirect()->route('email_notifications.recipients')->with('success', 'Recipient created successfully.');
    }

    public function updateRecipient(int $id, Request $request)
    {
        $this->authorizeSuperAdmin($request);
        $data = $request->validate([
            'full_name' => ['required', 'string', 'max:255'],
            'email_address' => ['required', 'email', 'max:255'],
            'designation' => ['nullable', 'string', 'max:255'],
            'contact_number' => ['nullable', 'string', 'max:255'],
        ]);
        EmailRecipient::query()->where('id', $id)->update([
            'full_name' => (string)$data['full_name'],
            'email_address' => (string)$data['email_address'],
            'designation' => (string)($data['designation'] ?? ''),
            'contact_number' => (string)($data['contact_number'] ?? ''),
        ]);
        return redirect()->route('email_notifications.recipients')->with('success', 'Recipient updated successfully.');
    }

    public function destroyRecipient(int $id, Request $request)
    {
        $this->authorizeSuperAdmin($request);
        DB::table('email_groups_recipients')->where('recipient_id', $id)->delete();
        EmailRecipient::query()->where('id', $id)->delete();
        return redirect()->route('email_notifications.recipients')->with('success', 'Recipient deleted successfully.');
    }

    public function notifications()
    {
        $notifications = EmailNotification::query()->orderByDesc('id')->get();
        $groups = EmailGroup::query()->orderBy('group_name')->get(['id', 'group_name']);
        $templates = EmailTemplate::query()->orderBy('template_name')->get(['id', 'template_name']);

        $groupNames = $groups->pluck('group_name', 'id')->all();
        $templateNames = $templates->pluck('template_name', 'id')->all();

        return view('email_notifications.notifications', [
            'title' => 'Email Notifications',
            'notifications' => $notifications,
            'groups' => $groups,
            'templates' => $templates,
            'groupNames' => $groupNames,
            'templateNames' => $templateNames,
        ]);
    }

    public function storeNotification(Request $request)
    {
        $this->authorizeSuperAdmin($request);

        $validator = Validator::make($request->all(), [
            'notification_title' => ['required', 'string', 'max:255'],
            'notification_subject' => ['required', 'string', 'max:255'],
            'group_id' => ['nullable', 'integer'],
            'template_id' => ['nullable', 'integer'],
            'deadline_condition' => ['nullable', 'string', 'max:255'],
            'from_email' => ['nullable', 'email', 'max:255'],
            'from_name' => ['nullable', 'string', 'max:255'],
            'email_send_date' => ['nullable', 'date'],
            'sts' => ['nullable', 'in:active,inactive'],
        ]);
        $validator->validate();

        EmailNotification::create([
            'notification_title' => (string)$request->input('notification_title'),
            'notification_subject' => (string)$request->input('notification_subject'),
            'group_id' => $request->input('group_id') ? (int)$request->input('group_id') : null,
            'template_id' => $request->input('template_id') ? (int)$request->input('template_id') : null,
            'deadline_condition' => (string)$request->input('deadline_condition', ''),
            'sts' => (string)$request->input('sts', 'active'),
            'reporting_period_id' => null,
            'from_email' => (string)$request->input('from_email', 'noreply@demo.com'),
            'from_name' => (string)$request->input('from_name', 'GRM Portal'),
            'email_send_date' => $request->input('email_send_date') ?: null,
        ]);

        return redirect()->route('email_notifications.notifications')->with('success', 'Notification created successfully.');
    }

    public function updateNotification(int $id, Request $request)
    {
        $this->authorizeSuperAdmin($request);
        $data = $request->validate([
            'notification_title' => ['required', 'string', 'max:255'],
            'notification_subject' => ['required', 'string', 'max:255'],
            'group_id' => ['nullable', 'integer'],
            'template_id' => ['nullable', 'integer'],
            'deadline_condition' => ['nullable', 'string', 'max:255'],
            'from_email' => ['nullable', 'email', 'max:255'],
            'from_name' => ['nullable', 'string', 'max:255'],
            'email_send_date' => ['nullable', 'date'],
            'sts' => ['nullable', 'in:active,inactive'],
        ]);
        EmailNotification::query()->where('id', $id)->update([
            'notification_title' => (string)$data['notification_title'],
            'notification_subject' => (string)$data['notification_subject'],
            'group_id' => !empty($data['group_id']) ? (int)$data['group_id'] : null,
            'template_id' => !empty($data['template_id']) ? (int)$data['template_id'] : null,
            'deadline_condition' => (string)($data['deadline_condition'] ?? ''),
            'from_email' => (string)($data['from_email'] ?? 'noreply@demo.com'),
            'from_name' => (string)($data['from_name'] ?? 'GRM Portal'),
            'email_send_date' => $data['email_send_date'] ?? null,
            'sts' => (string)($data['sts'] ?? 'active'),
        ]);
        return redirect()->route('email_notifications.notifications')->with('success', 'Notification updated successfully.');
    }

    public function destroyNotification(int $id, Request $request)
    {
        $this->authorizeSuperAdmin($request);
        EmailNotification::query()->where('id', $id)->delete();
        return redirect()->route('email_notifications.notifications')->with('success', 'Notification deleted successfully.');
    }

    private function authorizeSuperAdmin(Request $request): void
    {
        $roleNames = $request->session()->get('admin_role_names', []);
        if (!in_array('Super Admin', $roleNames, true)) {
            abort(403);
        }
    }
}

