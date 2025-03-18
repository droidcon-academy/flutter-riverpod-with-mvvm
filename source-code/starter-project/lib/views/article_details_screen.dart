import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsify/models/article_model.dart';
import 'package:newsify/utils/extensions.dart';

class ArticleDetailsScreen extends ConsumerWidget {
  final Article article;
  const ArticleDetailsScreen({
    super.key,
    required this.article,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite_outline_rounded,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: 12,
          ),
          children: [
            SizedBox(height: 12),
            if (article.urlToImage != null) ...[
              ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.network(
                  article.urlToImage!,
                  width: double.maxFinite,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 12),
            ],
            Text(
              article.title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                if (article.source.name != null) ...[
                  Text(
                    "${article.source.name!} ·",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(width: 4),
                ],
                Text(
                  article.publishedAt.format,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(article.content ?? "")
          ],
        ),
      ),
    );
  }
}
