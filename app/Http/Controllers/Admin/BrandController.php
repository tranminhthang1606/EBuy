<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Brand;
use Illuminate\Http\Request;
use Validator;
use Illuminate\Support\Facades\File;
use App\Traits\ApiResponse;
use App\Traits\SaveFile;


class brandController extends Controller
{
    use ApiResponse;
    use SaveFile;


    public function index()
    {
        $data = Brand::get();
        return view('admin/Brand/brands', get_defined_vars());
    }

    public function store(Request $request)
    {

        $validation = Validator::make($request->all(), [
            'text'    => 'required|string|max:255',
            'image'   => 'mimes:jpeg,png,webp,jpg,gif|max:5120', //max 5 MB
            'id'    => 'required',
        ]);

        if ($validation->fails()) {
            return $this->error($validation->errors()->first(), 400, []);
            // return response()->json(['status'=>400,'message'=>$validation->errors()->first()]);
        } else {
           
                if ($request->id > 0) {
                    $image = Brand::find($request->id);
                    $imageName = $image->image;
                    if ($request->hasfile('image')) {
                       $imageName = $this->saveImage($request->image, $imageName, 'images/brands');
                    }
                  
                } else {
                    $imageName = $this->saveImage($request->image, '', 'images/brands');
                }
            }
            Brand::updateOrCreate(
                ['id' => $request->id],
                ['text' => $request->text, 'image' => $imageName]
            );
            return $this->success(['reload' => true], 'Successfully updated');
        }
    }
    //

