import 'package:dio/dio.dart';
import 'package:news_app/core/constants/constants.dart';
import 'package:news_app/features/daily_news/data/models/article.dart';
import 'package:news_app/injection_container.dart';

class NewsApiService {
  Future<Response<List<ArticleModel>>> getNewsArticles({
    String? apiKey,
    String? country,
    String? category,
  }) async {
    Map<String, dynamic> query = {
      "apiKey": apiKey,
      "country": country,
      "category": category
    };
    Response<Map<String, dynamic>> response = await sl<Dio>()
        .get('$newsAPIBaseURL/top-headlines', queryParameters: query);

    List<ArticleModel> value = response.data!['articles']
        .map<ArticleModel>(
            (dynamic i) => ArticleModel.fromJson(i as Map<String, dynamic>))
        .toList();
    final httpResponse = Response(
        requestOptions: response.requestOptions,
        data: value,
        statusCode: response.statusCode);
    return httpResponse;
  }
}
