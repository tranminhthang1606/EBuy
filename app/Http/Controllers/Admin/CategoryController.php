<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Attribute;
use App\Models\Category;
use App\Models\CategoryAttribute;
use App\Traits\SaveFile;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Traits\ApiResponse;


class CategoryController extends Controller
{
    use ApiResponse;
    use SaveFile;
    /**
     * Display a listing of the resource.
     */
    public function index_category_name()
    {
        $data = Category::get();
        return view('admin/Category/category', get_defined_vars());
    }

    public function store_category_name(Request $request)
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

    public function index_category_attribute()
    {
        $data = CategoryAttribute::with('category', 'attribute')->get();
        $category = Category::get();
        $attribute = Attribute::get();
        return view('admin/Category/category_attribute', get_defined_vars());
    }

    public function store_category_attribute(Request $request){
        $validation = Validator::make($request->all(), [
            'attribute_id'    => 'required|exists:attributes,id',
            'category_id' => 'required|exists:categories,id',
            // 'user_id' => 'required|exists:users,id'
        ]);

        if ($validation->fails()) {
            return $this->error($validation->errors()->first(), 400, []);
        } else {

            CategoryAttribute::updateOrCreate(
                ['id' => $request->id],
                [
                    'attribute_id' => $request->attribute_id,
                    'category_id' => $request->category_id,
                ]
            );
            return $this->success(['reload' => true], 'Cập nhập tài khoản thành công!!');
        }
    }
}
