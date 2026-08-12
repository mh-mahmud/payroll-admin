<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Employee extends Model
{
    protected $guarded = [];

    protected $casts = [
        'date_of_joining' => 'date',
        'date_of_birth' => 'date',
        'base_salary' => 'decimal:2',
        'login_status' => 'boolean',
    ];
    public function documents(){return $this->hasMany(EmployeeDocument::class);}
}
