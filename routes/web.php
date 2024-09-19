<?php

use App\Http\Controllers\Admin\AuthController;
use App\Http\Controllers\auth\authController as AuthUserController;
use Illuminate\Support\Facades\Route;
use App\Models\Role;
use Illuminate\Support\Facades\Auth;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('index');
});

// Route::get('/createAdmin', [AuthController::class, 'createAdmin']);
// Route::get('/createRole', function () {
//     $role         =  new Role();
//     $role->name   =  'Customer';
//     $role->slug   =  'customer';
//     $role->save();
// });



Route::get('/login', function () {
    return view('auth.signIn');
});
// Route::get('/admin', function () {
//     if (Auth::user()) {
//         return redirect('/admin/dashboard');
//     } else {
//         return redirect('/login');
//     };
// });
Route::post('/login_user', [AuthUserController::class, 'loginUser']);
Route::get('/logout', function () {
    Auth::logout();
    return redirect('/login');
});
