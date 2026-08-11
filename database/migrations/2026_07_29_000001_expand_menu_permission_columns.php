<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('menus', function (Blueprint $table) {
            $table->string('name', 191)->change();
            $table->string('sub_name', 191)->nullable()->change();
        });
    }

    public function down(): void
    {
        Schema::table('menus', function (Blueprint $table) {
            $table->char('name', 25)->change();
            $table->char('sub_name', 25)->nullable()->change();
        });
    }
};
