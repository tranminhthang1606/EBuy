<?php

use App\Http\Controllers\Admin\AttributeController;
use App\Http\Controllers\Admin\CategoryController;
use App\Http\Controllers\Admin\ColorController;
use App\Http\Controllers\Admin\dashboardController;
use App\Http\Controllers\Admin\homeBannerController;
use App\Http\Controllers\Admin\profileController;
use App\Http\Controllers\Admin\SizeController;
use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/dashboard', function () {
    return view('admin.index');
});

Route::get('/profile', [profileController::class, 'index']);
Route::post('/saveProfile',[profileController::class, 'store']);

//HomeBanner
Route::get('/home_banner', [homeBannerController::class, 'index']);
Route::post('/updateHomeBanner', [homeBannerController::class, 'store']);

//Size
Route::get('/manage_size', [SizeController::class, 'index']);
Route::post('/updateSize', [SizeController::class, 'store']);

//Color
Route::get('/manage_color', [ColorController::class, 'index']);
Route::post('/updateColor', [ColorController::class, 'store']);

//Attributes
Route::get('/attribute_name', [AttributeController::class, 'index_attribute_name']);
Route::post('/update_attribute_name', [AttributeController::class, 'store_attribute_name']);

Route::get('/attribute_value', [AttributeController::class, 'index_attribute_value']);
Route::post('/update_attribute_value', [AttributeController::class, 'store_attribute_value']);


Route::get('/category', [CategoryController::class, 'index_category_name']);
Route::post('/updateCategory', [CategoryController::class, 'store_category_name']);

Route::get('/category_attribute', [CategoryController::class, 'index_category_attribute']);
Route::post('/updateCategoryAttribute', [CategoryController::class, 'store_category_attribute']);
Route::get('/deleteData/{id?}/{table?}',[dashboardController::class,'deleteData']);

