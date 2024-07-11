class PostModel {
  final String userName;
  final String profileImage;
  final String time;
  final String? postImages;
  final String? description;
  final int likes;
  final List<Comment> comments;

  const PostModel({
    required this.userName,
    required this.profileImage,
    required this.time,
    this.postImages,
    this.description,
    this.likes = 0,
    this.comments = const [],
  });
}

class ArticleModel {
  final String userName;
  final String profileImage;
  final String? description;
  final String time;
  List<PostImage> postImages;
  List<Comment> comments;
  int likes;

  ArticleModel({
    required this.time,
    required this.userName,
    this.likes = 0,
    required this.profileImage,
    this.description,
    this.comments = const [],
    this.postImages = const [],
  });
}

class Comment {
  final String text;
  final String userName;
  final String profileImageUrl;

  Comment({
    required this.text,
    required this.userName,
    required this.profileImageUrl,
  });
}

class PostImage {
  final String text;

  PostImage({required this.text});
}

extension ArticleModelExtension on ArticleModel {
  PostModel toPostModel() {
    return PostModel(
      userName: userName,
      profileImage: profileImage,
      time: time,
      postImages: postImages.isNotEmpty ? postImages.first.text : null,
      description: description,
      likes: likes,
      comments: comments,
    );
  }
}
