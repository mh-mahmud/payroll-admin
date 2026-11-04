<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Timetable extends Model
{
    protected $fillable = [
        'name',
        'work_hours_assign_to',
        'type',
        'check_in',
        'check_in_start_time',
        'check_in_start_days',
        'check_in_end_time',
        'check_in_end_days',
        'check_out',
        'check_out_start_time',
        'check_out_start_days',
        'check_out_end_time',
        'check_out_end_days',
        'work_day',
        'color',
        'max_ot_enabled',
        'max_ot_duration',
        'overtime_enabled',
        'overtime_rules',
        'clock_in_required',
        'clock_out_required',
        'allow_late_in',
        'allow_early_out',
        'punch_state_based',
        'day_change_time',
        'unscheduled_settings',
    ];

    protected function casts(): array
    {
        return [
            'work_day' => 'float',
            'max_ot_enabled' => 'boolean',
            'overtime_enabled' => 'boolean',
            'clock_in_required' => 'boolean',
            'clock_out_required' => 'boolean',
            'overtime_rules' => 'array',
            'unscheduled_settings' => 'array',
        ];
    }

    public function breakTimes(): BelongsToMany
    {
        return $this->belongsToMany(
            BreakTime::class,
            'timetable_break_time'
        )->withTimestamps();
    }
}
