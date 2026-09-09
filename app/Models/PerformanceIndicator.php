<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class PerformanceIndicator extends Model
{
    protected $guarded = [];

    protected $casts = ['status' => 'boolean'];

    public function category(): BelongsTo
    {
        return $this->belongsTo(IndicatorCategory::class, 'indicator_category_id');
    }
}
