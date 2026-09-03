<?php
namespace App\Models;use Illuminate\Database\Eloquent\Model;
class EmployeeResignation extends Model{protected $guarded=[];protected $casts=['resignation_date'=>'date','last_working_day'=>'date','exit_interview_date'=>'date','exit_interview_conducted'=>'boolean'];public function employee(){return $this->belongsTo(Employee::class);}}
