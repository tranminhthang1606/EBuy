@extends("admin/layout")
@section("content")
<div class="page-wrapper">
    <div class="page-content">
        <!--breadcrumb-->
        <div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
            <div class="breadcrumb-title pe-3">ADD Category</div>
            <div class="ps-3">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb mb-0 p-0">
                        <li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i></a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">ADD Category</li>
                    </ol>
                </nav>
            </div>
            <div class="ms-auto">
                <div class="btn-group">
                    <button type="button" class="btn btn-primary">Settings</button>
                    <button type="button" class="btn btn-primary split-bg-primary dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown"> <span class="visually-hidden">Toggle Dropdown</span>
                    </button>
                    <div class="dropdown-menu dropdown-menu-right dropdown-menu-lg-end"> <a class="dropdown-item" href="javascript:;">Action</a>
                        <a class="dropdown-item" href="javascript:;">Another action</a>
                        <a class="dropdown-item" href="javascript:;">Something else here</a>
                        <div class="dropdown-divider"></div> <a class="dropdown-item" href="javascript:;">Separated link</a>
                    </div>
                </div>
            </div>
        </div>

        <h6 class="mb-0 text-uppercase">ADD Category</h6>
        <hr />
        <div class="col">
            <button type="button" data-bs-toggle="modal" data-bs-target="#exampleModal" onclick="saveData('0','','','')" class="btn btn-outline-info px-5 radius-30"> ADD Category</button>
        </div>
        <div class="card">
            <div class="card-body">
                <div class="table-responsive">
                    <table id="example2" class="table table-striped table-bordered">
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Name</th>
                                <th>Slug</th>
                                <th>Created_at</th>
                                <th>Updated_at</th>
                                <th>Action</th>

                            </tr>
                        </thead>
                        <tbody>
                            @foreach($data as $list)
                            <tr>
                                <td>{{$list->id}}</td>
                                <td>{{$list->name}}</td>
                                <td>{{$list->slug}}</td>
                                <td>{{$list->created_at}}</td>
                                <td>{{$list->updated_at}}</td>
                                <td><button type="button" onclick="saveData('{{$list->id}}','{{$list->name}}','{{$list->slug}}','{{$list->image}}','{{$list->parent_category_id}}')" class="btn btn-outline-info px-5 radius-30" data-bs-toggle="modal" data-bs-target="#exampleModal">Update</button>
                                    <button onclick="deleteData('{{$list->id}}','attributes')" class="btn btn-outline-danger px-5 radius-30">Delete</button>
                                </td>



                            </tr>
                            @endforeach

                        </tbody>
                        <tfoot>
                            <tr>
                                <th>Id</th>
                                <th>Name</th>
                                <th>Slug</th>
                                <th>Created_at</th>
                                <th>Updated_at</th>
                                <th>Action</th>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>

</div>

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Category</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form id="formSubmit" action="{{url('admin/update_category')}}" method="post" enctype="multipart/form-data">
                @csrf
                <div class="modal-body">

                    <div class="border p-4 rounded">
                        <div class="card-title d-flex align-items-center">
                            <div><i class="bx bxs-user me-1 font-22 text-info"></i>
                            </div>
                            <!-- <h5 class="mb-0 text-info">User Registration</h5> -->
                        </div>
                        <hr>
                        <div class="row mb-3">
                            <label for="enter_text" class="col-sm-3 col-form-label">Name</label>
                            <div class="col-sm-9">
                                <input type="text" name="name" class="form-control" id="enter_name" placeholder="Enter Your Name" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="enter_text" class="col-sm-3 col-form-label">Slug</label>
                            <div class="col-sm-9">
                                <input type="text" name="slug" class="form-control" id="enter_slug" placeholder="Enter Your Name" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="enter_text" class="col-sm-3 col-form-label">Parent Category Id</label>
                            <div class="col-sm-9">
                                <select class="form-control" name="parent_category_id" id="parent_category_id">
                                <option value="0" >Select Parent Id</option> 
                                @foreach($data as $list1)
                                    <option value="{{$list1->id}}">{{$list1->name}}({{$list1->slug}})</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="inputEmailAddress2" class="col-sm-3 col-form-label">Image</label>
                            <div class="col-sm-9">
                                <input type="file" name="image" class="form-control" id="photo" placeholder="Email Address" required>
                            </div>
                            <div id="image_key">
                                <img src="" id="imgPreview" height="200px" width="200px">
                            </div>
                        </div>

                        <input type="hidden" name="id" id="enter_id">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <span id="submitButton">
                        <button type="submit" class="btn btn-primary">Save changes</button>
                    </span>

                </div>
            </form>
        </div>
    </div>
</div>
<script>
    var checkId = 0 ;
    function saveData(id, name, slug, image , parent_category_id) {
       if(checkId !=0){
        // showing previous value
        $('#parent_category_id option[value="'+checkId+'"] ').show(); 
       }
        checkId = id;
        $('#enter_id').val(id);
        $('#enter_name').val(name);
        $('#enter_slug').val(slug);
        $('#parent_category_id').val(parent_category_id);
        $('#parent_category_id option[value="'+id+'"] ').hide();
    
        if (image == '') {
            var key_image = "{{URL::asset('images/upload.png')}}";
            $('#photo').prop('required', true);
        } else {
            var key_image = image;
            $('#photo').prop('required', false);
        }
        var html = '	<img src="' + key_image + '"   id="imgPreview" height="200px" width="200px">';
        $('#image_key').html(html);


  
     
    }
</script>
@endsection