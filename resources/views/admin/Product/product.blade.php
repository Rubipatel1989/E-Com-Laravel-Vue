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
                                                <div class="row mb-3" id="category_attributes_div" style="display:none;">
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
                                                <div id="product_attrs_container">
                                                        <div class="product-attr-row">
                                                                <select name="product_attrs[0][color_id]">
                                                                        <option value="">Select Color</option>
                                                                        @foreach ($colors as $color)
                                                                        <option value="{{ $color->id }}">{{ $color->text }}</option>
                                                                        @endforeach
                                                                </select>

                                                                <select name="product_attrs[0][size_id]">
                                                                        <option value="">Select Size</option>
                                                                        @foreach ($sizes as $size)
                                                                        <option value="{{ $size->id }}">{{ $size->text }}</option>
                                                                        @endforeach
                                                                </select>

                                                                <input type="text" name="product_attrs[0][sku]" placeholder="SKU" />
                                                                <input type="number" name="product_attrs[0][mrp]" placeholder="MRP" />
                                                                <input type="number" name="product_attrs[0][price]" placeholder="Price" />
                                                                <input type="number" name="product_attrs[0][qty]" placeholder="Quantity" />
                                                                <input type="text" name="product_attrs[0][length]" placeholder="Length" />
                                                                <input type="text" name="product_attrs[0][breadth]" placeholder="Breadth" />
                                                                <input type="text" name="product_attrs[0][height]" placeholder="Height" />
                                                                <input type="text" name="product_attrs[0][weight]" placeholder="Weight" />

                                                                <button type="button" onclick="removeProductAttr(this)">Remove</button>

                                                                <div id="product_attr_images_container_0">
                                                                        <input type="file" name="product_attrs[0][images][]" />
                                                                        <button type="button" onclick="addMoreProductAttrImages(0)">Add More Images</button>
                                                                </div>
                                                        </div>
                                                </div>
                                                <button type="button" onclick="addMoreProductAttrs()">Add More</button>

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
        let colors = @json($colors);
        let sizes = @json($sizes);
</script>
<script>
        function saveData(id, name, slug, image, item_code, keywords, description, category_id, brand_id, tax_id) {
                // Set form field values
                $('#enter_id').val(id);
                $('#name').val(name);
                $('#slug').val(slug);
                $('#item_code').val(item_code);
                $('#keywords').val(keywords);
                $('#description').val(description);
                $('#category_id').val(category_id);
                $('#brand_id').val(brand_id);
                $('#tax_id').val(tax_id);

                // Handle image preview
                if (image === '') {
                        var key_image = "{{ URL::asset('images/upload.png') }}";
                } else {
                        var key_image = "{{ URL::asset('') }}" + image;
                        $('#photo').removeAttr('required');
                }
                var html = '<img src="' + key_image + '" id="imgPreview" style="height: 200px; width:200px;">';
                $('#image_key').html(html);

                // Load and select category attributes for editing
                loadCategoryAttributes(category_id, id);

                // Fetch product attributes and images for editing
                if (id > 0) {
                        $.ajax({
                                url: `/admin/product/get-product-attributes/${id}`,
                                method: 'GET',
                                success: function(response) {
                                        let productAttrs = response.data.product_attrs;
                                        $('#product_attrs_container').html(''); // Clear the container

                                        // Loop through product attributes and populate them
                                        productAttrs.forEach(function(attr, index) {
                                                let colorOptions = '';
                                                let sizeOptions = '';

                                                // Populate color dropdown
                                                colors.forEach(function(color) {
                                                        colorOptions += `<option value="${color.id}" ${attr.color_id == color.id ? 'selected' : ''}>${color.text}</option>`;
                                                });

                                                // Populate size dropdown
                                                sizes.forEach(function(size) {
                                                        sizeOptions += `<option value="${size.id}" ${attr.size_id == size.id ? 'selected' : ''}>${size.text}</option>`;
                                                });

                                                // Construct product attributes row with images section
                                                let newAttrRow = `
                        <div class="product-attr-row" id="product_attr_row_${index}">
                            <select name="product_attrs[${index}][color_id]" class="form-control">
                                <option value="">Select Color</option>
                                ${colorOptions}
                            </select>

                            <select name="product_attrs[${index}][size_id]" class="form-control">
                                <option value="">Select Size</option>
                                ${sizeOptions}
                            </select>

                            <input type="text" name="product_attrs[${index}][sku]" value="${attr.sku}" placeholder="SKU" class="form-control" />
                            <input type="number" name="product_attrs[${index}][mrp]" value="${attr.mrp}" placeholder="MRP" class="form-control" />
                            <input type="number" name="product_attrs[${index}][price]" value="${attr.price}" placeholder="Price" class="form-control" />
                            <input type="number" name="product_attrs[${index}][qty]" value="${attr.qty}" placeholder="Quantity" class="form-control" />
                            <input type="text" name="product_attrs[${index}][length]" value="${attr.length}" placeholder="Length" class="form-control" />
                            <input type="text" name="product_attrs[${index}][breadth]" value="${attr.breadth}" placeholder="Breadth" class="form-control" />
                            <input type="text" name="product_attrs[${index}][height]" value="${attr.height}" placeholder="Height" class="form-control" />
                            <input type="text" name="product_attrs[${index}][weight]" value="${attr.weight}" placeholder="Weight" class="form-control" />

                            <button type="button" class="btn btn-danger" onclick="removeProductAttr(this)">Remove</button>

                            <!-- Images Section for the current attribute -->
                            <div id="product_attr_images_container_${index}">`;

                                                // Loop through and load images for the current product attribute
                                                attr.images.forEach(function(image, imgIndex) {
                                                        newAttrRow += `
                            <div class="product-attr-image">
                                <input type="file" name="product_attrs[${index}][images][]" class="form-control" />
                                <img src="{{ URL::asset('') }}${image.image}" style="height: 50px; width: 50px;" />
                                <button type="button" class="btn btn-danger" onclick="removeImageInput(this)">Remove</button>
                            </div>`;
                                                });

                                                newAttrRow += `
                                <button type="button" class="btn btn-success" onclick="addMoreProductAttrImages(${index})">Add More Images</button>
                            </div>
                        </div>`;

                                                $('#product_attrs_container').append(newAttrRow); // Add the row to the container
                                        });
                                }
                        });
                }
        }


        function loadCategoryAttributes(categoryId, productId = null) {
                if (categoryId != 0) {
                        $('#category_attributes_div').show(); // Show the attributes div when category is selected

                        $.ajax({
                                url: '/admin/product/category-attributes/' + categoryId,
                                method: 'GET',
                                success: function(data) {
                                        let options = '';
                                        data.data.attributes.forEach(function(attribute) {
                                                options += `<option value="${attribute.id}">${attribute.name}</option>`;
                                        });
                                        $('#category_attributes').html(options); // Populate multiselect dropdown

                                        // If editing a product, load and select the existing attribute values
                                        if (productId) {
                                                $.ajax({
                                                        url: '/admin/product/get-product-attributes/' + productId,
                                                        method: 'GET',
                                                        success: function(response) {
                                                                let selectedAttributes = response.data.attribute_values;
                                                                selectedAttributes.forEach(function(attrValueId) {
                                                                        $('#category_attributes option[value="' + attrValueId + '"]').prop('selected', true);
                                                                });
                                                        }
                                                });
                                        }
                                }
                        });
                } else {
                        $('#category_attributes_div').hide(); // Hide the attributes div if no category is selected
                }
        }

        $(document).ready(function() {
                // When adding a product, hide the attributes div by default
                $('#category_attributes_div').hide();

                // Trigger change on category dropdown to load attributes dynamically
                $('#category_id').on('change', function() {
                        loadCategoryAttributes($(this).val());
                });
        });



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
                // When adding a product, hide the attributes div by default
                $('#category_attributes_div').hide();

                // Trigger change on category dropdown to load attributes dynamically
                $('#category_id').on('change', function() {
                        loadCategoryAttributes($(this).val());
                });
        });
