<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Brand;
use App\Models\Category;
use App\Models\CategoryAttribute;
use App\Models\Color;
use App\Models\HomeBanner;
use App\Models\Product;
use App\Models\ProductAttr;
use App\Models\Size;
use Illuminate\Http\Request;
use App\Traits\ApiResponse;

class HomePageController extends Controller
{
    use ApiResponse;
    public function getHomeData()
    {
        $data = [];
        $data['banner'] = HomeBanner::get();
        $data['brands'] = Brand::get();
        $data['categories'] = Category::with('products:id,category_id,name,slug,image,item_code')->get();
        $data['products'] = Product::with('productAttributes')->select('id', 'category_id', 'image', 'name', 'slug', 'item_code')->get();
        return $this->success(['data' => $data], 'Lấy Data thành công');
    }

    public function getCategoriesData()
    {
        $data['categories'] = Category::with('subcategories')->where('parent_category_id', null)->get();
        return $this->success(['data' => $data], 'Lấy Danh mục thành công');
    }

    public function getCategoryData($slug)
    {
        $category = Category::where('slug', $slug)->first();
        if (isset($category->id)) {
            $products = Product::where('category_id',$category->id)->with('productAttributes')->select('id','name','slug','image','item_code')->paginate(10);
            if ($category->parent_category_id == null || $category->parent_category_id == '') {
                $categories = Category::where('parent_category_id', $category->id)->get();
            } else {
                $categories = Category::where('parent_category_id', $category->parent_category_id)->where('id', '!=', $category->id)->get();
            }
           
        } else {
            $category = Category::first();
            $products = Product::where('category_id',$category->id)->with('productAttributes')->select('id','name','slug','image','item_code')->paginate(10);
            if ($category->parent_category_id == null || $category->parent_category_id == '') {
                $categories = Category::where('parent_category_id', $category->id)->get();
            } else {
                $categories = Category::where('parent_category_id', $category->parent_category_id)->where('id', '!=', $category->id)->get();
            }
        }
        $lowPrice = ProductAttr::orderBy('price', 'asc')->select('price')->first();
        $highPrice = ProductAttr::orderBy('price', 'desc')->select('price')->first();
        $brands = Brand::get();
        $sizes = Size::get();
        $colors = Color::get();
        $attributes = CategoryAttribute::where('category_id',$category->id)->with('attribute')->get();
        return $this->success(['data' => get_defined_vars()], 'Lấy Danh mục thành công');
    }
}
