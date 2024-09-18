@extends("admin.layout")
@section("content")
<div class="page-wrapper">
    <div class="page-content">
        <!--breadcrumb-->
        <div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
            <div class="breadcrumb-title pe-3">User Profile</div>
            <div class="ps-3">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb mb-0 p-0">
                        <li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i></a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">User Profilep</li>
                    </ol>
                </nav>
            </div>
            <div class="ms-auto">
                <div class="btn-group">
                    <button type="button" class="btn btn-primary">Settings</button>
                    <button type="button" class="btn btn-primary split-bg-primary dropdown-toggle dropdown-toggle-split"
                        data-bs-toggle="dropdown"> <span class="visually-hidden">Toggle Dropdown</span>
                    </button>
                    <div class="dropdown-menu dropdown-menu-right dropdown-menu-lg-end"> <a class="dropdown-item"
                            href="javascript:;">Action</a>
                        <a class="dropdown-item" href="javascript:;">Another action</a>
                        <a class="dropdown-item" href="javascript:;">Something else here</a>
                        <div class="dropdown-divider"></div> <a class="dropdown-item" href="javascript:;">Separated
                            link</a>
                    </div>
                </div>
            </div>
        </div>
        <h6 class="mb-0 text-uppercase">DataTable Import</h6>

        <hr />
        <div class="col">
            <button type="button" class="btn btn-outline-info px-5 radius-30 " onclick="saveData('0','','','')"
                data-bs-toggle="modal" data-bs-target="#exampleModal">Add New</button>
        </div>
        <div class="card">
            <div class="card-body">
                <div class="row">
                    <div class="col-xl-9 mx-auto">
                        <h6 class="mb-0 text-uppercase">Horizontal Form</h6>
                        <hr />
                        <div class="card border-top border-0 border-4 border-info">
                            <form id="formSubmit" action="{{url('admin/updateProduct')}}" method="POST">
                                @csrf


                                <div class="card-body">
                                    <div class="border p-4 rounded">
                                        <div class="card-title d-flex align-items-center">
                                            <div><i class="bx bxs-user me-1 font-22 text-info"></i>
                                            </div>
                                            <h5 class="mb-0 text-info">Product</h5>
                                        </div>
                                        <hr />
                                        <input type="hidden" name="id" value="{{$id}}">
                                        <div class="row mb-3">
                                            <label for="inputEnterYourName" class="col-sm-3 col-form-label">Product
                                                Name</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" name="name"
                                                    value="{{$data->name}}" id="inputEnterYourName"
                                                    placeholder="Enter Your Name">
                                            </div>
                                        </div>
                                        <div class="row mb-3">
                                            <label for="inputPhoneNo2" class="col-sm-3 col-form-label">Product
                                                Slug</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="inputPhoneNo2" name="slug"
                                                    value="{{$data->slug}}" placeholder="Slug">
                                            </div>
                                        </div>
                                        <div class="row mb-3">
                                            <label for="inputPhoneNo2" class="col-sm-3 col-form-label">Product
                                                Image</label>
                                            <div class="col-sm-9">
                                                <input type="file" class="form-control" name="image" id="inputPhoneNo2"
                                                    placeholder="Phone No">
                                            </div>
                                            @if ($data->image !='')
                                            <img style="width:80px" src="{{asset($data->image)}}" alt="">
                                            @endif
                                        </div>
                                        <div class="row mb-3">
                                            <label for="inputEmailAddress2" class="col-sm-3 col-form-label">Item
                                                Code</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" value="{{$data->item_code}}"
                                                    name="item_code" id="inputEmailAddress2"
                                                    placeholder="Email Address">
                                            </div>
                                        </div>
                                        <div class="row mb-3">
                                            <label for="inputEmailAddress2"
                                                class="col-sm-3 col-form-label">Keywords</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" value="{{$data->keywords}}"
                                                    name="keywords" id="inputEmailAddress2" placeholder="Email Address">
                                            </div>
                                        </div>

                                        <div class="row mb-3">
                                            <label for="inputEmailAddress2"
                                                class="col-sm-3 col-form-label">Category</label>
                                            <div class="col-sm-9">
                                                <select class="form-control" name="category_id" id="category_id"
                                                    onchange="getAttributes()">
                                                    @foreach ($cate as $cateList)
                                                    @if ($data->category_id == $cateList->id)
                                                    <option selected value="{{$cateList->id}}">{{$cateList->name}}
                                                    </option>


                                                    @else
                                                    <option value="{{$cateList->id}}">{{$cateList->name}}</option>
                                                    @endif
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div>

                                        <div class="row mb-3">
                                            <label for="inputEmailAddress2"
                                                class="col-sm-3 col-form-label">Brand</label>
                                            <div class="col-sm-9">
                                                <select class="form-control" name="brand_id" id="brand_id">
                                                    @foreach ($brand as $brandList)
                                                    @if ($data->brand_id == $brandList->id)
                                                    <option selected value="{{$brandList->id}}">{{$brandList->text}}
                                                    </option>


                                                    @else
                                                    <option value="{{$brandList->id}}">{{$brandList->text}}</option>
                                                    @endif
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div>

                                        <div class="row mb-3">
                                            <label for="inputEmailAddress2" class="col-sm-3 col-form-label">Tax</label>
                                            <div class="col-sm-9">
                                                <select class="form-control" name="tax_id" id="tax_id">
                                                    @foreach ($tax as $taxList)
                                                    @if ($data->tax_id == $taxList->id)
                                                    <option selected value="{{$taxList->id}}">{{$taxList->text}}%
                                                    </option>


                                                    @else
                                                    <option value="{{$taxList->id}}">{{$taxList->text}}%</option>
                                                    @endif
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div>

                                        <div class="row mb-3">
                                            <label for="inputEmailAddress2"
                                                class="col-sm-3 col-form-label">Attribute</label>
                                            <div class="col-sm-9">
                                                <span id="multiAttr">
                                                    @if (isset($data['attribute'][0]->id))
                                                    <select class="form-control" multiple name="attribute_id[]"
                                                        id="attribute_id">
                                                        @foreach ($data['attribute'] as $attributeList)

                                                        <option value="{{$attributeList['attribute_values']->id}}">
                                                            {{$attributeList['attribute_values']->value}}</option>

                                                        @endforeach
                                                    </select>
                                                    @endif
                                                </span>
                                            </div>
                                        </div>





                                        <div class="row mb-3">
                                            <label for="inputChoosePassword2"
                                                class="col-sm-3 col-form-label">Description</label>
                                            <div class="col-sm-9">
                                                <textarea name="description" id="" cols="30" rows="10"
                                                    required>{{$data->description}}</textarea>

                                            </div>
                                        </div>


                                        <div class="row mb-3">
                                            <label for="inputChoosePassword2" class="col-sm-3 col-form-label">Product
                                                Attributes</label>

                                            <div class="row col-sm-9">
                                                <div class="row col-sm-3 mb-3">
                                                    <button type="button" id="addAttributeButton"
                                                        class="btn-info btn">Add
                                                        Attribute</button>
                                                </div>

                                                @php
                                                $count = 1;
                                                $imageCount = 111;
                                                @endphp
                                                <div id="addAttr" class="row">
                                                    
                                                    @foreach ($data['productAttributes'] as $productAttr )


                                                    <div id="addAttr_{{$count}}" class="row mb-3">
                                                        <input type="hidden" name="productAttrId[]"
                                                            value="{{$productAttr->id}}">
                                                        <div class="col-sm-3">
                                                            <select class="form-control" name="color_id[]"
                                                                id="color_id">
                                                                @foreach ($color as $colorList)
                                                                @if($productAttr->color_id == $colorList->id)
                                                                <option selected
                                                                    style="background-color:{{$colorList->value}}"
                                                                    value="{{$colorList->id}}">{{$colorList->text}}
                                                                </option>
                                                                @else
                                                                <option style="background-color:{{$colorList->value}}"
                                                                    value="{{$colorList->id}}">{{$colorList->text}}
                                                                </option>
                                                                @endif
                                                                @endforeach
                                                            </select>
                                                        </div>

                                                        <div class="col-sm-3">
                                                            <select class="form-control" name="size_id[]" id="size_id">
                                                                @foreach ($size as $sizeList)
                                                                @if ($productAttr->size_id == $sizeList->id)
                                                                <option selected value="{{$sizeList->id}}">
                                                                    {{$sizeList->text}}
                                                                </option>
                                                                @else
                                                                <option value="{{$sizeList->id}}">{{$sizeList->text}}
                                                                </option>
                                                                @endif

                                                                @endforeach
                                                            </select>
                                                        </div>

                                                        <div class="col-sm-3">
                                                            <input type="text" name="sku[]"
                                                                value="{{$productAttr->sku}}" class="form-control"
                                                                placeholder="Enter SKU">
                                                        </div>
                                                        <div class="col-sm-3">
                                                            <input type="text" name="mrp[]"
                                                                value="{{$productAttr->mrp}}" class="form-control"
                                                                placeholder="Enter MRP">
                                                        </div>
                                                        <div class="col-sm-3">
                                                            <input type="text" name="price[]"
                                                                value="{{$productAttr->price}}" class="form-control"
                                                                placeholder="Enter Price">
                                                        </div>
                                                        <div class="col-sm-3">
                                                            <input type="text" name="length[]"
                                                                value="{{$productAttr->length}}" class="form-control"
                                                                placeholder="Enter Length">
                                                        </div>
                                                        <div class="col-sm-3">
                                                            <input type="text" name="breadth[]"
                                                                value="{{$productAttr->breadth}}" class="form-control"
                                                                placeholder="Enter Breadth">
                                                        </div>
                                                        <div class="col-sm-3">
                                                            <input type="text" name="height[]"
                                                                value="{{$productAttr->height}}" class="form-control"
                                                                placeholder="Enter Height">
                                                        </div>
                                                        <div class="col-sm-3">
                                                            <input type="text" name="weight[]"
                                                                value="{{$productAttr->weight}}" class="form-control"
                                                                placeholder="Enter Weight">
                                                        </div>

                                                        <div class="row mb-3">
                                                            <label for="inputChoosePassword2"
                                                                class="col-sm-3 col-form-label">Product
                                                                Images</label>

                                                            <div class="row col-sm-9">
                                                                <input type="hidden" name="imageValue[]"
                                                                    value="{{$count}}">
                                                                <div class="col-sm-3 mb-3">
                                                                    <button type="button"
                                                                        onclick="addAttrImages1('attrImage_{{$count}}',{{$count}})"
                                                                        id="addAttrImages" class="btn-info btn">Add
                                                                        Image</button>
                                                                </div>
                                                                <div id="attrImage_{{$count}}">
                                                                    @foreach ($productAttr['images'] as $productAttrImages)
                                                                    <div id="attrImage_{{$imageCount}}">
                                                                        <div class="col-sm-3 ">
                                                                            <input type="file"
                                                                                name="attr_image_{{$count}}[]"
                                                                                class="form-control" id="inputPhoneNo2"
                                                                                placeholder="Phone No">
                                                                        </div>
                                                                        @if ($productAttrImages->image !='')
                                                                        <img style="width:80px"
                                                                            src="{{asset($productAttrImages->image)}}"
                                                                            alt="">
                                                                        @endif
                                                                        @if($imageCount !=111)
                                                                        <button type="button"
                                                                            onclick="removeAttr('addAttr_{{$imageCount}}',{{$productAttrImages->id}},'image')"
                                                                            class="btn-danger btn">Remove</button>
                                                                        @endif
                                                                    </div>
                                                                    <?php
                                                                    $imageCount++;      
                                                                    ?>

                                                                    @endforeach
                                                                </div>



                                                            </div>
                                                        </div>
                                                        @if($count !=1)
                                                        <button type="button"
                                                            onclick="removeAttr('addAttr_{{$count}}',{{$productAttr->id}},'product_attrs')"
                                                            id="addAttrImages" class="btn-danger btn">Remove
                                                            Attribute</button>
                                                        @endif
                                                    </div>
                                                    <?php
                                                        $count++;
                                                        $imageCount++;
                                                    ?>


                                                    @endforeach
                                                </div>

                                            </div>


                                        </div>
                                    </div>


                                    <div class="row">
                                        <label class="col-sm-3 col-form-label"></label>
                                        <div class="col-sm-9">
                                            <button type="submit" class="btn btn-info px-5">Submit</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<script>
    var imageCount = 1990;
    function addAttrImages1(id,count){
        imageCount++;
        
        var html=`<div class="mt-2" id="attrImage_${imageCount}"><div class="col-sm-3 "> <input type="file" name="attr_image_${count}[]" class="form-control" id="inputPhoneNo2" placeholder="Phone No"></div><button type="button"onclick="removeImage('attrImage_${imageCount}')"class="btn-danger btn">Remove Attribute</button></div>`;
        
        $('#'+id).append(html);
    }
    
    function removeAttr(id,attrId='',type){
        $('#'+id).remove();
        if(type!=''){
            removeAttrId(attrId,type);
        }
    }

    function removeImage(id){
        $('#'+id).remove();
    }

    function removeAttrId(id,type){
       
        var url = "{{ url('admin/removeAttrId') }}";
         $.ajax({
            url: url,
            headers:{
                'X-CSRF-TOKEN': '{{ csrf_token() }}'
            },
            data: {
                'id':id,
                'type':type
            },
            type: 'post',
            success: function(response){
                    if(response.status == "Success"){  
                                       
                    }else{

                        showAlert(response.status,response.message)
                    }
                },
                error: function(response){
                    console.log('faild');
                    
                    showAlert(response.responseJSON.status,response.responseJSON.message)                }
        });
    }
    
    
    
