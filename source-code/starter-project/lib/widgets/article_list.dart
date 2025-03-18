import 'package:flutter/material.dart';
import 'package:newsify/models/article_model.dart';
import 'package:newsify/widgets/article_card.dart';

class ArticleList extends StatelessWidget {
  final List<Article> articles;
  const ArticleList({
    super.key,
    required this.articles,
  });

  @override
  Widget build(BuildContext context) {
    if (articles.isEmpty) {
      return const Center(child: Text('No articles available.'));
    }
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return ArticleCard(article: articles[index]);
      },
    );
  }
}
