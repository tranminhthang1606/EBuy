<script src="{{asset('assets/js/bootstrap.bundle.min.js')}}"></script>
<!--plugins-->
<script src="{{asset('assets/js/jquery.min.js')}}"></script>
<script src="{{asset('assets/plugins/simplebar/js/simplebar.min.js')}}"></script>
<script src="{{asset('assets/plugins/metismenu/js/metisMenu.min.js')}}"></script>
<script src="{{asset('assets/plugins/perfect-scrollbar/js/perfect-scrollbar.js')}}"></script>
<script src="{{asset('assets/plugins/vectormap/jquery-jvectormap-2.0.2.min.js')}}"></script>
<script src="{{asset('assets/plugins/vectormap/jquery-jvectormap-world-mill-en.js')}}"></script>
<script src="{{asset('assets/plugins/chartjs/js/Chart.min.js')}}"></script>
<script src="{{asset('assets/plugins/chartjs/js/Chart.extension.js')}}"></script>
<script src="{{asset('assets/js/index.js')}}"></script>
<script src="https://developercodez.com/developerCorner/parsley/parsley.min.js"></script>
<!--app JS-->
<script src="{{asset('assets/js/app.js')}}"></script>
<script>
    $(document).ready(function () {
        $("#show_hide_password a").on('click', function (event) {
            event.preventDefault();
            if ($('#show_hide_password input').attr("type") == "text") {
                $('#show_hide_password input').attr('type', 'password');
                $('#show_hide_password i').addClass("bx-hide");
                $('#show_hide_password i').removeClass("bx-show");
            } else if ($('#show_hide_password input').attr("type") == "password") {
                $('#show_hide_password input').attr('type', 'text');
                $('#show_hide_password i').removeClass("bx-hide");
                $('#show_hide_password i').addClass("bx-show");
            }
        });
    });
</script>
<script>
    $(document).ready(function(f){
        $('#formSubmit').on('submit',(function(e){
            if($(this).parsley().validate()) {
            e.preventDefault();
            var formData=new FormData(this);
            $.ajax({
                url: $(this).attr('action'),
                type: "POST",
                data: formData,
                cache:false,
                contentType:false,
                processData:false,
                success: function(response){
                    console.log(response);
                }
            })
        }
        }))
    })
</script>