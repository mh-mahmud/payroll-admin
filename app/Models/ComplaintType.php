<?php
namespace App\Models;use Illuminate\Database\Eloquent\Model;
class ComplaintType extends Model{protected $guarded=[];protected $casts=['status'=>'boolean'];public function complaints(){return $this->hasMany(EmployeeComplaint::class);}}
