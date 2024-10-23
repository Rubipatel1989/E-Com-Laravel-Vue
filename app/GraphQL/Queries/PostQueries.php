<?php

namespace App\GraphQL\Queries;

use Closure;
use App\Models\Post;
use Rebing\GraphQL\Support\Facades\GraphQL;
use GraphQL\Type\Definition\ResolveInfo;
use GraphQL\Type\Definition\Type;
use Rebing\GraphQL\Support\Query;

class PostQueries extends Query
{
       protected $attributes = [
              'name' => 'getPosts',
              'description' => 'Query to fetch all posts or a single post by ID',
       ];

       public function type(): Type
       {
              return Type::nonNull(Type::listOf(Type::nonNull(GraphQL::type('Post')))); // Referencing the PostType
       }

       public function args(): array
       {
              return [
                     'id' => [
                            'name' => 'id',
                            'type' => Type::int(),
                            'description' => 'ID of the post',
                     ],
                     'author' => [
                            'name' => 'author',
                            'type' => Type::string(),
                            'description' => 'Author of the post',
                     ],
              ];
       }

       public function resolve($root, array $args, $context, ResolveInfo $resolveInfo, Closure $getSelectedFields)
       {
              // If an ID is passed, fetch the post with that ID
              if (isset($args['id'])) {
                     return Post::where('id', $args['id'])->get();
              }

              // If an author is passed, fetch posts by that author (case-insensitive)
              if (isset($args['author'])) {
                     return Post::where('author', 'LIKE', '%' . $args['author'] . '%')->get();
              }

              // If no arguments are passed, fetch all posts
              return Post::all();
       }
}
