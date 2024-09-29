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
                <h6 class="mb-0 text-uppercase">ADD NAME</h6>
                <hr />
                <div class="col">
                        <button type="button" onclick="saveData('0', '','','')" class="btn btn-outline-info px-5 radius-30" data-bs-toggle="modal" data-bs-target="#exampleModal">Add Category</button>
                </div>
                <div class="card">
                        <div class="card-body">
                                <div class="table-responsive">
                                        <table id="example2" class="table table-striped table-bordered">
                                                <thead>
                                                        <tr>
                                                                <th>ID</th>
                                                                <th>Name</th>
                                                                <th>Slug</th>
                                                                <th>Image</th>
                                                                <th>Created</th>
                                                                <th>Updated</th>
                                                                <th>Action</th>
                                                        </tr>
                                                </thead>
                                                <tbody>
                                                        @foreach ($data as $list)
                                                        <tr>
                                                                <td>{{ $list->id}}</td>
                                                                <td>{{ $list->name }}</td>
                                                                <td>{{ $list->slug }}</td>
                                                                <td>{{ $list->slug }}</td>
                                                                <td>{{ $list->created_at }}</td>
                                                                <td>{{ $list->updated_at }}</td>
                                                                <td>
                                                                        <button type="button" onclick="saveData('{{$list->id}}', '{{$list->name}}', '{{$list->slug}}', '{{$list->image}}')" class="btn btn-outline-info px-5 radius-30" data-bs-toggle="modal" data-bs-target="#exampleModal">Update</button>
                                                                        <button type="button" onclick="deleteData('{{$list->id}}', 'categories')" class="btn btn-outline-danger px-5 radius-30">Delete</button>
                                                                </td>
                                                        </tr>
                                                        @endforeach
                                                </tbody>
                                                <tfoot>
                                                        <tr>
                                                                <th>ID</th>
                                                                <th>Name</th>
                                                                <th>Slug</th>
                                                                <th>Image</th>
                                                                <th>Created</th>
                                                                <th>Updated</th>
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
                                <h5 class="modal-title" id="exampleModalLabel">Manage Category</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <form id="formSubmit" method="post" action="{{ url('admin/updateCategory') }}">
                                @csrf
                                <div class="modal-body">
                                        <div class="border p-4 rounded">
                                                <div class="card-title d-flex align-items-center">
                                                        <!-- <div><i class="bx bxs-user me-1 font-22 text-info"></i>
                                                        </div> -->
                                                        <!-- <h5 class="mb-0 text-info">User Registration</h5> -->
                                                </div>
                                                <hr />
                                                <div class="row mb-3">
                                                        <label for="enter_name" class="col-sm-3 col-form-label">Enter Your Name</label>
                                                        <div class="col-sm-9">
                                                                <input type="text" name="name" class="form-control" id="enter_name" placeholder="Enter Your Name" required>
                                                        </div>
                                                </div>
                                                <div class="row mb-3">
                                                        <label for="enter_slug" class="col-sm-3 col-form-label">Enter Your Slug</label>
                                                        <div class="col-sm-9">
                                                                <input type="text" name="slug" class="form-control" id="enter_slug" placeholder="Enter Your Slug" required>
                                                        </div>
                                                </div>
                                                <div class="row mb-3">
                                                        <label for="enter_image" class="col-sm-3 col-form-label">Image</label>
                                                        <div class="col-sm-9">
                                                                <input type="file" name="image" class="form-control" id="photo" placeholder="Image" required>
                                                        </div>
                                                        <div id="image_key">
                                                                <img src="" id="imgPreview" style="height: 200px; width:200px;">
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
        function saveData(id, name, slug, image) {
                $('#enter_id').val(id);
                $('#enter_name').val(name);
                $('#enter_slug').val(slug);
                if (image == '') {
                        var key_image = "{{ URL::asset('images/upload.png') }}";
                } else {
                        var key_image = "{{ URL::asset('images') }}/" + image + " ";
                        $('#photo').removeAttr('required');
                }
                var html = '<img src="' + key_image + '" id="imgPreview" style="height: 200px; width:200px;">';
                $('#image_key').html(html);

        }
        document.addEventListener("DOMContentLoaded", function() {
                document.getElementById("photo").addEventListener("change", function(event) {
                        const file = event.target.files[0]; // Get the selected file
                        if (file) {
                                const reader = new FileReader(); // FileReader to read file as a data URL
                                reader.onload = function(e) {
                                        // Set the image preview src to the file's data URL
                                        document.getElementById("imgPreview").src = e.target.result;
                                }
                                reader.readAsDataURL(file); // Read the file
                        }
                });
        });
</script>
@endsection