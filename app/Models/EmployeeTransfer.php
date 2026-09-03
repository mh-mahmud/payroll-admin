<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
class EmployeeTransfer extends Model{
 protected $guarded=[];
 protected $casts=['transfer_date'=>'date','effective_date'=>'date'];
 public function employee(){return $this->belongsTo(Employee::class);}
 public function fromBranch(){return $this->belongsTo(Branch::class,'from_branch_id');}
 public function toBranch(){return $this->belongsTo(Branch::class,'to_branch_id');}
 public function fromDepartment(){return $this->belongsTo(Department::class,'from_department_id');}
 public function toDepartment(){return $this->belongsTo(Department::class,'to_department_id');}
 public function fromDesignation(){return $this->belongsTo(Designation::class,'from_designation_id');}
 public function toDesignation(){return $this->belongsTo(Designation::class,'to_designation_id');}
}
