<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Size;
use App\Models\Tax;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use App\Traits\ApiResponse;

use Illuminate\Support\Facades\File;

class TaxController extends Controller
{
    use ApiResponse;
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $data = Tax::get();
        return view('admin/Tax/tax', get_defined_vars());
    }

    public function store(Request $request)
    {
        $validation = Validator::make($request->all(), [
            'text' => 'required|integer|min:0|max:50',
            'id' => 'nullable|integer',

        ]);
        if ($validation->fails()) {
            return $this->error([''], $validation->errors()->first());
        } else {
            Tax::updateOrCreate(
                ['id' => $request->id],
                [
                    'text' => $request->text,
                ]
            );

            return $this->success(['reload' => true], 'Successfully updated.');
        }
    }
}
