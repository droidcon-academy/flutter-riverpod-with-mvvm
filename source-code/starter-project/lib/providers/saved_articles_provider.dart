import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsify/models/article_model.dart';
import 'package:newsify/repositories/hive_repository.dart';

final savedArticlesProvider =
    NotifierProvider<SavedArticlesNotifier, List<Article>>(
  SavedArticlesNotifier.new,
);

class SavedArticlesNotifier extends Notifier<List<Article>> {
  late final HiveRepository hiveRepository;
  @override
  List<Article> build() {
    hiveRepository = ref.read(hiveRepositoryProvider);
    return hiveRepository.getSavedArticles();
  }

  void updateArticle(Article article, bool save) {
    final newState = [...state];
    hiveRepository.saveArticle(article);
    newState.add(article);
    state = newState;
  }
}
