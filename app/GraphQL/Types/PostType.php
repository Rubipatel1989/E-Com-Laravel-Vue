<?php

namespace App\GraphQL\Types;

use App\Models\Post;
use GraphQL\Type\Definition\Type;
use Rebing\GraphQL\Support\Type as GraphQLType;
use Rebing\GraphQL\Support\Facades\GraphQL;

class PostType extends GraphQLType
{
       protected $attributes = [
              'name' => 'Post',
              'description' => 'Object type of the Post Model',
              'model' => Post::class,
       ];

       public function fields(): array
       {
              return [
                     'id' => [
                            'type' => Type::nonNull(Type::int()),
                            'description' => 'ID of the post',
                     ],
                     'title' => [
                            'type' => Type::nonNull(Type::string()),
                            'description' => 'Title of the post',
                     ],
                     'content' => [
                            'type' => Type::nonNull(Type::string()),
                            'description' => 'Content of the post',
                     ],
                     'author' => [
                            'type' => Type::nonNull(Type::string()),
                            'description' => 'Author of the post',
                     ],
              ];
       }
}
