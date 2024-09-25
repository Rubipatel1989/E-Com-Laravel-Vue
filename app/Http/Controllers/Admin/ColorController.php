<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Color;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use App\Traits\ApiResponse;

use Illuminate\Support\Facades\File;

class ColorController extends Controller
{
    use ApiResponse;

    public function index()
    {
        $data = Color::get();
        return view('admin/Color/color', get_defined_vars());
    }

    public function store(Request $request)
    {
        $validation = Validator::make($request->all(), [
            'value' => 'required|string|max:200',
            'text' => 'required|string|max:200',
            'id' => 'nullable|integer',

        ]);
        if ($validation->fails()) {
            return $this->error([''], $validation->errors()->first());
        } else {
            Color::updateOrCreate(
                ['id' => $request->id],
                [
                    'value' => $request->value,
                    'text' => $request->text,
                ]
            );

            return $this->success(['reload' => true], 'Successfully updated.');
        }
    }
}
