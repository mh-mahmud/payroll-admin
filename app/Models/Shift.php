<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Shift extends Model
{
    protected $fillable = ['name', 'unit', 'cycle', 'auto_shift', 'schedule_data'];
    protected $casts = ['schedule_data' => 'array', 'auto_shift' => 'boolean'];
}