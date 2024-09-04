<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\HomeBanner;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;
use App\Traits\ApiResponse;

class profileController extends Controller
{
    use ApiResponse;
    public function index()
    {
        // $data =  HomeBanner::get();
        return view('admin/profile',get_defined_vars());
    }

    public function store(Request $request)
    {
        $validation = Validator::make($request->all(), [
            'name'    => 'required|string|max:255',
            'email'   => 'required|string|email|unique:users,email,' . Auth()->user()->id,
            'image'   => 'mimes:jpeg,png,jpg,gif|max:5120', //max 5 MB
            'address' => 'required|string',
            'fb_link' => 'string',
            'insta_link' => 'string',
            'twitter_link' => 'string'

            // 'user_id' => 'required|exists:users,id'
        ]);

        if ($validation->fails()) {
            return $this->error($validation->errors()->first(), 400, []);
        } else {
            if ($request->hasFile('image')) {
                $imageName = time() . '.' . $request->image->getClientOriginalExtension();
                $request->image->move(public_path('/storage/profile'), $imageName);
                $user = User::updateOrCreate(
                    ['id' => Auth::user()->id],
                    [
                        'name' => $request->name,
                        'email' => $request->email,
                        'image' => 'profile/' . $imageName,
                        'address' => $request->address,
                        'phone' => $request->phone,
                        'fb_link' => $request->fb_link,
                        'insta_link' => $request->insta_link,
                        'twitter_link' => $request->twitter_link
                    ]
                );
            } else {
                $user = User::updateOrCreate(
                    ['id' => Auth::user()->id],
                    [
                        'name' => $request->name,
                        'email' => $request->email,
                        'address' => $request->address,
                        'phone' => $request->phone,
                        'fb_link' => $request->fb_link,
                        'insta_link' => $request->insta_link,
                        'twitter_link' => $request->twitter_link
                    ]
                );
            }
        }
        return $this->success([$user], 'Cập nhập tài khoản thành công!!');
    }
}
