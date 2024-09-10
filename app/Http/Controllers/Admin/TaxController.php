<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Tax;
use Illuminate\Http\Request;
use App\Traits\SaveFile;
use Illuminate\Support\Facades\Validator;
use App\Traits\ApiResponse;
class TaxController extends Controller
{
    use ApiResponse;
    use SaveFile;

    public function index()
    {
        $data =  Tax::get();

        return view('admin/Tax/tax', get_defined_vars());
    }

    public function store(Request $request)
    {
        $validation = Validator::make($request->all(), [
            'text'    => 'required|string|max:255',
        ]);

        if ($validation->fails()) {
            return $this->error($validation->errors()->first(), 400, []);
        }
        Tax::updateOrCreate(
            ['id' => $request->id],
            [
                'text' => $request->text,
            ]
        );
        return $this->success(['reload' => true], 'Cập nhập Tax thành công!!');
    }
}
