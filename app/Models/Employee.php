<?php

namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable;

class Employee extends Authenticatable
{
    protected $guarded = [];
    protected $hidden = ['password', 'remember_token'];

    public function getUserTypeAttribute(): string{return 'employee';}
    public function getStatusAttribute(): bool{return (bool) $this->login_status;}
    public function getFirstNameAttribute(): string{return trim(explode(' ',(string)$this->name,2)[0]??'Employee');}
    public function getLastNameAttribute(): string{return trim(explode(' ',(string)$this->name,2)[1]??'');}
    public function get_menu_data($type=null){return null;}
    public function get_permission_data($type=null){return null;}
    public function hasPermission($permission): bool{return false;}

    protected $casts = [
        'date_of_joining' => 'date',
        'date_of_birth' => 'date',
        'base_salary' => 'decimal:2',
        'login_status' => 'boolean',
    ];
    public function documents(){return $this->hasMany(EmployeeDocument::class);}
}
