<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
class EmployeeDocument extends Model {protected $guarded=[];protected $casts=['expiry_date'=>'date'];public function type(){return $this->belongsTo(DocumentType::class,'document_type_id');}}
