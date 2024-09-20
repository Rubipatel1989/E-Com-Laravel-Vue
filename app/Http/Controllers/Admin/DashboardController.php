<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Traits\ApiResponse;
use Illuminate\Support\Facades\DB;



class DashboardController extends Controller
{
    use ApiResponse;
    public function index()
    {
        return view('admin/index');
    }
    #### Global delete function
    public function deleteData($id = '', $table = '')
    {
        DB::table($table)->where('id', $id)->delete();
        return $this->success(['reload' => true], 'Successfully deleted.');
    }
}
