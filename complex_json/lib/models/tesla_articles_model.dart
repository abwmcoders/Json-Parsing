import 'package:complex_json/models/tesla_article_source_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tesla_articles_model.g.dart';

@JsonSerializable()
class ArticleClass {

  @JsonKey(name: "source")
  late Source source;

  @JsonKey(name: "author")
  late String author;

  @JsonKey(name: "title")
  late String title;

  @JsonKey(name: "description")
  late String description;

  @JsonKey(name: "url")
  late String url;

  @JsonKey(name: "urlToImage")
  late String urlToImage;

  @JsonKey(name: "publishedAt")
  late String publishedAt;

  @JsonKey(name: "content")
  late String content;

  ArticleClass();

  factory ArticleClass.fromJson(Map<String, dynamic>json) => _$ArticleClassFromJson(json);
  Map<String, dynamic>toJson() => _$ArticleClassToJson(this);
}