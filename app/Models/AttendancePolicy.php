<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AttendancePolicy extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'description',
        'late_arrival_grace',
        'early_departure_grace',
        'overtime_rate',
        'status',
    ];

    protected $casts = [
        'late_arrival_grace' => 'integer',
        'early_departure_grace' => 'integer',
        'overtime_rate' => 'decimal:2',
    ];

    public function scopeActive($query)
    {
        return $query->where('status', 'active');
    }

    public function scopeInactive($query)
    {
        return $query->where('status', 'inactive');
    }
}