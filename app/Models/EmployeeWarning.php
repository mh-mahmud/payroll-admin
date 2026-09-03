<?php
namespace App\Models;use Illuminate\Database\Eloquent\Model;
class EmployeeWarning extends Model{protected $guarded=[];protected $casts=['warning_date'=>'date','expiry_date'=>'date','improvement_start_date'=>'date','improvement_end_date'=>'date','acknowledgment_date'=>'date','has_improvement_plan'=>'boolean'];public function employee(){return $this->belongsTo(Employee::class);}public function manager(){return $this->belongsTo(User::class,'warning_by');}}
