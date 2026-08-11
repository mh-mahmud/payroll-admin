<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Employee extends Model
{
    protected $guarded = [];

    protected $casts = [
        'date_of_joining' => 'date',
        'login_status' => 'boolean',
    ];
}
