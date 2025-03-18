import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:newsify/hive/hive_boxes.dart';
import 'package:newsify/models/article_model.dart';
import 'package:newsify/models/user_preferences_model.dart';

final hiveRespositoryProvider = Provider<HiveRepository>((ref) {
  return HiveRepositoryImpl();
});

abstract interface class HiveRepository {
  bool hasUserPreferences();

  void setCategories(List<String> categories);

  List<String> getCategories();

  void saveArticle(Article article);

  bool isArticleSaved(Article article);

  void unsaveArticle(Article article);

  List<Article> getSavedArticles();
}

class HiveRepositoryImpl implements HiveRepository {
  final userPrefsKey = "userPrefsKey";

  @override
  bool hasUserPreferences() {
    final box = Hive.box<UserPreferences>(HiveBoxes.categories);
    return box.isNotEmpty;
  }

  @override
  void setCategories(List<String> categories) {
    final box = Hive.box<UserPreferences>(HiveBoxes.categories);
    box.put(userPrefsKey, UserPreferences(categories: categories));
  }

  @override
  List<String> getCategories() {
    final box = Hive.box<UserPreferences>(HiveBoxes.categories);
    return box.get(userPrefsKey)!.categories;
  }

  @override
  void saveArticle(Article article) {
    final box = Hive.box<Article>(HiveBoxes.savedArticles);
    box.add(article);
  }

  @override
  bool isArticleSaved(Article article) {
    final box = Hive.box<Article>(HiveBoxes.savedArticles);
    return box.values.where((e) => e.url == article.url).isNotEmpty;
  }

  @override
  void unsaveArticle(Article article) {
    final box = Hive.box<Article>(HiveBoxes.savedArticles);
    final articleIndex = box.values.toList().indexWhere(
      (e) {
        return e.url == article.url;
      },
    );
    if (articleIndex != -1) {
      box.deleteAt(articleIndex);
    }
  }

  @override
  List<Article> getSavedArticles() {
    return Hive.box<Article>(HiveBoxes.savedArticles).values.toList();
  }
}
