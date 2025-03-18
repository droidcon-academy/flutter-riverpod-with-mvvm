import 'package:newsify/models/article_model.dart';

abstract interface class HiveRepository {
  bool hasUserPreferences();

  void setCategories(List<String> categories);

  List<String> getCategories();

  void saveArticle(Article article);

  bool isArticleSaved(Article article);

  void unsaveArticle(Article article);

  List<Article> getSavedArticles();
}
