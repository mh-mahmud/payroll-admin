<?php
namespace App\Models;use Illuminate\Database\Eloquent\Model;
class TripExpense extends Model{protected $guarded=[];protected $casts=['expense_date'=>'date','amount'=>'decimal:2','reimbursable'=>'boolean'];public function trip(){return $this->belongsTo(EmployeeTrip::class,'employee_trip_id');}}