</script>
<script>
        let attrIndex = 1;

        function addMoreProductAttrs() {
                let newAttrRow = `
    <div class="product-attr-row" id="product_attr_row_${attrIndex}">
        <select name="product_attrs[${attrIndex}][color_id]">
            <option value="">Select Color</option>
            @foreach ($colors as $color)
                <option value="{{ $color->id }}">{{ $color->text }}</option>
            @endforeach
        </select>

        <select name="product_attrs[${attrIndex}][size_id]">
            <option value="">Select Size</option>
            @foreach ($sizes as $size)
                <option value="{{ $size->id }}">{{ $size->text }}</option>
            @endforeach
        </select>

        <input type="text" name="product_attrs[${attrIndex}][sku]" placeholder="SKU" />
        <input type="number" name="product_attrs[${attrIndex}][mrp]" placeholder="MRP" />
        <input type="number" name="product_attrs[${attrIndex}][price]" placeholder="Price" />
        <input type="number" name="product_attrs[${attrIndex}][qty]" placeholder="Quantity" />
        <input type="text" name="product_attrs[${attrIndex}][length]" placeholder="Length" />
        <input type="text" name="product_attrs[${attrIndex}][breadth]" placeholder="Breadth" />
        <input type="text" name="product_attrs[${attrIndex}][height]" placeholder="Height" />
        <input type="text" name="product_attrs[${attrIndex}][weight]" placeholder="Weight" />

        <button type="button" onclick="removeProductAttr(this)">Remove</button>
        
        <!-- Images Section for the current attribute -->
        <div id="product_attr_images_container_${attrIndex}">
            <input type="file" name="product_attrs[${attrIndex}][images][]" />
            <button type="button" onclick="addMoreProductAttrImages(${attrIndex})">Add More Images</button>
        </div>
    </div>`;

                document.getElementById('product_attrs_container').insertAdjacentHTML('beforeend', newAttrRow);
                attrIndex++;
        }

        function addMoreProductAttrImages(attrIndex) {
                let newImageInput = `<div class="product-attr-image"><input type="file" name="product_attrs[${attrIndex}][images][]" />
    <button type="button" onclick="removeImageInput(this)">Remove</button></div>`;

                document.getElementById(`product_attr_images_container_${attrIndex}`).insertAdjacentHTML('beforeend', newImageInput);
        }

        function removeImageInput(button) {
                button.closest('.product-attr-image').remove();
        }

        function removeProductAttr(button) {
                button.closest('.product-attr-row').remove();
        }
</script>
@endsection