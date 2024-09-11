<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Brand;
use App\Models\Category;
use App\Models\CategoryAttribute;
use App\Models\Color;
use App\Models\Product;
use App\Models\ProductAttr;
use App\Models\ProductAttrImages;
use App\Models\Size;
use App\Models\Tax;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Traits\ApiResponse;
use App\Traits\SaveFile;

class ProductController extends Controller
{
    use ApiResponse;
    use SaveFile;

    public function index()
    {
        $data = Product::get();
        return view('admin/Product/product', get_defined_vars());
    }


    public function view_product($id = 0)
    {
        if ($id == 0) {
            $data = new Product();
            $product_attr = new ProductAttr();
            $product_attr_images = new ProductAttrImages();
            $brand = Brand::get();
            $cate = Category::get();
            $color = Color::get();
            $size = Size::get();
            $tax = Tax::get();
        } else {
            $data['id'] = $id;
            $validation = Validator::make($data, [
                'id'    => 'required|exists:products,id',
                // 'user_id' => 'required|exists:users,id'
            ]);

            if ($validation->fails()) {
                return redirect()->back();
            } else {
                $data = Product::where('id', $id)->first();
            }
        }
        return view('admin/Product/manage_product', get_defined_vars());
    }


    public function getAttributes(Request $request)
    {
        $category_id = $request->category_id;
        $data = CategoryAttribute::where('category_id',$category_id)->with('attribute')->get();
        prx($data->toArray());
    }

    public function store(Request $request)
    {

        $validation = Validator::make($request->all(), [
            'name'    => 'required|string|max:255',
            'slug' => 'required|string|max:255',
            'image'   => 'mimes:jpeg,png,jpg,gif|max:5120',
            'id' => 'required',
            // 'user_id' => 'required|exists:users,id'
        ]);

        if ($validation->fails()) {
            return $this->error($validation->errors()->first(), 400, []);
        } else {

            if ($request->id > 0) {
                $image = Category::find($request->id);
                $imageName = $image->image;
                $imageName = $this->saveImage($request->image, $imageName, 'images/categories');
            } else {
                $imageName = $this->saveImage($request->image, '', 'images/categories');
            }


            if ($request->parent_category_id != 0) {
                Category::updateOrCreate(
                    ['id' => $request->id],
                    [
                        'name' => $request->name,
                        'slug' => $request->slug,
                        'image' => $imageName,
                        'parent_category_id' => $request->parent_category_id
                    ]
                );
            } else {
                Category::updateOrCreate(
                    ['id' => $request->id],
                    [
                        'name' => $request->name,
                        'slug' => $request->slug,
                        'image' => $imageName,
                    ]
                );
            }

            return $this->success(['reload' => true], 'Đã cập nhập Cate thành công!!');
        }
    }
}
