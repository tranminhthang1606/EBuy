<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\auth\authCotroller;
use App\Http\Controllers\Front\HomePageController;

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

Route::post('/auth/register', [authCotroller::class, 'register']);
Route::post('/auth/login', [authCotroller::class, 'loginUser']);
Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();

});

Route::group(['middleware' => ['auth:sanctum']], function () {
    Route::get('/user', function(Request $request) {
        return $request->user();});
        
Route::post('/updateUser', [authCotroller::class, 'updateUser']);

    Route::post('/auth/logout',function(Request $request){
        auth()->user()->tokens()->delete();
        return [
            'message' => 'Tokens Revoked'
        ];
    });
});

// Frontend Data
Route::get('/getHeaderCategoriesData', [HomePageController::class, 'getCategoriesData']);
Route::get('/getHomeData', [HomePageController::class, 'getHomeData']);
Route::post('/getCategoryData', [HomePageController::class, 'getCategoryData']);
Route::get('/getProductData/{item_code?}/{slug?}', [HomePageController::class, 'getProductData']);
Route::post('/getUserData', [HomePageController::class, 'getUserData']);
Route::post('/getCartData', [HomePageController::class, 'getCartData']);
Route::post('/addToCart', [HomePageController::class, 'addToCart']);
Route::post('/removeCartData', [HomePageController::class, 'removeCartData']);
Route::post('/addCoupon', [HomePageController::class, 'addCoupon']);
Route::post('/removeCoupon', [HomePageController::class, 'removeCoupon']);
Route::post('/getUserCoupon', [HomePageController::class, 'getUserCoupon']);
