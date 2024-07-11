import 'package:dio/dio.dart';
import 'package:graduation/models/post_model.dart';

class ArticleServices {
  final Dio dio;
  ArticleServices(this.dio);

  Future<List<ArticleModel>> getArticles() async {
    var response = await dio.get('http://danna-pi.vercel.app/api/v1/posts');

    Map<String, dynamic> jsonData = response.data;
    List<dynamic> articles = jsonData['result'];

    List<ArticleModel> articlesList = [];

    for (var article in articles) {
      ArticleModel articleModel = ArticleModel(
        profileImage: article['addedBy']['profileImage']['url'],
        userName: article['addedBy']['userName'],
        time: article['updatedAt'],
        description: article['description'],
        postImages: article['images']
            .map<PostImage>((img) => PostImage(text: img['url']))
            .toList(),
        comments: [],
      );
      articlesList.add(articleModel);
    }
    return articlesList;
  }
}
