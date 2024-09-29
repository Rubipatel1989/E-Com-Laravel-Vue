<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Category;

use App\Models\Attribute;
use Illuminate\Http\Request;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use App\Traits\ApiResponse;
use App\Traits\SaveFile;
use Illuminate\Support\Facades\File;

class CategoryController extends Controller
{
    use ApiResponse;
    use SaveFile;
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $data = Category::get();
        return view('admin/Category/category', get_defined_vars());
    }

    public function store(Request $request)
    {
        $validation = Validator::make($request->all(), [
            'name' => 'required|string|max:200',
            'slug' => 'required|string|max:200',
            'id' => 'nullable|integer',
            'image' => 'mimes:jpeg,png,jpg,gif|max:5120'

        ]);
        if ($validation->fails()) {
            return $this->error([''], $validation->errors()->first());
        } else {
            if ($request->id > 0) {
                $image = Category::where('id', $request->id)->first();
                $imageName = $image->image;
                $imageName = $this->saveImage($request->image, $imageName, 'images/categories');
            } else {
                $imageName = $this->saveImage($request->image, '', 'images/categories');
            }

            Category::updateOrCreate(
                ['id' => $request->id],
                [
                    'name' => $request->name,
                    'slug' => $request->slug,
                    'image' => $imageName,
                    'parent_category_id' => $request->parent_category_id
                ]
            );

            return $this->success(['reload' => true], 'Successfully updated.');
        }
    }
}
