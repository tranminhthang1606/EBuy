<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Size;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Validator;
use App\Traits\ApiResponse;
class SizeController extends Controller
{
    use ApiResponse;
    public function index()
    {
        $data = Size::get();
        return view('admin/Size/size', get_defined_vars());
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {

        $validation = Validator::make($request->all(), [
            'text'    => 'required|string|max:255',
            'id' => 'required',
            // 'user_id' => 'required|exists:users,id'
        ]);

        if ($validation->fails()) {
            return $this->error($validation->errors()->first(), 400, []);
        } else {
            
            Size::updateOrCreate(
                ['id' => $request->id],
                [
                    'text' => $request->text,                 
                ]
            );
            return $this->success(['reload'=>true], 'Cập nhập tài khoản thành công!!');
        }
    }
}
