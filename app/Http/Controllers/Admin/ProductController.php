<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Category;

use App\Models\Attribute;
use App\Models\Brand;
use App\Models\CategoryAttribute;
use App\Models\Product;
use App\Models\ProductAttribute;
use App\Models\Tax;
use Illuminate\Http\Request;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use App\Traits\ApiResponse;
use App\Traits\SaveFile;
use Illuminate\Support\Facades\File;

class ProductController extends Controller
{
    use ApiResponse;
    use SaveFile;

    public function getCategoryAttributes($categoryId)
    {
        $category = Category::with('attributes')->find($categoryId);
        if (!$category) {
            return $this->error(['reload' => true], 'Data Not Found.');
        }
        return $this->success(['reload' => false, 'attributes' => $category->attributes], 'Successfully Fetched.');
    }

    public function getProductAttributes($productId)
    {
        $attributeValues = ProductAttribute::where('product_id', $productId)->pluck('attribute_value_id');
        return $this->success(['reload' => false, 'attribute_values' => $attributeValues], 'Product Attributes Successfully Fetched.');
    }
    public function index()
    {
        $data = Product::with('category', 'brand', 'tax')->get();
        $category = Category::get();
        $brand = Brand::get();
        $tax = Tax::get();
        return view('admin/Product/product', get_defined_vars());
    }

    public function store(Request $request)
    {
        $validation = Validator::make($request->all(), [
            'name' => 'required|string|max:200',
            'slug' => 'required|string|max:200',
            'item_code' => 'required|string|max:200',
            'keywords' => 'required|string|max:200',
            'description' => 'required|string|max:200',
            'id' => 'nullable|integer',
            'category_id' => 'required|exists:categories,id',
            'tax_id' => 'required|exists:taxes,id',
            'image' => 'mimes:jpeg,png,jpg,gif|max:5120',
            'attribute_values.*' => 'exists:attribute_values,id' // Validate attribute values exist


        ]);
        if ($validation->fails()) {
            return $this->error([''], $validation->errors()->first());
        } else {
            if ($request->id > 0) {
                $image = Product::where('id', $request->id)->first();
                $imageName = $image->image;
                if ($request->hasFile('image')) {
                    $imageName = $this->saveImage($request->image, $imageName, 'images/products');
                }
            } else {
                if ($request->hasFile('image')) {
                    $imageName = $this->saveImage($request->image, '', 'images/products');
                }
            }

            $product = Product::updateOrCreate(
                ['id' => $request->id],
                [
                    'name' => $request->name,
                    'slug' => $request->slug,
                    'image' => $imageName,
                    'item_code' => $request->item_code,
                    'keywords' => $request->keywords,
                    'description' => $request->description,
                    'category_id' => $request->category_id,
                    'brand_id' => $request->brand_id,
                    'tax_id' => $request->tax_id
                ]
            );

            // Update product attributes
            if ($request->has('attribute_values')) {
                // Clear old attributes
                ProductAttribute::where('product_id', $product->id)->delete();

                // Insert new attributes
                foreach ($request->attribute_values as $attributeValueId) {
                    ProductAttribute::create([
                        'product_id' => $product->id,
                        'category_id' => $request->category_id,
                        'attribute_value_id' => $attributeValueId
                    ]);
                }
            }

            return $this->success(['reload' => true], 'Successfully updated.');
        }
    }
}
