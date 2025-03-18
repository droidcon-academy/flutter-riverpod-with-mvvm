import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:newsify/hive/hive_boxes.dart';
import 'package:newsify/models/article_model.dart';
import 'package:newsify/models/user_preferences_model.dart';

final hiveRespositoryProvider = Provider<HiveRepository>((ref) {
  return HiveRepository();
});

class HiveRepository {
  final userPrefsKey = "userPrefsKey";

  bool hasUserPreferences() {
    final box = Hive.box<UserPreferences>(HiveBoxes.categories);
    return box.isNotEmpty;
  }

  void setCategories(List<String> categories) {
    final box = Hive.box<UserPreferences>(HiveBoxes.categories);
    box.put(userPrefsKey, UserPreferences(categories: categories));
  }

  List<String> getCategories() {
    final box = Hive.box<UserPreferences>(HiveBoxes.categories);
    return box.get(userPrefsKey)!.categories;
  }

  void saveArticle(Article article) {
    final box = Hive.box<Article>(HiveBoxes.savedArticles);
    box.add(article);
  }

  bool isArticleSaved(Article article) {
    final box = Hive.box<Article>(HiveBoxes.savedArticles);
    return box.values.where((e) => e.url == article.url).isNotEmpty;
  }

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

  List<Article> getSavedArticles() {
    return Hive.box<Article>(HiveBoxes.savedArticles).values.toList();
  }
}
