@extends("admin/layout")
        @section("content")
        <div class="page-wrapper">
                <div class="page-content">
                        <!--breadcrumb-->
                        <div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
                                <div class="breadcrumb-title pe-3">ADD NAME</div>
                                <div class="ps-3">
                                        <nav aria-label="breadcrumb">
                                                <ol class="breadcrumb mb-0 p-0">
                                                        <li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i></a>
                                                        </li>
                                                        <li class="breadcrumb-item active" aria-current="page">ADD NAME</li>
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
                                <button type="button" class="btn btn-outline-info px-5 radius-30">Add ADD NAME</button>
                        </div>
                        <div class="card">
                                <div class="card-body">
                                        <div class="table-responsive">
                                                <table id="example2" class="table table-striped table-bordered">
                                                        <thead>
                                                                <tr>
                                                                        <th>ID</th>
                                                                        <th>Text</th>
                                                                        <th>Link</th>
                                                                        <th>Image</th>
                                                                        <th>Created</th>
                                                                        <th>Updated</th>
                                                                </tr>
                                                        </thead>
                                                        <tbody>
                                                                @foreach ($data as $list)
                                                                <tr>
                                                                        <td>1</td>
                                                                        <td>This is test</td>
                                                                        <td>www.fb.com</td>
                                                                        <td>pnb.png</td>
                                                                        <td>May 04, 2021</td>
                                                                        <td>May 21, 2025</td>
                                                                </tr>
                                                                @endforeach
                                                        </tbody>
                                                        <tfoot>
                                                                <tr>
                                                                        <th>Name</th>
                                                                        <th>Position</th>
                                                                        <th>Office</th>
                                                                        <th>Age</th>
                                                                        <th>Start date</th>
                                                                        <th>Salary</th>
                                                                </tr>
                                                        </tfoot>
                                                </table>
                                        </div>
                                </div>
                        </div>
                </div>
        </div>
        @endsection