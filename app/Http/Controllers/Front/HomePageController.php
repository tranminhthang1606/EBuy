<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use App\Models\Brand;
use App\Models\Cart;
use App\Models\Category;
use App\Models\CategoryAttribute;
use App\Models\Color;
use App\Models\Coupon;
use App\Models\HomeBanner;
use App\Models\Product;
use App\Models\ProductAttr;
use App\Models\ProductAttribute;
use App\Models\Size;
use App\Models\TempUsers;
use App\Models\UserCouponCart;
use Illuminate\Http\Request;
use App\Traits\ApiResponse;
use Validator;

class HomePageController extends Controller
{
  use ApiResponse;

  public function getCategoriesData()
  {
    $data['categories'] = Category::with('subcategories')->where('parent_category_id', Null)->get();
    return $this->success(['data' => $data], 'Successfully data fetched');
  }

  public function getHomeData()
  {
    $data = [];
    $data['banner'] = HomeBanner::get();
    $data['categories'] = Category::with('products:id,category_id,name,slug,image,item_code')->get();
    $data['brands'] = Brand::get();
    $data['products'] = Product::with('productAttributes')->select('id', 'category_id', 'image', 'name', 'slug', 'item_code')->get();
    return $this->success(['data' => $data], 'Successfully data fetched');
  }

  public function getCategoryData(Request $request)
  {

    $attribute        = $request->attribute;
    $brand            = $request->brand;
    $color            = $request->color;
    $size             = $request->size;
    $highPrice        = $request->highPrice;
    $lowPrice         = $request->lowPrice;
    $slug             = $request->slug;
    $category = Category::where('slug', $slug)->first();
    if (isset($category->id)) {
      // $products = Product::where('category_id', $category->id)->with('productAttributes')->select('id', 'name', 'slug', 'image', 'item_code')->paginate(10);
      $products = $this->getFilterProducts($category->id, $size, $color, $brand, $attribute, $lowPrice, $highPrice);
      if ($category->parent_category_id == Null || $category->parent_category_id == '') {
        // parent cat
        $categories = Category::where('parent_category_id', $category->id)->get();
      } else {
        // child cat
        $categories = Category::where('parent_category_id', $category->parent_category_id)->where('id', '!=', $category->id)->get();
      }
    } else {
      $category = Category::first();
      // $products = Product::where('category_id', $category->id)->with('productAttributes')->slect('id', 'name', 'slug', 'image', 'item_code')->paginate(10);
      if ($category->parent_category_id == Null || $category->parent_category_id == '') {
        // parent cat
        $categories = Category::where('parent_category_id', $category->id)->get();
      } else {
        // child cat
        $categories = Category::where('parent_category_id', $category->parent_category_id)->where('id', '!=', $category->id)->get();
      }
    }
    $lowPrice = ProductAttr::orderBy('price', 'asc')->pluck('price')->first();
    $highPrice = ProductAttr::orderBy('price', 'desc')->pluck('price')->first();
    $brands = Brand::get();
    $sizes = Size::get();
    $colors = Color::get();
    $attributes = CategoryAttribute::where('category_id', $category->id)->with('attribute')->get();
    return $this->success(['data' => get_defined_vars()], 'Successfully data fetched');
  }

  function getFilterProducts($category_id, $size, $color, $brand, $attribute, $lowPrice, $highPrice)
  {
    $products = Product::where('category_id', $category_id);

    if (sizeof($brand) > 0) {
      $products = $products->whereIn('brand_id', $brand);
    }

    if (sizeof($attribute) > 0) {
      $products = $products->withWhereHas('attribute', function ($q) use ($attribute) {
        $q->whereIn('attribute_value_id', $attribute);
      });
    }

    if (sizeof($size) > 0) {
      $products = $products->withWhereHas('productAttributes', function ($q) use ($size) {
        $q->whereIn('size_id', $size);
      });
    }

    if (sizeof($color) > 0) {
      $products = $products->withWhereHas('productAttributes', function ($q) use ($color) {
        $q->whereIn('color_id', $color);
      });
    }

    if ($lowPrice != '' && $lowPrice != null && $highPrice != '') {
      $products = $products->withWhereHas('productAttributes', function ($q) use ($lowPrice, $highPrice) {
        $q->whereBetween('price', [$lowPrice, $highPrice]);
      });
    }

    $products = $products->with('productAttributes')->select('id', 'name', 'slug', 'image', 'item_code')->paginate(10);
    return $products;
  }

