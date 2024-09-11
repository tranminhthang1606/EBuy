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
                            <div class="card-body">
                                <div class="border p-4 rounded">
                                    <div class="card-title d-flex align-items-center">
                                        <div><i class="bx bxs-user me-1 font-22 text-info"></i>
                                        </div>
                                        <h5 class="mb-0 text-info">User Registration</h5>
                                    </div>
                                    <hr />
                                    <div class="row mb-3">
                                        <label for="inputEnterYourName" class="col-sm-3 col-form-label">Product
                                            Name</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" value="{{$data->name}}"
                                                id="inputEnterYourName" placeholder="Enter Your Name">
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <label for="inputPhoneNo2" class="col-sm-3 col-form-label">Product Slug</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="inputPhoneNo2"
                                                placeholder="Phone No">
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <label for="inputPhoneNo2" class="col-sm-3 col-form-label">Product Image</label>
                                        <div class="col-sm-9">
                                            <input type="file" class="form-control" id="inputPhoneNo2"
                                                placeholder="Phone No">
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <label for="inputEmailAddress2" class="col-sm-3 col-form-label">Item
                                            Code</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="inputEmailAddress2"
                                                placeholder="Email Address">
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <label for="inputEmailAddress2" class="col-sm-3 col-form-label">Keywords</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="inputEmailAddress2"
                                                placeholder="Email Address">
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
                                        <label for="inputEmailAddress2" class="col-sm-3 col-form-label">Brand</label>
                                        <div class="col-sm-9">
                                            <select class="form-control" name="brand" id="">
                                                @foreach ($brand as $brandList)
                                                <option value="{{$brandList->id}}">{{$brandList->text}}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>

                                    <div class="row mb-3">
                                        <label for="inputEmailAddress2" class="col-sm-3 col-form-label">Category</label>
                                        <div class="col-sm-9">
                                            <select class="form-control" name="category" id="category"
                                                onchange="getAttributes()">
                                                @foreach ($cate as $cateList)
                                                <option value="{{$cateList->id}}">{{$cateList->name}}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>

                                    <div class="row mb-3">
                                        <label for="inputEmailAddress2" class="col-sm-3 col-form-label">Tax</label>
                                        <div class="col-sm-9">
                                            <select class="form-control" name="tax" id="">
                                                @foreach ($tax as $taxList)
                                                <option value="{{$taxList->id}}">{{$taxList->text}}%</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>

                                    <div class="row mb-3">
                                        <label for="inputAddress4" class="col-sm-3 col-form-label"></label>
                                        <div class="col-sm-9">
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" id="gridCheck4">
                                                <label class="form-check-label" for="gridCheck4">Check me out</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="col-sm-3 col-form-label"></label>
                                        <div class="col-sm-9">
                                            <button type="submit" class="btn btn-info px-5">Register</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    function getAttributes(){
    
     
        var category_id = $('#category').val();
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
            success: function(result) {
                if (result.status == 200) {
                    
                }else{
                    console.log(result);
                    // alert(result.message);
                }
            }
        });
        
       
 
   
}
</script>
@endsection