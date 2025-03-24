import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:newsify/models/article_model.dart';

final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService();
});

class ApiService {
  final String _apiKey = 'YOU API KEY HERE';
  final String _baseUrl = 'https://newsapi.org/v2/top-headlines?country=us';

  Future<List<Article>> getArticlesByCategory(String category) async {
    final url = '$_baseUrl&category=$category&apiKey=$_apiKey';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List articlesJson = data['articles'];
      return articlesJson
          .map<Article>((json) => Article.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load articles for category: $category');
    }
  }

  Future<List<Article>> searchArticles(String query) async {
    final url = '$_baseUrl&q=$query&apiKey=$_apiKey';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List articlesJson = data['articles'];
      return articlesJson
          .map<Article>((json) => Article.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to search articles for query: $query');
    }
  }
}
