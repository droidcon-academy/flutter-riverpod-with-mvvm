import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'article_model.freezed.dart';
part 'article_model.g.dart';

@freezed
class Article with _$Article {
  @HiveType(typeId: 2)
  const factory Article({
    @HiveField(0) required Source source,
    @HiveField(1) required String title,
    @HiveField(2) required String? description,
    @HiveField(3) required String url,
    @HiveField(4) required String? urlToImage,
    @HiveField(5) required DateTime publishedAt,
    @HiveField(6) required String? content,
  }) = _Article;

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
}

@HiveType(typeId: 3)
@freezed
class Source with _$Source {
  const factory Source({
    @HiveField(0) String? id,
    @HiveField(1) String? name,
  }) = _Source;

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
}
