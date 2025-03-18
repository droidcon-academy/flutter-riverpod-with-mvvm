import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsify/models/article_model.dart';
import 'package:newsify/services/api_service.dart';

final newsRepositoryProvider = Provider<NewsRepository>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return NewsRepository(apiService: apiService);
});

class NewsRepository {
  final ApiService apiService;

  NewsRepository({required this.apiService});

  Future<List<Article>> fetchArticlesByCategory(String category) async {
    return await apiService.getArticlesByCategory(category);
  }

  Future<List<Article>> searchArticles(String query) async {
    return await apiService.searchArticles(query);
  }
}
