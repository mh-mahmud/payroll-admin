<?php
namespace App\Models;use Illuminate\Database\Eloquent\Model;
class EmployeeReview extends Model{protected $guarded=[];protected $casts=['review_date'=>'date','rating'=>'decimal:1','ratings'=>'array'];public function employee(){return $this->belongsTo(Employee::class);}public function reviewer(){return $this->belongsTo(User::class);}public function cycle(){return $this->belongsTo(ReviewCycle::class,'review_cycle_id');}}
