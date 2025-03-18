import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsify/providers/news_provider.dart';
import 'package:newsify/providers/search_provider.dart';
import 'package:newsify/viewmodels/feed_viewmodel.dart';
import 'package:newsify/widgets/article_list.dart';
import 'package:newsify/widgets/error_message_widget.dart';
import 'package:newsify/widgets/loading_indicator.dart';

class FeedTab extends ConsumerWidget {
  const FeedTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final search = ref.watch(feedViewmodel);
    final articlesAsyncValue = search.isNotEmpty
        ? ref.watch(searchArticlesProvider(search))
        : ref.watch(newsProvider);
    return Column(
      children: [
        SizedBox(height: 20),
        TextField(
          onChanged: (value) {
            ref.read(feedViewmodel.notifier).search(value.trim());
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            label: Text("Search"),
          ),
        ),
        SizedBox(height: 20),
        Expanded(
          child: articlesAsyncValue.when(
            data: (articles) => ArticleList(articles: articles),
            loading: () => LoadingIndicator(),
            error: (error, stack) => ErrorMessageWidget(error: error),
          ),
        ),
      ],
    );
  }
}
