import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsify/models/article_model.dart';
import 'package:newsify/widgets/article_list.dart';

class SavedTab extends ConsumerWidget {
  const SavedTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ArticleList(
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
    );
  }
}
