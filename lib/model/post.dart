class PostResponse {
  List<Post> listPost;

  PostResponse({this.listPost});
  factory PostResponse.fromJson(List<dynamic> json) {
    var posts =List.of(json);

    /// keterangan:::
    /// fungsi [post.map((f) => Post.fromJson(f)).toList()] sama dengan funsi berikut:
    /// 
    /// List<Post> post =List();
    /// for (var i = 0; i < posts.length; i++) {
    ///   post.add(Post.fromJson(posts[i]));
    /// }

    return PostResponse(
      listPost: posts.map((f) => Post.fromJson(f)).toList()
    );
  }
}

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}