import 'package:flutter/material.dart';
import 'package:newsify/app/app_routes.dart';
import 'package:newsify/models/article_model.dart';
import 'package:newsify/utils/extensions.dart';

class ArticleCard extends StatelessWidget {
  final Article article;
  const ArticleCard({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    final radius = Radius.circular(18);
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.articleDetails,
          arguments: article,
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            if (article.urlToImage != null)
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: radius,
                  topRight: radius,
                ),
                child: Image.network(
                  article.urlToImage!,
                  width: double.maxFinite,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.only(
                  bottomLeft: radius,
                  bottomRight: radius,
                ),
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    article.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8),
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
          ],
        ),
      ),
    );
  }
}
