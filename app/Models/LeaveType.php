<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class LeaveType extends Model
{
    protected $guarded = [];

    protected $casts = [
        'is_paid' => 'boolean',
        'max_days' => 'integer',
    ];

    public function policies()
    {
        return $this->hasMany(LeavePolicy::class);
    }
}
