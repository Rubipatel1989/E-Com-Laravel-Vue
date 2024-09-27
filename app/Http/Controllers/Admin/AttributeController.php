<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Attribute;
use App\Models\AttributeValue;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use App\Traits\ApiResponse;

class AttributeController extends Controller
{
    use ApiResponse;
    /**
     * Display a listing of the resource.
     */
    public function index_attribute_name()
    {
        $data = Attribute::get();
        return view('admin/Attribute/attribute', get_defined_vars());
    }

    public function store_attribute_name(Request $request)
    {
        $validation = Validator::make($request->all(), [
            'name' => 'required|string|max:200',
            'slug' => 'required|string|max:200',
            'id' => 'nullable|integer',

        ]);
        if ($validation->fails()) {
            return $this->error([''], $validation->errors()->first());
        } else {
            Attribute::updateOrCreate(
                ['id' => $request->id],
                [
                    'name' => $request->name,
                    'slug' => $request->slug
                ]
            );

            return $this->success(['reload' => true], 'Successfully updated.');
        }
    }

    public function index_attribute_value()
    {
        $data = AttributeValue::get();
        $attribute = Attribute::get();
        return view('admin/Attribute/attribute_value', get_defined_vars());
    }

    
    public function store_attribute_value(Request $request)
    {
        $validation = Validator::make($request->all(), [
            'attributes_id' => 'required|integer|max:200',
            'value' => 'required|string|max:200',
            'id' => 'nullable|integer',

        ]);
        if ($validation->fails()) {
            return $this->error([''], $validation->errors()->first());
        } else {
            AttributeValue::updateOrCreate(
                ['id' => $request->id],
                [
                    'text' => $request->text,
                ]
            );

            return $this->success(['reload' => true], 'Successfully updated.');
        }
    }
}