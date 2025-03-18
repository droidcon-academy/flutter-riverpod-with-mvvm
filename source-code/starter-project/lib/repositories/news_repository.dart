import 'package:newsify/models/article_model.dart';

abstract interface class NewsRepository {
  Future<List<Article>> fetchArticlesByCategory(String category);
  Future<List<Article>> searchArticles(String query);
}
