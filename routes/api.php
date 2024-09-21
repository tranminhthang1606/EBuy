<?php

use App\Http\Controllers\Admin\homeBannerController;
use App\Http\Controllers\Frontend\HomePageController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('/getHomeData',[HomePageController::class,'getHomeData']);
Route::get('/getHeaderCategoriesData',[HomePageController::class,'getCategoriesData']);
Route::get('/getCategoryData/{slug?}',[HomePageController::class,'getCategoryData']);
