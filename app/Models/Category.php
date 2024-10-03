<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    use HasFactory;
    protected $fillable = [
        'name',
        'slug',
        'image',
        'parent_category_id'
    ];
    public function parentCategory()
    {
        return $this->belongsTo(Category::class, 'parent_category_id');
    }
    
    public function attributes()
    {
        return $this->belongsToMany(Attribute::class, 'category_attribute', 'category_id', 'attribute_id');
    }
}
