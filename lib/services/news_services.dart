import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app/models/article_models.dart';

class NewsServices {
  final Dio dio;

  NewsServices(this.dio);
  Future<List<ArticleModels>> getNews({required String category}) async {
    try {
      Response response = await dio.get(
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=${dotenv.env['apiKey']}&category=$category',
      );

      List<dynamic> articles = response.data['articles'];

      List<ArticleModels> articleList =
          articles
              .map((articleJson) => ArticleModels.fromJson(articleJson))
              .toList();

      return articleList;
    } catch (e) {
      print('Error fetching news: $e');
      return [];
    }
  }
}
