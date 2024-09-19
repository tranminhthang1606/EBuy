<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Brand;
use App\Models\Category;
use App\Models\HomeBanner;
use App\Models\Product;
use Illuminate\Http\Request;
use App\Traits\ApiResponse;
class HomePageController extends Controller
{
    use ApiResponse;
    public function getHomeData(){
        $data=[];
        $data['banner'] = HomeBanner::get();
        $data['brands'] = Brand::get();
        $data['categories'] = Category::with('products:id,category_id,name,slug,image,item_code')->get();
        $data['products'] = Product::with('productAttributes')->select('id','category_id','image','name','slug','item_code')->get();
        return $this->success(['data'=>$data],'Lấy Data thành công');
    }

    public function getCategoriesData(){
        $data['categories'] = Category::with('subcategories')->where('parent_category_id',null)->get();
        return $this->success(['data'=>$data],'Lấy Danh mục thành công');
    }

    

}
