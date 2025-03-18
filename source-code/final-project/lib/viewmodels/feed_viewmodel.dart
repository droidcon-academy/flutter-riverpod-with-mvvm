import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsify/providers/search_provider.dart';
import 'package:newsify/repositories/news_repository.dart';

final feedViewmodel = NotifierProvider<FeedViewmodel, String>(
  FeedViewmodel.new,
);

class FeedViewmodel extends Notifier<String> {
  @override
  String build() {
    return "";
  }

  void search(String query) {
    state = query;
    if (state.isNotEmpty) {
      ref.read(newsRepositoryProvider).searchArticles(query);
      ref.read(searchArticlesProvider(query));
    }
  }
}
