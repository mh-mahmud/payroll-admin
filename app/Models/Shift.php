<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;

class Shift extends Model
{
    protected $fillable = [
        'name',
        'description',
        'start_time',
        'end_time',
        'break_duration',
        'break_start_time',
        'break_end_time',
        'grace_period',
        'is_night_shift',
        'status',
    ];

    protected $casts = [
        'is_night_shift' => 'boolean',
        'break_duration' => 'integer',
        'grace_period' => 'integer',
    ];

    protected $appends = [
        'working_hours',
        'type',
    ];

    public function scopeActive(Builder $query): Builder
    {
        return $query->where('status', 'active');
    }

    public function scopeInactive(Builder $query): Builder
    {
        return $query->where('status', 'inactive');
    }

    public function getTypeAttribute(): string
    {
        return $this->is_night_shift
            ? 'Night Shift'
            : 'Day Shift';
    }

    public function getWorkingHoursAttribute(): float
    {
        if (empty($this->start_time) || empty($this->end_time)) {
            return 0;
        }

        $start = Carbon::parse($this->start_time);
        $end = Carbon::parse($this->end_time);

        // If end time is before/equal to start time,
        // the shift continues into the next day.
        if ($end->lessThanOrEqualTo($start)) {
            $end->addDay();
        }

        $totalMinutes = $start->diffInMinutes($end);

        // Remove break duration
        $workingMinutes = max(
            0,
            $totalMinutes - (int) $this->break_duration
        );

        return round($workingMinutes / 60, 1);
    }
}