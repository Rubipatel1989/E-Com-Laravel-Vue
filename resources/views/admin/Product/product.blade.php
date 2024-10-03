@extends("admin/layout")
@section("content")
<div class="page-wrapper">
        <div class="page-content">
                <!--breadcrumb-->
                <div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
                        <div class="breadcrumb-title pe-3">ADD Product</div>
                        <div class="ps-3">
                                <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb mb-0 p-0">
                                                <li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i></a>
                                                </li>
                                                <li class="breadcrumb-item active" aria-current="page">ADD Product</li>
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
                <h6 class="mb-0 text-uppercase">ADD Product</h6>
                <hr />
                <div class="col">
                        <button type="button" onclick="saveData('0', '','','','','0','0','0')" class="btn btn-outline-info px-5 radius-30" data-bs-toggle="modal" data-bs-target="#exampleModal">Add Product</button>
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
                                                                <th>Item Code</th>
                                                                <th>Keywords</th>
                                                                <th>Category</th>
                                                                <th>Brand</th>
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
                                                                <td>{{ $list->item_code }}</td>
                                                                <td>{{ $list->keywords }}</td>
                                                                <td>{{ $list['category']->name }}</td>
                                                                <td>{{ $list['brand']->text }}</td>
                                                                <td>{{ $list->updated_at }}</td>
                                                                <td>
                                                                        <button type="button" onclick="saveData('{{$list->id}}', '{{$list->name}}', '{{$list->slug}}', '{{ $list->image }}', '{{ $list->item_code }}', '{{$list->keywords}}', '{{$list->description}}', '{{$list->category_id}}', '{{$list->brand_id}}', '{{$list->tax_id}}')" class="btn btn-outline-info btn-sm px-3 radius-30" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                                                                <i class="fas fa-edit"></i> <!-- Update icon -->
                                                                        </button>
                                                                        <button type="button" onclick="deleteData('{{$list->id}}', 'products')" class="btn btn-outline-danger btn-sm px-3 radius-30">
                                                                                <i class="fas fa-trash"></i> <!-- Delete icon -->
                                                                        </button>
                                                                </td>


                                                        </tr>
                                                        @endforeach
                                                </tbody>
                                                <tfoot>
                                                        <tr>
                                                                <th>ID</th>
                                                                <th>Name</th>
                                                                <th>Slug</th>
                                                                <th>Item Code</th>
                                                                <th>Keywords</th>
                                                                <th>Category</th>
                                                                <th>Brand</th>
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
                        <form id="formSubmit" method="post" action="{{ url('admin/updateProduct') }}">
                                @csrf
                                <div class="modal-body">
                                        <div class="border p-4 rounded">
                                                <div class="card-title d-flex align-items-center">
                                                </div>
                                                <hr />
                                                <div class="row mb-3">
                                                        <label for="name" class="col-sm-3 col-form-label">Enter Name</label>
                                                        <div class="col-sm-9">
                                                                <input type="text" name="name" class="form-control" id="name" placeholder="Enter Name" required>
                                                        </div>
                                                </div>
                                                <div class="row mb-3">
                                                        <label for="slug" class="col-sm-3 col-form-label">Enter Slug</label>
                                                        <div class="col-sm-9">
                                                                <input type="text" name="slug" class="form-control" id="slug" placeholder="Enter  Slug" required>
                                                        </div>
                                                </div>
                                                <div class="row mb-3">
                                                        <label for="item_code" class="col-sm-3 col-form-label">Enter Item Code</label>
                                                        <div class="col-sm-9">
                                                                <input type="text" name="item_code" class="form-control" id="item_code" placeholder="Enter Code" required>
                                                        </div>
                                                </div>
                                                <div class="row mb-3">
                                                        <label for="keywords" class="col-sm-3 col-form-label">Enter Keywords</label>
                                                        <div class="col-sm-9">
                                                                <input type="text" name="keywords" class="form-control" id="keywords" placeholder="Enter Keywords" required>
                                                        </div>
                                                </div>
                                                <div class="row mb-3">
                                                        <label for="description" class="col-sm-3 col-form-label">Enter Description</label>
                                                        <div class="col-sm-9">
                                                                <input type="text" name="description" class="form-control" id="description" placeholder="Enter Description" required>
                                                        </div>
                                                </div>
                                                <div class="row mb-3">
                                                        <label for="category_id" class="col-sm-3 col-form-label">Category</label>
                                                        <div class="col-sm-9">
                                                                <select class="form-control" name="category_id" id="category_id">
                                                                        <option value="0">Select Category</option>
                                                                        @foreach ($category as $list1)
                                                                        <option value="{{$list1->id}}">{{ $list1->name }}</option>
                                                                        @endforeach
                                                                </select>
                                                        </div>
                                                </div>
                                                <div class="row mb-3">
                                                        <label for="category_attributes" class="col-sm-3 col-form-label">Category Attributes</label>
                                                        <div class="col-sm-9">
                                                                <select class="form-control" name="attribute_values[]" id="category_attributes" multiple>
                                                                </select>
                                                        </div>
                                                </div>

                                                <div class="row mb-3">
                                                        <label for="brand_id" class="col-sm-3 col-form-label">Brand</label>
                                                        <div class="col-sm-9">
                                                                <select class="form-control" name="brand_id" id="brand_id">
                                                                        <option value="0">Select Brand</option>
                                                                        @foreach ($brand as $list2)
                                                                        <option value="{{$list2->id}}">{{ $list2->text }}</option>
                                                                        @endforeach
                                                                </select>
                                                        </div>
                                                </div>
                                                <div class="row mb-3">
                                                        <label for="tax_id" class="col-sm-3 col-form-label">Tax</label>
                                                        <div class="col-sm-9">
                                                                <select class="form-control" name="tax_id" id="tax_id">
                                                                        <option value="0">Select Tax</option>
                                                                        @foreach ($tax as $list3)
                                                                        <option value="{{$list3->id}}">{{ $list3->text }}</option>
                                                                        @endforeach
                                                                </select>
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
        function saveData(id, name, slug, image, item_code, keywords, description, category_id, brand_id, tax_id) {
                $('#enter_id').val(id);
                $('#name').val(name);
                $('#slug').val(slug);
                $('#item_code').val(item_code);
                $('#keywords').val(keywords);
                $('#description').val(description);
                $('#category_id').val(category_id);
                $('#brand_id').val(brand_id);
                $('#tax_id').val(tax_id);

                if (image == '') {
                        var key_image = "{{ URL::asset('images/upload.png') }}";
                } else {
                        var key_image = "{{ URL::asset('') }}" + image + " ";
                        $('#photo').removeAttr('required');
                }

                var html = '<img src="' + key_image + '" id="imgPreview" style="height: 200px; width:200px;">';
                $('#image_key').html(html);

                // Trigger change event to load category attributes
                loadCategoryAttributes(category_id);
        }

        function loadCategoryAttributes(categoryId) {
                if (categoryId != 0) {
                        $.ajax({
                                url: '/admin/product/category-attributes/' + categoryId, // Define a route for fetching category attributes
                                method: 'GET',
                                success: function(data) {
                                        console.log('Pawan Kumar', data.data.attributes);
                                        let options = '';
                                        data.data.attributes.forEach(function(attribute) {
                                                options += `<option value="${attribute.id}">${attribute.name}</option>`;
                                        });
                                        $('#category_attributes').html(options); // Populate multiselect dropdown
                                }
                        });
                }
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

        $(document).ready(function() {
                $('#category_id').on('change', function() {
                        loadCategoryAttributes($(this).val());
                });
        });
</script>
@endsection