<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Support\Facades\URL;
class ProductAttrImages extends Model
{
    use HasFactory;
    protected $fillable = [
        'product_id',
        'product_attr_id',
        'image',
        'id',
    ];

    protected function Image(): Attribute
    {
        return Attribute::make(
            get: fn ($value) => URL::to('images/'.$value.'')
        );
    }
}
