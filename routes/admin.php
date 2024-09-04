<?php

use App\Http\Controllers\Admin\homeBannerController;
use App\Http\Controllers\Admin\profileController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/dashboard', function () {
    return view('admin.index');
});

Route::get('/profile', [profileController::class, 'index']);
Route::post('/saveProfile',[profileController::class, 'store']);

Route::get('/home_banner', [homeBannerController::class, 'index']);
Route::post('/updateHomeBanner', [homeBannerController::class, 'store']);
