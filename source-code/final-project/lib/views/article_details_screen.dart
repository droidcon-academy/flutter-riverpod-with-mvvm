import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsify/models/article_model.dart';
import 'package:newsify/utils/extensions.dart';
import 'package:newsify/viewmodels/article_details_viewmodel.dart';

class ArticleDetailsScreen extends ConsumerWidget {
  final Article article;
  const ArticleDetailsScreen({
    super.key,
    required this.article,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewmodel = articleDetailsViewmodel(article);
    final isSaved = ref.watch(viewmodel);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              ref.read(viewmodel.notifier).toggleSavedState();
            },
            icon: Icon(
              isSaved
                  ? Icons.bookmark_added_rounded
                  : Icons.bookmark_outline_rounded,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(height: 12),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.title,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 15),
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
                ],
              ),
            ),
            SizedBox(height: 15),
            if (article.urlToImage != null) ...[
              Image.network(
                article.urlToImage!,
                width: double.maxFinite,
                height: 200,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 15),
            ],
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text(article.content ?? ""),
            )
          ],
        ),
      ),
    );
  }
}
