## Table is Posts
Run db seeder also for fake data.


http://127.0.0.1:8000/graphql

{
  getPosts {
    id
    title
    content
    author
  }
}


query {
  getPosts(author: "Pawan") {
    id
    title
    content
    author
  }
}


query {
  getPosts(id: 99) {
    id
    title
    content
    author
  }
}

mutation {
  createPost(title: "Neha Sharma", content: "This is the content of the new post", author: "John Doe") {
    id
    title
    content
    author
  }
}
