import 'package:dio/dio.dart';
import 'package:graduation/models/article_model.dart';

class ArticleServices {
  final Dio dio;
  ArticleServices(this.dio);

  Future<List<ArticleModel>> getArticles() async {
    var response = await dio.get('https://danna-pi.vercel.app/api/v1/articles');
    Map<String, dynamic> jsonData = response.data;
    List<dynamic> articles = jsonData['result'];
    List<ArticleModel> articlesList = [];
    for (var article in articles) {
      ArticleModel articleModel = ArticleModel(
        image: article['articleCover']['url'],
        title: article['title'],
        description: article['description'],
        comments: [],
        subTitles: List<String>.from(article['subTitles']),
        subDescriptions: List<String>.from(article['subDescriptions']),
        isFavorite: false,
      );
      articlesList.add(articleModel);
    }
    return articlesList;
  }
}
