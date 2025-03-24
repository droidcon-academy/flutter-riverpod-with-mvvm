import 'package:newsify/models/article_model.dart';
import 'package:newsify/services/api_service.dart';

abstract interface class NewsRepository {
  Future<List<Article>> fetchArticlesByCategory(String category);
  Future<List<Article>> searchArticles(String query);
}

class NewsRepositoryImpl implements NewsRepository {
  final ApiService apiService;

  NewsRepositoryImpl({required this.apiService});

  @override
  Future<List<Article>> fetchArticlesByCategory(String category) async {
    return await apiService.getArticlesByCategory(category);
  }

  @override
  Future<List<Article>> searchArticles(String query) async {
    return await apiService.searchArticles(query);
  }
}
