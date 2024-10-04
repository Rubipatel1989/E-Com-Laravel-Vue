<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Category;

use App\Models\Brand;
use App\Models\Color;
use App\Models\Product;
use App\Models\ProductAttr;
use App\Models\ProductAttribute;
use App\Models\ProductAttrImages;
use App\Models\Size;
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
        $colors = Color::get();
        $sizes = Size::get();
        //prx($sizes->toArray());
        return view('admin/Product/product', get_defined_vars());
    }

    public function store(Request $request)
    {
        //dd($request->all());
        $validation = Validator::make($request->all(), [
            'name' => 'required|string|max:200',
            'slug' => 'required|string|max:200',
            'item_code' => 'required|string|max:200',
            'keywords' => 'required|string|max:200',
            'description' => 'required|string|max:200',
            'category_id' => 'required|exists:categories,id',
            'tax_id' => 'required|exists:taxes,id',
            'image' => 'mimes:jpeg,png,jpg,gif|max:5120',
            'attribute_values.*' => 'exists:attribute_values,id', // Validate attribute values exist
            'product_attrs.*.sku' => 'required|string|max:255',
            'product_attrs.*.price' => 'required|numeric|min:0',
            'product_attrs.*.mrp' => 'required|numeric|min:0',
            'product_attrs.*.qty' => 'required|integer|min:1',
            'product_attr_images.*.*' => 'mimes:jpeg,png,jpg,gif|max:5120', // Validate images
        ]);

        if ($validation->fails()) {
            return $this->error([''], $validation->errors()->first());
        }

        if ($request->id > 0) {
            $image = Product::where('id', $request->id)->first();
            $imageName = $image->image;
            if ($request->hasFile('image')) {
                $imageName = $this->saveImage($request->image, $imageName, 'images/products');
            }
        } else {
            $imageName = $request->hasFile('image') ? $this->saveImage($request->image, '', 'images/products') : '';
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
                'tax_id' => $request->tax_id,
            ]
        );

        // Update product attributes
        if ($request->has('attribute_values')) {
            ProductAttribute::where('product_id', $product->id)->delete();
            foreach ($request->attribute_values as $attributeValueId) {
                ProductAttribute::create([
                    'product_id' => $product->id,
                    'category_id' => $request->category_id,
                    'attribute_value_id' => $attributeValueId,
                ]);
            }
        }

        // Update product_attrs
        if ($request->has('product_attrs')) {
            foreach ($request->product_attrs as $attr) {
                // Update or create ProductAttr based on id and product_id
                $productAttr = ProductAttr::updateOrCreate(
                    [
                        'id' => $attr['id'] ?? null,
                        'product_id' => $product->id  // Ensure product_id is used in updateOrCreate
                    ],
                    [
                        'sku' => $attr['sku'],
                        'mrp' => $attr['mrp'],
                        'price' => $attr['price'],
                        'qty' => $attr['qty'],
                        'length' => $attr['length'],
                        'breadth' => $attr['breadth'],
                        'height' => $attr['height'],
                        'weight' => $attr['weight'],
                        'color_id' => $attr['color_id'],
                        'size_id' => $attr['size_id'],
                    ]
                );

                // Handle product_attr_images for each attribute
                if (isset($attr['images'])) {
                    // Delete existing images related to this product attribute
                    ProductAttrImages::where('product_attr_id', $productAttr->id)->delete();
                    // Loop through each image and save it
                    foreach ($attr['images'] as $image) {
                        //dd($image);
                        $imageName = $this->saveImage($image, '', 'images/product-attributes');
                        ProductAttrImages::create([
                            'product_id' => $product->id,
                            'product_attr_id' => $productAttr->id,
                            'image' => $imageName,
                        ]);
                    }
                }
            }
        }


        return $this->success(['reload' => true], 'Product Successfully Updated.');
    }
}
