<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::table('announcements', function (Blueprint $table) {
            if (!Schema::hasColumn('announcements', 'short_description')) $table->text('short_description')->nullable();
            if (!Schema::hasColumn('announcements', 'content')) $table->longText('content')->nullable();
            if (!Schema::hasColumn('announcements', 'attachment')) $table->string('attachment')->nullable();
            if (!Schema::hasColumn('announcements', 'is_featured')) $table->boolean('is_featured')->default(false);
            if (!Schema::hasColumn('announcements', 'is_high_priority')) $table->boolean('is_high_priority')->default(false);
            if (!Schema::hasColumn('announcements', 'is_company_wide')) $table->boolean('is_company_wide')->default(true);
            if (!Schema::hasColumn('announcements', 'branch_ids')) $table->json('branch_ids')->nullable();
            if (!Schema::hasColumn('announcements', 'department_ids')) $table->json('department_ids')->nullable();
            if (!Schema::hasColumn('announcements', 'views_count')) $table->unsignedInteger('views_count')->default(0);
        });
    }

    public function down(): void
    {
        Schema::table('announcements', function (Blueprint $table) {
            $table->dropColumn(['short_description','content','attachment','is_featured','is_high_priority','is_company_wide','branch_ids','department_ids','views_count']);
        });
    }
};
