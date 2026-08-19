<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration {
    public function up(): void {
        if (!Schema::hasTable('leave_types')) {
            Schema::create('leave_types', function (Blueprint $table) {
                $table->id();
                $table->string('name');
                $table->text('description')->nullable();
                $table->integer('max_days');
                $table->string('color', 20);
                $table->boolean('is_paid')->default(true);
                $table->string('status', 20)->default('Active');
                $table->timestamps();
            });
        }

        // Insert Sidebar Menus
        $parentMenu = DB::table('menus')->where('name', 'Leave Management')->first();
        if (!$parentMenu) {
            $parentId = DB::table('menus')->insertGetId([
                'parent_id' => null,
                'name' => 'Leave Management',
                'sub_name' => '',
                'show_in_menu' => 1,
                'status' => 1,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        } else {
            $parentId = $parentMenu->id;
        }

        // Insert Submenus
        $submenus = [
            ['name' => 'Leave Applications', 'sub_name' => 'leave-applications'],
            ['name' => 'Leave Balances', 'sub_name' => 'leave-balances'],
            ['name' => 'Leave Types', 'sub_name' => 'leave-types'],
            ['name' => 'Leave Policies', 'sub_name' => 'leave-policies'],
        ];

        foreach ($submenus as $submenu) {
            $exists = DB::table('menus')
                ->where('parent_id', $parentId)
                ->where('name', $submenu['name'])
                ->exists();
            if (!$exists) {
                DB::table('menus')->insert([
                    'parent_id' => $parentId,
                    'name' => $submenu['name'],
                    'sub_name' => $submenu['sub_name'],
                    'show_in_menu' => 1,
                    'status' => 1,
                    'created_at' => now(),
                    'updated_at' => now(),
                ]);
            }
        }
    }

    public function down(): void {
        Schema::dropIfExists('leave_types');
        
        $parentMenu = DB::table('menus')->where('name', 'Leave Management')->first();
        if ($parentMenu) {
            DB::table('menus')->where('parent_id', $parentMenu->id)->delete();
            DB::table('menus')->where('id', $parentMenu->id)->delete();
        }
    }
};
