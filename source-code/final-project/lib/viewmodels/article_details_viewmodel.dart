import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsify/models/article_model.dart';
import 'package:newsify/providers/saved_articles_provider.dart';
import 'package:newsify/repositories/hive_repository.dart';

final articleDetailsViewmodel =
    NotifierProviderFamily<ArticleDetailsViewmodel, bool, Article>(
  ArticleDetailsViewmodel.new,
);

class ArticleDetailsViewmodel extends FamilyNotifier<bool, Article> {
  late final Article article;

  void toggleSavedState() {
    state = !state;
    final savedArticlesNotifier = ref.read(savedArticlesProvider.notifier);
    savedArticlesNotifier.updateArticle(article, state);
  }

  @override
  bool build(Article arg) {
    article = arg;
    return ref.read(hiveRespositoryProvider).isArticleSaved(article);
  }
}
