<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class BreakTime extends Model
{
    protected $fillable = [
        'break_name',
        'start_time',
        'end_time',
        'duration_mins',
        'calculation_type',
    ];

    // protected $casts = [
    //     'duration_mins' => 'integer',
    // ];

    protected function casts(): array
    {
        return [
            'duration_mins' => 'integer',
        ];
    }

    public function getCalculationTypeLabelAttribute(): string
    {
        return match ($this->calculation_type) {
            'fixed' => 'Fixed Duration',
            'actual' => 'Actual Duration',
            default => ucfirst($this->calculation_type),
        };
    }
}