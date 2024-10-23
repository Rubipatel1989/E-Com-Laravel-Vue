<?php

namespace App\GraphQL\Mutations;

use App\Models\Post;
use GraphQL\Type\Definition\Type;
use Rebing\GraphQL\Support\Facades\GraphQL;
use Rebing\GraphQL\Support\Mutation;

class CreatePostMutation extends Mutation
{
    protected $attributes = [
        'name' => 'createPost',
        'description' => 'A mutation to create a post',
    ];

    public function type(): Type
    {
        return GraphQL::type('Post');  // Return the Post type after creation
    }

    public function args(): array
    {
        return [
            'title' => [
                'name' => 'title',
                'type' => Type::nonNull(Type::string()),
                'description' => 'Title of the post',
            ],
            'content' => [
                'name' => 'content',
                'type' => Type::nonNull(Type::string()),
                'description' => 'Content of the post',
            ],
            'author' => [
                'name' => 'author',
                'type' => Type::nonNull(Type::string()),
                'description' => 'Author of the post',
            ],
        ];
    }

    public function resolve($root, array $args)
    {
        // Insert the new post into the database
        $post = Post::create([
            'title' => $args['title'],
            'content' => $args['content'],
            'author' => $args['author'],
        ]);

        return $post;
    }
}
