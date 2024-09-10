<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Brand;
use Illuminate\Http\Request;
use App\Traits\SaveFile;
use Illuminate\Support\Facades\Validator;
use App\Traits\ApiResponse;

class BrandController extends Controller
{
    use ApiResponse;
    use SaveFile;

    public function index()
    {
        $data =  Brand::get();

        return view('admin/Brand/brand', get_defined_vars());
    }

    public function store(Request $request)
    {
        $validation = Validator::make($request->all(), [
            'text'    => 'required|string|max:255',
            'image'   => 'mimes:jpeg,png,jpg,gif|max:5120', //max 5 MB

            // 'user_id' => 'required|exists:users,id'
        ]);

        if ($validation->fails()) {
            return $this->error($validation->errors()->first(), 400, []);
        } else {
            if ($request->id > 0) {
                $image = Brand::find($request->id);
                $imageName = $image->image;
                if ($request->hasFile('image')) {
                    $imageName = $this->saveImage($request->image, $imageName, 'images/brands', 'brands');
                }
            } else {
                $imageName = $this->saveImage($request->image, '', 'images/brands', 'brands');
            }
        }
        Brand::updateOrCreate(
            ['id' => $request->id],
            [
                'text' => $request->text,
                'image' => $imageName
            ]
        );
        return $this->success(['reload' => true], 'Cập nhập Brand thành công!!');
    }
}
