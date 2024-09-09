<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'slug',
        'image',
        'parent_category_id',
        'id',
    ];

    public function attribute(){
        return $this->belongsToMany(Attribute::class,'category_attribute');
    }
}