</script>
<script>
    var count = 111;
    $('#addAttributeButton').click(function(e){

        count++;
        var html ='';
        var sizeData = $('#size_id').html();
        var colorData = $('#color_id').html();
        html+=`<div id="addAttr_${count}" class="row"><input type="hidden" name="productAttrId" value="0"><div class="col-sm-3"><select class="form-control" name="color_id[]" id="color_id">${colorData}</select></div>`;
        html+='<div class="col-sm-3"><select class="form-control" name="size_id[]" id="size_id">'+sizeData+'</select></div>';
        html+='<div class="col-sm-3"><input type="text" name="sku[]" class="form-control" placeholder="Enter SKU"></div>';
        html+='<div class="col-sm-3"><input type="text" name="mrp[]" class="form-control" placeholder="Enter MRP"></div>';
        html+='<div class="col-sm-3"><input type="text" name="price[]" class="form-control" placeholder="Enter Price"></div>'
        html+='<div class="col-sm-3"><input type="text" name="length[]" class="form-control" placeholder="Enter Length"></div>'
        html+='<div class="col-sm-3"><input type="text" name="breadth[]" class="form-control" placeholder="Enter Breadth"></div>'        
        html+='<div class="col-sm-3"><input type="text" name="height[]" class="form-control" placeholder="Enter Height"></div>'
        html+='<div class="col-sm-3"><input type="text" name="weight[]" class="form-control" placeholder="Enter Weight"></div>'
        html+=`<div class="row col-sm-9 mb-3"><input type="hidden" name="imageValue[]" value="${count}"><div class="col-sm-3"><button type="button" onclick="addAttrImages1('attrImage_${count}',${count})" id="addAttrImages" class="btn-info btn mb-2">Add Image</button></div><div class="mb-2" id="attrImage_${count}"><div class="col-sm-3"><input type="file" name="attr_image_${count}[]" class="form-control" id="inputPhoneNo2" placeholder="Phone No"></div></div></div>`
        html+=`<button type="button" onclick="removeAttr('addAttr_${count}')" id="addAttrImages" class="btn-danger btn">Remove Attribute</button></div>`
        $('#addAttr').append(html)                                        
    })
</script>

<script>
    function getAttributes(){  
        var category_id = $('#category_id').val();
        var html='';
            var url = "{{ url('admin/getAttributes') }}";
         $.ajax({
            url: url,
            headers:{
                'X-CSRF-TOKEN': '{{ csrf_token() }}'
            },
            data: {
                'category_id':category_id
            },
            type: 'post',
            success: function(response){
                    if(response.status == "Success"){  
                        console.log(response.data);
                        
                        
                        html+='<select class="form-control" multiple name="attribute_id[]" id="attribute_id">'
                        jQuery.each(response.data.data,function(key,val){
                            console.log(val);
                            jQuery.each(val.values,function(attrKey,attrVal){
                                console.log(val);
                                
                                html+='<option value="'+attrVal.id+'">'+val.attribute.name+'-'+attrVal.value+'</option>'
                            })
                        })
                        html+='</select>'
                        $('#multiAttr').html(html);
                        $('#attribute_id').multiSelect();
                        showAlert(response.status,response.message)                  
                    }else{
                        
                        
                        showAlert(response.status,response.message)
                    }
                },
                error: function(response){
                    console.log('faild');
                    
                    showAlert(response.responseJSON.status,response.responseJSON.message)                }
        });
        
       
 
   
}
</script>
@endsection