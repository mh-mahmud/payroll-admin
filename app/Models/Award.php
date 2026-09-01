<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Award extends Model
{
    protected $guarded = [];
    protected $casts = ['award_date' => 'date'];
    public function employee(){return $this->belongsTo(Employee::class);}
}
