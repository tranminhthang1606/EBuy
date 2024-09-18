<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;
    protected $fillable = [
        'name',
        'slug',
        'image',
        'item_code',
        'keywords',
        'description',
        'category_id',
        'brand_id',
        'tax_id',
        'id',
    ];

    public function attribute(){
        return $this->hasMany(ProductAttribute::class,'product_id','id')->with('attribute_values');
    }

    public function productAttributes(){
        return $this->hasMany(ProductAttr::class,'product_id','id')->with('images');
    }
}
