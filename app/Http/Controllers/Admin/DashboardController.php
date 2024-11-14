<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Mail\UserOtpMail;
use Illuminate\Http\Request;

use App\Traits\ApiResponse;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;

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

    public function sendMail($email = '')
    {
        $data = [
            'otp' => rand(10000,99999),
            'username' => 'Sonu'

        ];
        Mail::to($email)->send(new UserOtpMail($data));
        return $this->success(['reload' => true], 'Mail Send Successfully.');
    }
}
