import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsify/models/article_model.dart';
import 'package:newsify/repositories/hive_repository.dart';
import 'package:newsify/repositories/news_repository.dart';

final articlesByCategoryProvider =
    FutureProvider.family<List<Article>, String>((ref, category) async {
  final repo = ref.read(newsRepositoryProvider);
  return await repo.fetchArticlesByCategory(category);
});

final newsProvider = FutureProvider<List<Article>>((ref) async {
  final selectedCategories = ref.read(hiveRepositoryProvider).getCategories();

  final futures = selectedCategories.map(
    (category) {
      return ref.watch(articlesByCategoryProvider(category).future);
    },
  ).toList();

  final results = await Future.wait(futures);

  final allArticles = results.expand((articles) => articles).toList();
  return allArticles;
});
