<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Brand;
use App\Models\Category;
use App\Models\CategoryAttribute;
use App\Models\Color;
use App\Models\Product;
use App\Models\ProductAttr;
use App\Models\ProductAttribute;
use App\Models\ProductAttrImages;
use App\Models\Size;
use App\Models\Tax;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Validator;
use App\Traits\ApiResponse;
use App\Traits\SaveFile;

class ProductController extends Controller
{
    use ApiResponse;
    use SaveFile;

    public function index()
    {
        $data = Product::get();
        return view('admin/Product/product', get_defined_vars());
    }


    public function view_product($id = 0)
    {
        $brand = Brand::get();
        $cate = Category::get();
        $color = Color::get();
        $size = Size::get();
        $tax = Tax::get();
        if ($id == 0) {
            $data = new Product();
            $product_attr = new ProductAttr();
            $product_attr_images = new ProductAttrImages();
        } else {
            $data['id'] = $id;
            $validation = Validator::make($data, [
                'id'    => 'required|exists:products,id',
                // 'user_id' => 'required|exists:users,id'
            ]);

            if ($validation->fails()) {
                return redirect()->back();
            } else {
                $data = Product::where('id', $id)->with('attribute', 'productAttributes')->first();
            }
        }
        return view('admin/Product/manage_product', get_defined_vars());
    }


    public function getAttributes(Request $request)
    {
        $category_id = $request->category_id;
        $data = CategoryAttribute::where('category_id', $category_id)->with('attribute', 'values')->get();

        return $this->success(['data' => $data]);
    }

    public function store(Request $request)
    {
        try {
            DB::beginTransaction();
            $validation = Validator::make($request->all(), [
                'name'    => 'required|string|max:255',
                'slug' => 'required|string|max:255',
                'image'   => 'mimes:jpeg,png,jpg,gif|max:5120',
                
                'id' => 'required',
                // 'user_id' => 'required|exists:users,id'
            ]);

            if ($validation->fails()) {
                return $this->error($validation->errors()->first(), 400, []);
            } else {
                if ($request->hasFile('image')) {
                    if ($request->id > 0) {
                        $image = Product::where('id', $request->id)->first();
                        $image_path = "images/products/" . $image->image . "";
                        if (File::exists($image_path)) {
                            File::delete($image_path);
                        }
                    }
                    $imageName = time() . '.' . $request->image->extension();
                    $request->image->move(public_path('images/products/'), $imageName);
                } else if ($request->id > 0) {
                    $imageName = Product::where('id', $request->post('id'))->pluck('image')->first();
                }


                $productId = Product::updateOrCreate(
                    ['id' => $request->id],
                    [
                        'name' => $request->name,
                        'slug' => $request->slug,
                        'image' => $imageName,
                        'category_id' => $request->category_id,
                        'brand_id' => $request->brand_id,
                        'tax_id' => $request->tax_id,
                        'description' => $request->description,
                        'item_code' => $request->item_code,
                        'keywords' => $request->keywords
                    ]
                );

                $productId = $productId->id;

                ProductAttribute::where('product_id', $productId)->delete();

                foreach ($request->attribute_id as $key => $val) {
                    ProductAttribute::updateOrCreate(
                        ['product_id' => $productId, 'category_id' => $request->category_id, 'attribute_value_id' => $val],
                        [
                            'product_id' => $productId,
                            'category_id' => $request->category_id,
                            'attribute_value_id' => $val
                        ]
                    );
                }




                $productNewAttrId = [];
                foreach ($request->sku as $key => $value) {

                    $productAttrId = ProductAttribute::updateOrCreate(
                        ['id' => $request->productAttrId[$key]],
                        [
                            'product_id' => $productId,
                            'color_id' => $request->color_id[$key],
                            'size_id' => $request->size_id[$key],
                            'sku' => $request->sku[$key],
                            'mrp' => $request->mrp[$key],
                            'price' => $request->price[$key],
                            'height' => $request->height[$key],
                            'weight' => $request->weight[$key],
                            'length' => $request->length[$key],
                            'breadth' => $request->breadth[$key],
                        ]
                    );

                    $productAttrId = $productAttrId->id;

                    // array_push($attrImage, $val);
                    $imageVal = 'attr_image_' . $request->imageValue[$key];

                    if ($request->imageVal) {
                        foreach ($request->$imageVal as $key => $val) {

                            $imageName = time() . '.' . $val->extension();
                            $val->move(public_path('images/productsAttr/'), $imageName);
                            ProductAttrImages::updateOrCreate(
                                ['product_id' => $productId, 'product_attr_id' => $productAttrId, 'image' => $imageName],
                            );
                        }
                    }

                    // array_push($productNewAttrId, $productAttrId);
                    ProductAttrImages::where(['product_id' => $productId, 'product_attr_id' => $productNewAttrId[$key]])->delete();
                }

                $attrImage = [];


                DB::commit(); //process end
                return redirect()->back();
                // echo "No Error occurs";
                // return $this->success(['reload' => true], 'Đã cập nhập Cate thành công!!');
            }
        } catch (\Throwable $th) {
            //throw $th;
            DB::rollBack(); // if error occurs rollback all database queries
            echo $th;
        }

        prx($request->all());
    }

    public function removeAttrId(Request $request){
        $type = $request->type;
        DB::table($request->type)->where('id',$request->id)->delete();
        return $this->success(['status'=>'success'],'Cập nhập thành công');
    }
}
