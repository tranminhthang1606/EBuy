<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Color;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Validator;
use App\Traits\ApiResponse;
class ColorController extends Controller
{
    
    use ApiResponse;
    public function index()
    {
        $data = Color::get();
        return view('admin/Color/color', get_defined_vars());
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
            'value'=> 'required|string|max:255',
            'id' => 'required',
            // 'user_id' => 'required|exists:users,id'
        ]);

        if ($validation->fails()) {
            return $this->error($validation->errors()->first(), 400, []);
        } else {
            
            Color::updateOrCreate(
                ['id' => $request->id],
                [
                    'text' => $request->text,
                    'value' => $request->value,                   
                ]
            );
            return $this->success(['reload'=>true], 'Cập nhập tài khoản thành công!!');
        }
    }
}
