<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Size;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use App\Traits\ApiResponse;

use Illuminate\Support\Facades\File;

class SizeController extends Controller
{
    use ApiResponse;
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $data = Size::get();
        return view('admin/Size/size', get_defined_vars());
    }

    public function store(Request $request)
    {
        $validation = Validator::make($request->all(), [
            'text' => 'required|string|max:200',
            'id' => 'nullable|integer',

        ]);
        if ($validation->fails()) {
            return $this->error([''], $validation->errors()->first());
        } else {
            Size::updateOrCreate(
                ['id' => $request->id],
                [
                    'text' => $request->text,
                ]
            );

            return $this->success(['reload' => true], 'Successfully updated.');
        }
    }
}
