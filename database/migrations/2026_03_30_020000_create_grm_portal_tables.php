<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('countries', function (Blueprint $table) {
            $table->id();
            $table->string('phone_code')->nullable();
            $table->string('country_code')->nullable();
            $table->string('country_name');
            $table->timestamps();
        });

        Schema::create('entity_periods', function (Blueprint $table) {
            $table->id();
            $table->unsignedSmallInteger('reporting_year');
            $table->string('reporting_month', 20);
            $table->boolean('is_lock_period')->default(false);
            $table->unsignedSmallInteger('status')->default(1);
            $table->unsignedBigInteger('created_by')->nullable();
            $table->timestamps();
        });

        Schema::create('entity', function (Blueprint $table) {
            $table->id();
            $table->string('entity_short_code')->nullable();
            $table->boolean('is_deleted')->default(false);
            $table->unsignedBigInteger('created_by')->nullable();
            $table->unsignedBigInteger('updated_by')->nullable();
            $table->string('mapping_id')->nullable();
            $table->string('cognos_code')->nullable();
            $table->timestamps();
        });

        Schema::create('entity_period_mapping', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('entity_id');
            $table->string('entity_name');
            $table->string('general_company_legal_type')->nullable();
            $table->unsignedBigInteger('country_of_incorporation')->nullable();
            $table->string('general_jurisdiction_of_incorporation')->nullable();
            $table->date('general_incorporation_date')->nullable();
            $table->string('general_authorised_signatories')->nullable();
            $table->text('general_registered_office_address')->nullable();
            $table->string('general_trade_license_number')->nullable();
            $table->date('general_trade_license_expiry_date')->nullable();
            $table->decimal('general_share_capital', 20, 2)->nullable();
            $table->unsignedBigInteger('general_numbers_of_shares')->nullable();
            $table->date('general_liquidation_date')->nullable();
            $table->string('assigned_to')->nullable();
            $table->decimal('ownership_percentage', 6, 2)->nullable();
            $table->string('category_name')->nullable();
            $table->string('company_status')->nullable();
            $table->string('auditor')->nullable();
            $table->string('classification')->nullable();
            $table->integer('parent')->nullable();
            $table->string('legal_ownership')->nullable();
            $table->text('principal_activities')->nullable();
            $table->boolean('is_reporting_entity')->default(true);
            $table->unsignedBigInteger('period_id')->nullable();
            $table->boolean('is_lock_entity')->default(false);
            $table->boolean('is_deleted')->default(false);
            $table->timestamps();
        });

        Schema::create('entity_item', function (Blueprint $table) {
            $table->id();
            $table->string('title');
            $table->string('short_name');
            $table->boolean('is_default')->default(false);
            $table->unsignedSmallInteger('status')->default(1);
            $table->boolean('is_annual')->default(true);
            $table->boolean('is_reminder')->default(false);
            $table->unsignedSmallInteger('display_order')->default(1);
            $table->timestamps();
        });

        Schema::create('entity_item_mapping', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('entity_item_id');
            $table->unsignedSmallInteger('year');
            $table->timestamps();
        });

        Schema::create('entity_reporting_matrix', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('entity_id');
            $table->unsignedBigInteger('item_id');
            $table->unsignedSmallInteger('reporting_year');
            $table->string('reporting_month', 20);
            $table->date('deadline_date');
            $table->date('submission_date')->nullable();
            $table->date('reviewed_date')->nullable();
            $table->date('completed_date')->nullable();
            $table->boolean('is_deleted')->default(false);
            $table->unsignedBigInteger('created_by')->nullable();
            $table->unsignedBigInteger('updated_by')->nullable();
            $table->timestamps();
        });

        Schema::create('entity_mapping_attachments', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('period_id')->nullable();
            $table->unsignedBigInteger('entity_mapping_id')->nullable();
            $table->string('attachment_path')->nullable();
            $table->string('type')->nullable();
            $table->string('filename')->nullable();
            $table->string('actual_filename')->nullable();
            $table->string('is_reminder')->nullable();
            $table->date('expiry_date')->nullable();
            $table->unsignedBigInteger('created_by')->nullable();
            $table->timestamps();
        });

        Schema::create('deliverable_templates', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('deliverable_id');
            $table->string('template_name');
            $table->string('template_period')->nullable();
            $table->unsignedSmallInteger('template_year')->nullable();
            $table->string('template_path')->nullable();
            $table->unsignedSmallInteger('display_order')->default(1);
            $table->boolean('is_deleted')->default(false);
            $table->timestamps();
        });

        Schema::create('deliverable_contact_list', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('report_matrix_id');
            $table->string('contact_name');
            $table->string('contact_email');
            $table->boolean('is_deleted')->default(false);
            $table->timestamps();
        });

        Schema::create('tbl_module_categories', function (Blueprint $table) {
            $table->bigIncrements('ID');
            $table->string('category_name');
            $table->string('css_class')->nullable();
            $table->unsignedSmallInteger('display_order')->default(1);
            $table->timestamps();
        });

        Schema::create('tbl_modules', function (Blueprint $table) {
            $table->bigIncrements('ID');
            $table->unsignedBigInteger('module_category_ID')->nullable();
            $table->string('module_name');
            $table->string('route')->unique();
            $table->boolean('show_in_menu')->default(true);
            $table->unsignedSmallInteger('display_order')->default(1);
            $table->timestamps();
        });

        Schema::create('tbl_roles', function (Blueprint $table) {
            $table->bigIncrements('ID');
            $table->string('role_name');
            $table->unsignedSmallInteger('display_order')->default(1);
            $table->timestamps();
        });

        Schema::create('tbl_role_privileges', function (Blueprint $table) {
            $table->bigIncrements('ID');
            $table->unsignedBigInteger('role_ID');
            $table->unsignedBigInteger('module_ID');
            $table->timestamps();
        });

        Schema::create('tbl_admin', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('employee_ad_id')->unique();
            $table->boolean('is_active')->default(true);
            $table->string('password');
            $table->string('entity_type')->default('all');
            $table->string('deliverable_entity_type')->default('all');
            $table->string('deliverable_type')->default('all');
            $table->timestamps();
        });

        Schema::create('tbl_admin_user_roles', function (Blueprint $table) {
            $table->bigIncrements('ID');
            $table->unsignedBigInteger('admin_ID');
            $table->unsignedBigInteger('role_ID');
            $table->timestamps();
        });

        Schema::create('tbl_admin_user_entities', function (Blueprint $table) {
            $table->bigIncrements('ID');
            $table->unsignedBigInteger('admin_ID');
            $table->unsignedBigInteger('entity_ID');
            $table->unsignedBigInteger('added_by')->nullable();
            $table->timestamps();
        });

        Schema::create('tbl_employees', function (Blueprint $table) {
            $table->bigIncrements('ID');
            $table->unsignedBigInteger('employee_ad_id')->unique();
            $table->string('full_name');
            $table->string('email_address');
            $table->string('department')->nullable();
            $table->string('company')->nullable();
            $table->timestamps();
        });

        Schema::create('tbl_teams', function (Blueprint $table) {
            $table->id();
            $table->string('team_name');
            $table->unsignedBigInteger('created_by')->nullable();
            $table->unsignedSmallInteger('display_order')->default(1);
            $table->boolean('is_deleted')->default(false);
            $table->boolean('is_active')->default(true);
            $table->timestamps();
        });

        Schema::create('tbl_admin_user_teams', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('admin_id');
            $table->unsignedBigInteger('team_id');
            $table->timestamps();
        });

        Schema::create('group_structure_team_permissions', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('team_id');
            $table->unsignedBigInteger('module_id');
            $table->unsignedSmallInteger('permission')->default(1);
            $table->boolean('is_required')->default(false);
            $table->unsignedBigInteger('module_category_id')->nullable();
            $table->timestamps();
        });

        Schema::create('email_templates', function (Blueprint $table) {
            $table->id();
            $table->string('template_name');
            $table->longText('template_body')->nullable();
            $table->boolean('sts')->default(false);
            $table->unsignedBigInteger('created_by')->nullable();
            $table->timestamps();
        });

        Schema::create('email_groups', function (Blueprint $table) {
            $table->id();
            $table->string('group_name');
            $table->string('is_default', 1)->nullable();
            $table->unsignedBigInteger('created_by')->nullable();
            $table->timestamps();
        });

        Schema::create('email_recipients', function (Blueprint $table) {
            $table->id();
            $table->string('full_name');
            $table->string('email_address');
            $table->string('designation')->nullable();
            $table->string('contact_number')->nullable();
            $table->unsignedBigInteger('created_by')->nullable();
            $table->timestamps();
        });

        Schema::create('email_groups_recipients', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('group_id');
            $table->unsignedBigInteger('recipient_id');
            $table->string('type')->nullable();
            $table->timestamps();
        });

        Schema::create('email_notifications', function (Blueprint $table) {
            $table->id();
            $table->string('notification_title');
            $table->string('notification_subject');
            $table->unsignedBigInteger('group_id')->nullable();
            $table->unsignedBigInteger('template_id')->nullable();
            $table->string('deadline_condition')->nullable();
            $table->string('sts')->nullable();
            $table->unsignedBigInteger('reporting_period_id')->nullable();
            $table->string('from_email')->nullable();
            $table->string('from_name')->nullable();
            $table->dateTime('email_send_date')->nullable();
            $table->timestamps();
        });

        Schema::create('generated_periods', function (Blueprint $table) {
            $table->id();
            $table->unsignedSmallInteger('year');
            $table->string('period');
            $table->unsignedBigInteger('updated_by')->nullable();
            $table->timestamps();
        });

        Schema::create('audits', function (Blueprint $table) {
            $table->id();
            $table->string('user_type')->nullable();
            $table->unsignedBigInteger('user_id')->nullable();
            $table->string('event')->nullable();
            $table->string('auditable_type')->nullable();
            $table->unsignedBigInteger('auditable_id')->nullable();
            $table->longText('old_values')->nullable();
            $table->longText('new_values')->nullable();
            $table->string('url')->nullable();
            $table->string('ip_address')->nullable();
            $table->string('user_agent')->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('audits');
        Schema::dropIfExists('generated_periods');
        Schema::dropIfExists('email_notifications');
        Schema::dropIfExists('email_groups_recipients');
        Schema::dropIfExists('email_recipients');
        Schema::dropIfExists('email_groups');
        Schema::dropIfExists('email_templates');
        Schema::dropIfExists('group_structure_team_permissions');
        Schema::dropIfExists('tbl_admin_user_teams');
        Schema::dropIfExists('tbl_teams');
        Schema::dropIfExists('tbl_admin_user_entities');
        Schema::dropIfExists('tbl_admin_user_roles');
        Schema::dropIfExists('tbl_admin');
        Schema::dropIfExists('tbl_employees');
        Schema::dropIfExists('tbl_role_privileges');
        Schema::dropIfExists('tbl_roles');
        Schema::dropIfExists('tbl_modules');
        Schema::dropIfExists('tbl_module_categories');
        Schema::dropIfExists('deliverable_contact_list');
        Schema::dropIfExists('deliverable_templates');
        Schema::dropIfExists('entity_mapping_attachments');
        Schema::dropIfExists('entity_reporting_matrix');
        Schema::dropIfExists('entity_item_mapping');
        Schema::dropIfExists('entity_item');
        Schema::dropIfExists('entity_period_mapping');
        Schema::dropIfExists('entity');
        Schema::dropIfExists('entity_periods');
        Schema::dropIfExists('countries');
    }
};

