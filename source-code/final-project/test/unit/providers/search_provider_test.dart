import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:newsify/models/article_model.dart';
import 'package:newsify/providers/search_provider.dart';
import 'package:newsify/repositories/news_repository.dart';

import '../fakes/fake_news_repository.dart';

void main() {
  test('searchArticlesProvider returns list of articles', () async {
    final container = ProviderContainer(overrides: [
      newsRepositoryProvider.overrideWithValue(
        FakeNewsRepository(shouldThrow: false),
      ),
    ]);
    addTearDown(container.dispose);

    final articles = await container.read(searchProvider('test').future);

    expect(articles, isA<List<Article>>());
    expect(articles.length, 1);
    expect(articles.first.title, 'Fake Article');
  });

  test('searchArticlesProvider throws error when repository fails', () async {
    final container = ProviderContainer(overrides: [
      newsRepositoryProvider.overrideWithValue(
        FakeNewsRepository(shouldThrow: true),
      ),
    ]);
    addTearDown(container.dispose);

    expect(
      container.read(searchProvider('test').future),
      throwsA(isA<Exception>()),
    );
  });
}
