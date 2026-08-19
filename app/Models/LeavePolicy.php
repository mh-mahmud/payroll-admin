<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class LeavePolicy extends Model
{
    protected $guarded = [];

    protected $casts = [
        'requires_approval' => 'boolean',
        'carry_forward_limit' => 'integer',
        'min_days' => 'integer',
        'max_days' => 'integer',
    ];

    public function leaveType()
    {
        return $this->belongsTo(LeaveType::class);
    }
}
