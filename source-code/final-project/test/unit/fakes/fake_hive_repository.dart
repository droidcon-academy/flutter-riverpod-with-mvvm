import 'package:newsify/models/article_model.dart';
import 'package:newsify/repositories/hive_repository.dart';

class FakeHiveRepository implements HiveRepository {
  List<String> _categories = [];
  final List<Article> _articles = [];

  @override
  bool hasUserPreferences() => _categories.isNotEmpty;

  @override
  void setCategories(List<String> categories) {
    _categories = categories;
  }

  @override
  List<String> getCategories() => _categories;

  @override
  void saveArticle(Article article) {
    _articles.add(article);
  }

  @override
  bool isArticleSaved(Article article) {
    return _articles.where((e) => e.url == article.url).isNotEmpty;
  }

  @override
  void unsaveArticle(Article article) {
    final indexOfArticle = _articles.indexWhere((e) => e.url == article.url);
    if (indexOfArticle != -1) {
      _articles.removeAt(indexOfArticle);
    }
  }

  @override
  List<Article> getSavedArticles() => _articles;
}
