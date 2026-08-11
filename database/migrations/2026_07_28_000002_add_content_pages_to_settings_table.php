<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        $columns = collect(['size_guide', 'privacy_policy', 'cookie_policy'])
            ->reject(fn (string $column) => Schema::hasColumn('settings', $column))
            ->all();

        if ($columns) {
            Schema::table('settings', function (Blueprint $table) use ($columns) {
                foreach ($columns as $column) {
                    $table->longText($column)->nullable();
                }
            });
        }
    }

    public function down(): void
    {
        $columns = collect(['size_guide', 'privacy_policy', 'cookie_policy'])
            ->filter(fn (string $column) => Schema::hasColumn('settings', $column))
            ->all();

        if ($columns) {
            Schema::table('settings', fn (Blueprint $table) => $table->dropColumn($columns));
        }
    }
};
