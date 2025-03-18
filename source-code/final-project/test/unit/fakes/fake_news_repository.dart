import 'package:newsify/models/article_model.dart';
import 'package:newsify/repositories/news_repository.dart';

class FakeNewsRepository implements NewsRepository {
  final bool shouldThrow;
  FakeNewsRepository({this.shouldThrow = false});

  @override
  Future<List<Article>> fetchArticlesByCategory(String category) async {
    if (shouldThrow) {
      throw Exception('Forced error for testing');
    }
    return [
      Article(
        title: 'Fake Article',
        description: 'This is a fake article for testing',
        url: 'https://example.com',
        urlToImage: 'https://example.com/image.jpg',
        publishedAt: DateTime.now(),
        content: 'Fake content',
        source: Source(),
      )
    ];
  }

  @override
  Future<List<Article>> searchArticles(String query) async {
    if (shouldThrow) {
      throw Exception('Forced error for testing');
    }
    return [
      Article(
        title: 'Fake Article',
        description: 'This is a fake article for testing',
        url: 'https://example.com',
        urlToImage: 'https://example.com/image.jpg',
        publishedAt: DateTime.now(),
        content: 'Fake content',
        source: Source(),
      )
    ];
  }
}
