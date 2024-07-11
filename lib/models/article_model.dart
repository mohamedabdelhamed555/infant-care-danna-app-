class ArticleModel {
  final String title;
  final List<String> subTitles;
  final List<String> subDescriptions;
  final String description;
  final String image;
  List<Comment> comments;
  int likes;
  bool isFavorite;

  ArticleModel(
      {required this.title,
      this.likes = 0,
      required this.image,
      required this.description,
      this.comments = const [],
      required this.subTitles,
      required this.isFavorite,
      required this.subDescriptions});
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

