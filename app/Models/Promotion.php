<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
class Promotion extends Model
{
    protected $table='employee_promotions';
    protected $guarded=[];
    protected $casts = [
        'promotion_date' => 'date',
        'effective_date' => 'date',
    ];
    public function employee(){return $this->belongsTo(Employee::class);}
    public function previousDesignation(){return $this->belongsTo(Designation::class,'previous_designation_id');}
    public function newDesignation(){return $this->belongsTo(Designation::class,'new_designation_id');}
}
