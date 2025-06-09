import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsify/models/article_model.dart';
import 'package:newsify/providers/news_provider.dart';
import 'package:newsify/repositories/hive_repository.dart';
import 'package:newsify/repositories/news_repository.dart';

import '../fakes/fake_hive_repository.dart';
import '../fakes/fake_news_repository.dart';

void main() {
  group('articlesByCategoryProvider', () {
    test('returns articles for a given category', () async {
      final container = ProviderContainer(overrides: [
        newsRepositoryProvider.overrideWithValue(
          FakeNewsRepository(shouldThrow: false),
        ),
      ]);
      addTearDown(container.dispose);

      final articles = await container.read(
        articlesByCategoryProvider('technology').future,
      );
      expect(articles, isA<List<Article>>());
      expect(articles.length, equals(1));
      expect(articles.first.title, equals('Fake Article'));
    });
  });

  group('newsProvider', () {
    test('aggregates articles from multiple categories', () async {
      final fakeHive = FakeHiveRepository();
      fakeHive.setCategories(['technology', 'sports']);

      final container = ProviderContainer(
        overrides: [
          hiveRepositoryProvider.overrideWithValue(fakeHive),
          newsRepositoryProvider.overrideWithValue(
            FakeNewsRepository(shouldThrow: false),
          ),
        ],
      );
      addTearDown(container.dispose);


      final allArticles = await container.read(newsProvider.future);
      expect(allArticles, isA<List<Article>>());
      expect(allArticles.length, equals(2));
    });

    test('throws error when one category fetch fails', () async {
      final fakeHive = FakeHiveRepository();
      fakeHive.setCategories(['technology', 'sports']);

      final container = ProviderContainer(overrides: [
        hiveRepositoryProvider.overrideWithValue(fakeHive),
        newsRepositoryProvider.overrideWithValue(
          FakeNewsRepository(shouldThrow: true),
        ),
      ]);
      addTearDown(container.dispose);

      expect(
        container.read(newsProvider.future),
        throwsA(isA<Exception>()),
      );
    });
  });
}
