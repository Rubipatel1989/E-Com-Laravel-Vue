<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Post;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // Seed the 'posts' table with 10 posts
        Post::factory(100)->create();

        // You can also create a specific post with predefined data like this:
        // Post::factory()->create([
        //     'title' => 'Specific Post Title',
        //     'content' => 'This is the content of the specific post.',
        //     'author' => 'John Doe',
        // ]);
    }
}
