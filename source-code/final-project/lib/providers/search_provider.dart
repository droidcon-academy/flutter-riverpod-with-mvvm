import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsify/models/article_model.dart';
import 'package:newsify/repositories/news_repository.dart';

final searchProvider =
    FutureProvider.family<List<Article>, String>((ref, query) async {
  final repo = ref.read(newsRepositoryProvider);
  return await repo.searchArticles(query);
});
