<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\HomeBanner;
use Illuminate\Http\Request;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use App\Traits\ApiResponse;
use Illuminate\Support\Facades\File;

class HomeBannerController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $data = HomeBanner::get();
        return view('admin/HomeBanner/home_banners', get_defined_vars());
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validation = Validator::make($request->all(), [
            'text' => 'required|string|max:200',
            'link' => 'required|string|max:200',
            'id' => 'required|integer',
            'image' => 'mimes:jpeg,png,jpg,gif|max:5120'

        ]);
        if ($validation->fails()) {
            return $this->error([''], $validation->errors()->first());
        } else {
            if ($request->hasFile('image')) {
                if ($request->post('id') > 0) {
                    $image = HomeBanner::where('id', $request->post('id'))->first();
                    $image_path = "images/" . $image->image;
                    if (File::exists($image_path)) {
                        File::delete($image_path);
                    }
                    //dd($image);
                }
                $image_name = time() . '.' . $request->image->extension();                
                $request->image->move(public_path('images/'), $image_name);
            } elseif($request->post('id') > 0) {
                
            }
            $user = HomeBanner::updateOrCreate(
                ['id' => Auth::User()->id],
                [
                    'email' => $request->email,
                    'name' => $request->name,
                    'address' => $request->address,
                    'phone' => $request->phone,
                    'twitter_link' => $request->twitter_link,
                    'fb_link' => $request->fb_link,
                    'insta_link' => $request->insta_link,
                    'image' => $image_name
                ]
            );
            return $this->success([''], 'Successfully updated.');
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
