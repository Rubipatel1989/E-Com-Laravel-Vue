@extends("admin/layout")
@section("content")
<div class="page-wrapper">
        <div class="page-content">
                <!--breadcrumb-->
                <div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
                        <div class="breadcrumb-title pe-3">ADD Category Attribute</div>
                        <div class="ps-3">
                                <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb mb-0 p-0">
                                                <li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i></a>
                                                </li>
                                                <li class="breadcrumb-item active" aria-current="page">Add Category Attribute</li>
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
                <h6 class="mb-0 text-uppercase">ADD Category Attribute</h6>
                <hr />
                <div class="col">
                        <button type="button" onclick="saveData('0', '','')" class="btn btn-outline-info px-5 radius-30" data-bs-toggle="modal" data-bs-target="#exampleModal">Add Category Attribute</button>
                </div>
                <div class="card">
                        <div class="card-body">
                                <div class="table-responsive">
                                        <table id="example2" class="table table-striped table-bordered">
                                                <thead>
                                                        <tr>
                                                                <th>ID</th>
                                                                <th>Category</th>
                                                                <th>Attribute</th>
                                                                <th>Created</th>
                                                                <th>Updated</th>
                                                                <th>Action</th>
                                                        </tr>
                                                </thead>
                                                <tbody>
                                                        @foreach ($data as $list)
                                                        <tr>
                                                                <td>{{ $list->id}}</td>
                                                                <td>{{ $list['category']->name }}</td>
                                                                <td>{{ $list['attribute']->name }}</td>
                                                                <td>{{ $list->created_at }}</td>
                                                                <td>{{ $list->updated_at }}</td>
                                                                <td>
                                                                        <button type="button" onclick="saveData('{{$list->id}}', '{{$list->category_id}}', '{{$list->attribute_id}}')" class="btn btn-outline-info px-5 radius-30" data-bs-toggle="modal" data-bs-target="#exampleModal">Update</button>
                                                                        <button type="button" onclick="deleteData('{{$list->id}}', 'category_attribute')" class="btn btn-outline-danger px-5 radius-30">Delete</button>
                                                                </td>
                                                        </tr>
                                                        @endforeach
                                                </tbody>
                                                <tfoot>
                                                        <tr>
                                                                <th>ID</th>
                                                                <th>Category</th>
                                                                <th>Attribute</th>
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
                        <form id="formSubmit" method="post" action="{{ url('admin/updateCategoryAttribute') }}">
                                @csrf
                                <div class="modal-body">
                                        <div class="border p-4 rounded">
                                                <div class="card-title d-flex align-items-center">
                                                </div>
                                                <hr />
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
                                                        <label for="attribute_id" class="col-sm-3 col-form-label">Attribute</label>
                                                        <div class="col-sm-9">
                                                                <select class="form-control" name="attribute_id" id="attribute_id">
                                                                        <option value="0">Select Parent</option>
                                                                        @foreach ($attribute as $list2)
                                                                        <option value="{{$list2->id}}">{{ $list2->name }}</option>
                                                                        @endforeach
                                                                </select>
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
        function saveData(id, category_id, attribute_id) {
                $('#enter_id').val(id);
                $('#category_id').val(category_id);
                $('#attribute_id').val(attribute_id);
        }
</script>
@endsection