  function getUserData(Request $request)
  {
    // prx($request->all());

    $token = $request->token;
    $checkUser = TempUsers::where('token', $token)->first();

    if (isset($checkUser->id)) {
      // token exist in DB
      $data['user_type'] = $checkUser->user_type;
      $data['token'] = $checkUser->token;

      if (checkTokenExpiryInMinutes($checkUser->updated_at, 60)) {
        // token has expire
        $token = generateRandomString();
        $checkUser->token = $token;
        $checkUser->updated_at = date('Y-m-d h:i:s a', time());
        $checkUser->save();

        $data['token'] = $token;
      } else {
        // token not expire
      }
    } else {
      // token not exist in DB

      $user_id = rand(11111, 99999);
      $token = generateRandomString();
      $time = date('Y-m-d h:i:s a', time());
      TempUsers::create([
        'user_id' => $user_id, 'token' => $token, 'created_at' => $time,
        'updated_at' => $time
      ]);

      $data['user_type'] = 2;
      $data['token'] = $token;
    }
    return $this->success(['data' => $data], 'Successfully data fetched');
  }

  public function getCartData(Request $request)
  {
    $validation = Validator::make($request->all(), [
      'token'    => 'required|exists:temp_users,token',

    ]);
    if ($validation->fails()) {
      return $this->error($validation->errors()->first(), 400, []);
    } else {
      $userToken = TempUsers::where('token', $request->token)->first();
      $data      =  Cart::where('user_id', $userToken->user_id)->with('products')->get();
      return $this->success(['data' => $data], 'Successfully data fetched');
    }
  }


  public function addToCart(Request $request)
  {
    $validation = Validator::make($request->all(), [
      'token'         => 'required|exists:temp_users,token',
      'product_id'    => 'required|exists:products,id',
      'product_attr_id'    => 'required|exists:product_attrs,id',
      'qty'           => 'required|numeric|min:0|not_in:0',

    ]);
    if ($validation->fails()) {
      return $this->error($validation->errors()->first(), 400, []);
    } else {
      $user = TempUsers::where('token', $request->token)->first();
      Cart::updateOrCreate(
        [
          'user_id' => $user->user_id, 'product_id' => $request->product_id,
          'product_attr_id' => $request->product_attr_id
        ],
        [
          'user_id' => $user->user_id, 'product_id' => $request->product_id,
          'product_attr_id' => $request->product_attr_id, 'qty' => $request->qty, 'user_type' => $user->user_type
        ]
      );
      return $this->success(['data' => ''], 'Successfully data fetched');
    }
  }

  public function removeCartData(Request $request)
  {
    $validation = Validator::make($request->all(), [
      'token'         => 'required|exists:temp_users,token',
      'product_id'    => 'required|exists:products,id',
      'product_attr_id'    => 'required|exists:product_attrs,id',
      'qty'           => 'required|numeric|min:0|not_in:0',

    ]);
    if ($validation->fails()) {
      return $this->error($validation->errors()->first(), 400, []);
    } else {
      $user = TempUsers::where('token', $request->token)->first();
      $cart = Cart::where([
        'user_id' => $user->user_id, 'product_id' => $request->product_id,
        'product_attr_id' => $request->product_attr_id
      ])->first();

      if (isset($cart->id)) {
        $qty = $request->qty;
        if ($cart->qty == $qty) {
          $cart->delete();
        } elseif ($cart->qty > $qty) {
          $cart->qty -= $qty;
          $cart->save();
        } else {
          $cart->delete();
        }
      }
      return $this->success(['data' => ''], 'Successfully data fetched');
    }
  }

