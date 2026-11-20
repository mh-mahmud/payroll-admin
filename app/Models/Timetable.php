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
        'min_ot_duration',
        'overtime_enabled',
        'min_ot_enabled',
        'ot_block_size_enabled',
        'ot_block_size_minutes',
        'ot_block_grace_enabled',
        'ot_block_grace_minutes',
        'overtime_rules',
        'clock_in_required',
        'clock_out_required',
        'allow_late_in',
        'allow_early_out',
        'punch_state_based',
        'in_time_control_enabled',
        'out_time_control_enabled',
        'in_time_control_minutes',
        'out_time_control_minutes',
        'day_change_time',
        'unscheduled_settings',
    ];

    /*protected function casts(): array
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
    }*/

    protected $casts = [
        'max_ot_enabled'           => 'boolean',
        'min_ot_duration'          => 'integer',
        'overtime_enabled'         => 'boolean',
        'min_ot_enabled'           => 'boolean',
        'ot_block_size_enabled'    => 'boolean',
        'ot_block_grace_enabled'   => 'boolean',
        'clock_in_required'        => 'boolean',
        'clock_out_required'       => 'boolean',
        'in_time_control_enabled'  => 'boolean',
        'out_time_control_enabled' => 'boolean',
        'ot_block_size_minutes'    => 'integer',
        'ot_block_grace_minutes'   => 'integer',
        'in_time_control_minutes'  => 'integer',
        'out_time_control_minutes' => 'integer',
        'allow_late_in'            => 'integer',
        'allow_early_out'          => 'integer',

        'overtime_rules'       => 'array',
        'unscheduled_settings' => 'array',
    ];

    public function breakTimes(): BelongsToMany
    {
        return $this->belongsToMany(
            BreakTime::class,
            'timetable_break_time'
        )->withTimestamps();
    }

    // Helper to format times for the UI (e.g., 08:00:00)
    public function getFormattedCheckInAttribute()
    {
        return date('H:i:s', strtotime($this->check_in));
    }

    public function getFormattedCheckOutAttribute()
    {
        return date('H:i:s', strtotime($this->check_out));
    }
}
