@extends("admin.layout")
@section("content")
<div class="page-wrapper">
    <div class="page-content">
        <!--breadcrumb-->
        <div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
            <div class="breadcrumb-title pe-3">Color</div>
            <div class="ps-3">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb mb-0 p-0">
                        <li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i></a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">Update Color</li>
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
        <h6 class="mb-0 text-uppercase">Color Table</h6>

        <hr />
        <div class="col">
            <button type="button" class="btn btn-outline-info px-5 radius-30 " onclick="saveData('0','')"
                data-bs-toggle="modal" data-bs-target="#exampleModal">Add New Color</button>
        </div>
        <div class="card">
            <div class="card-body">
                <div class="table-responsive">
                    <table id="example2" class="table table-striped table-bordered">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Text</th>
                                <th>Color</th>
                                <th>Created At</th>
                                <th>Updated At</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($data as $list)
                            <tr>
                                <td>{{$list->id}}</td>
                                <td>{{$list->text}}</td>
                                <td style="background-color:{{$list->value}}"></td>
                                <td>{{$list->created_at}}</td>
                                <td>{{$list->updated_at}}</td>
                                <td><button type="button" onclick="saveData('{{$list->id}}','{{$list->text}}','{{$list->value}}')"
                                        class="btn btn-outline-info px-5 radius-30 " data-bs-toggle="modal"
                                        data-bs-target="#exampleModal">Update</button>
                                    <button onclick="deleteData('{{$list->id}}','colors')"
                                        class="btn btn-outline-danger px-5 radius-30 ">Delete</button>
                                </td>
                            </tr>
                            @endforeach


                        </tbody>
                        <tfoot>
                            <tr>
                                <th>ID</th>
                                <th>Text</th>
                                <th>Created At</th>
                                <th>Updated At</th>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>

</div>
</div>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <form id="formSubmit" action="{{url('admin/updateColor')}}" method="POST"
                enctype="multipart/form-data">
                @csrf
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Color</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>

                <div class="modal-body">
                    <div class="border p-4 rounded">
                        <div class="card-title d-flex align-items-center">
                            <div><i class="bx bxs-user me-1 font-22 text-info"></i>
                            </div>
                            <h5 class="mb-0 text-info">User Registration</h5>
                        </div>
                        <hr />
                        <div class="row mb-3">
                            <label for="enter_text" class="col-sm-3 col-form-label">Text</label>
                            <div class="col-sm-9">
                                <input type="text" name="text" class="form-control" id="enter_text"
                                    placeholder="Enter Your Name">

                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="enter_value" class="col-sm-3 col-form-label">Hex Code</label>
                            <div class="col-sm-9">
                                <input type="text" name="value" class="form-control" id="enter_value"
                                    placeholder="Enter Your Name">

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
    function saveData(id, text, value) {
        $('#enter_id').val(id);
        $('#enter_text').val(text);
        $('#enter_value').val(value);
               
    }

    function deleteData(id,table){
        let text = "Bạn có chắc muốn xoá?";
        var loadingBtn = '<button class="btn btn-primary" type="button" disabled> <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span><span class="visually-hidden">Loading...</span></button>'
            var submitBtn = '<input type="submit" id="submitButton" class="btn btn-primary px-4" value="Save Changes" />'
            $('#submitButton').html(loadingBtn);
        if(confirm(text) == true){
            text = "Xác nhận xoa";
            $.ajax({
                url: "{{url('admin/deleteData')}}/"+id+"/"+table,
                type: "GET",
                data: '',
                cache:false,
                contentType:false,
                processData:false,
                success: function(response){
                    if(response.status == "Success"){
                       
                        showAlert(response.status,response.message)
                        $('#submitButton').html(submitBtn);
                        if(response.data.reload != undefined){
                            console.log('hehe');
                            
                            window.location.href = window.location.href;
                        }
                    }else{
                        showAlert(response.status,response.message)
                        $('#submitButton').html(submitBtn);
                    }
                },
                error: function(response){
                    showAlert(response.responseJSON.status,response.responseJSON.message);
                    $('#submitButton').html(submitBtn);
                }
                
            })
        }else{
            text = "Huỷ xoá"
        }
       
    }
</script>
@endsection