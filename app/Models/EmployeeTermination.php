<?php
namespace App\Models;use Illuminate\Database\Eloquent\Model;
class EmployeeTermination extends Model{protected $guarded=[];protected $casts=['notice_date'=>'date','termination_date'=>'date','exit_interview_date'=>'date','exit_interview_conducted'=>'boolean'];public function employee(){return $this->belongsTo(Employee::class);}public function type(){return $this->belongsTo(TerminationType::class,'termination_type_id');}}
