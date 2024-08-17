<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;
class profileController extends Controller
{
    public function index()
    {
        return view('admin.profile');
    }

    public function store(Request $request)
    {
        $validation = Validator::make($request->all(), [
            'name'    => 'required|string|max:255',
            'email'   => 'required|string|email|unique:users,email,'.Auth()->user()->id,
            'image'   => 'required|mimes:jpeg,png,jpg,gif|max:5120', //max 5 MB
            'address' => 'required|string',
            'fb_link' => 'string',
            'insta_link' => 'string',
            'twitter_link' => 'string'

            // 'user_id' => 'required|exists:users,id'
        ]);

        if ($validation->fails()) {
            return response()->json(['status' => 400, 'message' => $validation->errors()->first()]);
        } else {
            if ($request->hasFile('image')) {
                $imageName = time() . '.' . $request->image->getClientOriginalExtension();
                $request->image->move(public_path('images/profile'), $imageName);
            }
            $user = User::updateOrCreate(
                ['id' => Auth::user()->id],
                [
                    'name' => $request->name,
                    'email' => $request->email,
                    'image' => 'images/profile/' . $imageName,
                    'address' => $request->address,
                    'fb_link' => $request->fb_link,
                    'insta_link' => $request->insta_link,
                    'twitter_link' => $request->twitter_link
                ]
            );
        }
    }
}
