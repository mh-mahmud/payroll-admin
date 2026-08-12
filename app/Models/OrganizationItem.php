<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
class OrganizationItem extends Model {protected $guarded=[];public function table(string $table):static{$this->setTable($table);return $this;}}
