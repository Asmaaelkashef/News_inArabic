import 'package:dio/dio.dart';
import 'package:news_app/models/article_model.dart';

class NewsServices {
  final Dio dio;

  NewsServices(this.dio);

  Future<List<ArticleModel>> getNews({String? category}) async {
    final query = category ?? 'مصر';

    Response response = await dio.get(
      'https://newsapi.org/v2/everything',
      queryParameters: {
        'q': query,
        'language': 'ar',
        'sortBy': 'publishedAt',
        'apiKey': '6b0275032750466ebabdee54deda182e',
      },
    );

    final jsonData = response.data;
    final articles = jsonData['articles'] as List<dynamic>;
    List<ArticleModel> articlesList = [];

    for (var article in articles) {
      if (article['title'] != null && article['url'] != null) {
        articlesList.add(
          ArticleModel(
            image: article['urlToImage'],
            title: article['title'],
            subtitle: article['description'],
            url: article['url'],
            source: Source(
              id: article['source']['id'],
              name: article['source']['name'],
            ),
          ),
        );
      }
    }

    return articlesList;
  }
}
