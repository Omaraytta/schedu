<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AcademicDegree extends Model
{
    use HasFactory;
    public $timestamps = false ;

    protected $guarded=['id'];

    protected $fillable = [
        'name',
        'name_ar',
        'prefix',
        'prefix_ar',
    ];
   
}
