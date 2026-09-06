<?php
namespace App\Models;use Illuminate\Database\Eloquent\Model;
class EmployeeTrip extends Model{protected $guarded=[];protected $casts=['start_date'=>'date','end_date'=>'date','advance_amount'=>'decimal:2','expense_amount'=>'decimal:2'];public function employee(){return $this->belongsTo(Employee::class);}public function expenses(){return $this->hasMany(TripExpense::class);}}
