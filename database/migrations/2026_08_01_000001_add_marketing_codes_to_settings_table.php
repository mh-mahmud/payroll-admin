<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    private array $columns = [
        'meta_pixel_code',
        'gtm_head_code',
        'gtm_footer_code',
        'google_analytics_code',
    ];

    public function up(): void
    {
        $columns = collect($this->columns)
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
        $columns = collect($this->columns)
            ->filter(fn (string $column) => Schema::hasColumn('settings', $column))
            ->all();

        if ($columns) {
            Schema::table('settings', fn (Blueprint $table) => $table->dropColumn($columns));
        }
    }
};
