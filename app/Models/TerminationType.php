<?php
namespace App\Models;use Illuminate\Database\Eloquent\Model;
class TerminationType extends Model{protected $guarded=[];protected $casts=['status'=>'boolean'];public function terminations(){return $this->hasMany(EmployeeTermination::class);}}
