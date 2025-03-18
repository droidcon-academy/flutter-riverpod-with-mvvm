import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsify/providers/saved_articles_provider.dart';
import 'package:newsify/widgets/article_list.dart';

class SavedTab extends ConsumerWidget {
  const SavedTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ArticleList(
      articles: ref.watch(savedArticlesProvider),
    );
  }
}
