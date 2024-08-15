<?php

namespace App\Http\Controllers\auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;

class authController extends Controller
{
    public function loginUser(Request $request)
    {
        $validation = Validator::make($request->all(), [
            'email' => 'required|string|email|exists:users,email',
            'password' => 'required|string|min:6'
        ]);
        if ($validation->fails()) {
            return response()->json(['status' => 'error', 'message' => $validation->errors()->first()]);
        } else {

            $cred = ['email' => $request->email, 'password' => $request->password];
            if (Auth::attempt($cred, false)) {
                if (Auth::User()->hasRole('admin')) {
                    return response()->json(['status' => 200, 'message' => 'Login Successful','url'=>'admin/dashboard', 'data' => Auth::User()], 200);
                }else{
                    return response()->json(['status' => 401, 'message' => 'Unauthorized Access'], 401);
                }
            }else{
                return response()->json(['status' => 401, 'message' => 'Invalid Credentials'], 401);
            }
        }
    }
}