  public function getProductData($item_code = '', $slug = '')
  {
    $product = Product::where(['item_code' => $item_code, 'slug' => $slug])->first();
    if (isset($product->id)) {
      $data = Product::where(['item_code' => $item_code, 'slug' => $slug])->with('productAttributes')->first();
      $data['otherProducts'] = Product::where('category_id', $data->category_id)->with('productAttributes')->get();
      // $data['otherProducts'] = Product::where('category_id',$data->category_id )->where('id','!=',$data->id)->with('productAttributes')->get();
      // prx($data->toArray());
      return $this->success(['data' => $data], 'Successfully data fetched');
    } else {
      return $this->error('PRoduct Not Found', 400, []);
    }
  }

  public function addCoupon(Request $request)
  {
    $validation = Validator::make($request->all(), [
      'coupon'         => 'required|exists:coupons,name',
    ]);
    if ($validation->fails()) {
      return $this->error($validation->errors()->first(), 400, []);
    } else {
      $coupon = Coupon::where('name', $request->coupon)->first();
      $user = TempUsers::where('token', $request->token)->first();
      $couponName = $coupon->name;
      if ($coupon->minValue <= $request->cartTotal) {
        $couponValue = $coupon->value;
        if ($coupon->type == 1) {
          // coupon id of value type
          $cartotal = $request->cartTotal - $couponValue;
        } else {
          // coupon is of percentage type
          $couponValue = $couponValue / 100;
          $couponValue = $request->cartTotal * $couponValue;
          $cartotal  = $request->cartTotal - $couponValue;
        }

        UserCouponCart::updateOrCreate(
          ['user_id' => $user->user_id],
          ['user_id' => $user->user_id, 'coupon_id' => $coupon->id]
        );
        return $this->success(['data' => $cartotal,'couponName'=>$couponName], 'Successfully data fetched');
      } else {
        return $this->error('Coupon NOt found', 400, []);
      }
    }
  }

  public function removeCoupon(Request $request)
  {
    $validation = Validator::make($request->all(), [
      'token'         => 'required|exists:temp_users,token',

    ]);
    if ($validation->fails()) {
      return $this->error($validation->errors()->first(), 400, []);
    } else {
      $user = TempUsers::where('token', $request->token)->first();
      $couponUser = UserCouponCart::where('user_id', $user->user_id)->delete();
    }
    return $this->success([], 'Successfully data fetched');
  }

  public function getUserCoupon(Request $request)
  { {
      $validation = Validator::make($request->all(), [
        'token'         => 'required|exists:temp_users,token',

      ]);
      if ($validation->fails()) {
        return $this->error($validation->errors()->first(), 400, []);
      } else {
        $couponName = '';
        $user = TempUsers::where('token', $request->token)->first();
        $couponUser = UserCouponCart::where('user_id', $user->user_id)->first();

        if (isset($couponUser->id)) {
          $coupon = Coupon::where('id', $couponUser->coupon_id)->first();
          $couponName = $coupon->name;
          if ($coupon->minValue <= $request->cartTotal) {
            $couponValue = $coupon->value;
            if ($coupon->type == 1) {
              // coupon id of value type
              $cartotal = $request->cartTotal - $couponValue;
            } else {
              // coupon is of percentage type
              $couponValue = $couponValue / 100;
              $couponValue = $request->cartTotal * $couponValue;
              $cartotal  = $request->cartTotal - $couponValue;
            }
          } else {
            $cartotal  = $request->cartTotal;
          }
        } else {
          $cartotal  = $request->cartTotal;
        }
        return $this->success(['data' => $cartotal,'couponName'=>$couponName], 'Successfully data fetched');
      }
    }
  }
}

