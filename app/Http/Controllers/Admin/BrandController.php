<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Brand;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Traits\ApiResponse;
use App\Traits\SaveFile;

class BrandController extends Controller
{
    use ApiResponse;
    use SaveFile;
    public function index()
    {
        $data = Brand::get();
        return view('admin/Brand/brand', get_defined_vars());
    }

    public function store(Request $request)
    {
        $validation = Validator::make($request->all(), [
            'text' => 'required|string|max:200',
            'id' => 'nullable|integer',
            'image' => 'mimes:jpeg,png,jpg,gif|max:5120'

        ]);
        if ($validation->fails()) {
            return $this->error([''], $validation->errors()->first());
        } else {
            if ($request->id > 0) {
                $image = Brand::where('id', $request->id)->first();
                $imageName = $image->image;
                if ($request->hasFile('image')) {
                    $imageName = $this->saveImage($request->image, $imageName, 'images/brands');
                }
            } else {
                if ($request->hasFile('image')) {
                    $imageName = $this->saveImage($request->image, '', 'images/brands');
                }
            }
            if ($request->parent_category_id > 0) {
                Brand::updateOrCreate(
                    ['id' => $request->id],
                    [
                        'text' => $request->text,
                        'image' => $imageName
                    ]
                );
            } else {
                Brand::updateOrCreate(
                    ['id' => $request->id],
                    [
                        'text' => $request->text,
                        'image' => $imageName,
                    ]
                );
            }

            return $this->success(['reload' => true], 'Successfully updated.');
        }
    }
}
