import 'package:couple_json/src/models/sourece_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'article_model.g.dart';

@JsonSerializable()
class Article {

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

  Article();

  factory Article.fromJson(Map<String, dynamic>json) => _$ArticleFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleToJson(this);
  
}