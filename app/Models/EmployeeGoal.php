<?php
namespace App\Models;use Illuminate\Database\Eloquent\Model;
class EmployeeGoal extends Model{protected $guarded=[];protected $casts=['start_date'=>'date','end_date'=>'date','progress'=>'integer'];public function employee(){return $this->belongsTo(Employee::class);}public function type(){return $this->belongsTo(GoalType::class,'goal_type_id');}}
