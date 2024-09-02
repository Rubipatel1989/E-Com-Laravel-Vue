<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use App\Traits\ApiResponse;

class ProfileController extends Controller
{
    use ApiResponse;
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return view('admin/profile');
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
        //dd($request->all());
        $validation = Validator::make($request->all(), [
            'email' => 'required|string|email|unique:users,email,' . Auth::User()->id,
            'name' => 'required|string|max:200',
            'address' => 'required|string|max:250',
            'phone' => 'required|string|max:13',
            'twitter_link' => 'string|max:250',
            'fb_link' => 'string|max:250',
            'insta_link' => 'required|string|max:250',
            'image' => 'mimes:jpeg,png,jpg,gif|max:5120'

        ]);
        if ($validation->fails()) {            
            return $this->error([''], $validation->errors()->first());
        } else {
            if ($request->hasFile('image')) {
                $image_name = 'images/' . $request->name . '_' . time() . '.' . $request->image->extension();
                $request->image->move(public_path('images/'), $image_name);
            } else{
                $image_name = Auth::User()->image;
            }
            $user = User::updateOrCreate(
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
