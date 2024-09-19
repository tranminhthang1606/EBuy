<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Support\Facades\URL;
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

    public function products(){
        return $this->hasMany(Product::class,'category_id','id')->with('productAttributes');
    }

    public function subCategories(){

        return $this->hasMany(Category::class,'parent_category_id','id');
    }

    

    protected function Image(): Attribute
    {
        return Attribute::make(
            get: fn ($value) => URL::to('images/categories/'.$value.'')
        );
    }

    
}
