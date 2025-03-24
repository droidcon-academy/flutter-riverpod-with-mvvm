import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsify/models/article_model.dart';
import 'package:newsify/widgets/article_list.dart';

class FeedTab extends ConsumerWidget {
  const FeedTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        SizedBox(height: 20),
        TextField(
          onChanged: (value) {},
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            label: Text("Search"),
          ),
        ),
        SizedBox(height: 20),
        Expanded(
          child: ArticleList(
            articles: [
              Article(
                title: 'Fake Article 1',
                description: 'This is a fake article for testing',
                url: 'https://academy.droidcon.com',
                urlToImage:
                    'https://lwfiles.mycourse.app/droidcon-public/f11ed54687792408d5dfc847bf926bae.png',
                publishedAt: DateTime.now(),
                content: 'Fake content',
                source: Source(),
              ),
              Article(
                title: 'Fake Article 2',
                description: 'This is a fake article for testing',
                url: 'https://academy.droidcon.com',
                urlToImage:
                    'https://lwfiles.mycourse.app/droidcon-public/f11ed54687792408d5dfc847bf926bae.png',
                publishedAt: DateTime.now(),
                content: 'Fake content',
                source: Source(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
