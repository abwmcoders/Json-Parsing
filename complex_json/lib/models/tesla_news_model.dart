import 'package:complex_json/models/tesla_articles_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tesla_news_model.g.dart';

@JsonSerializable()
class TeslaNews {
  @JsonKey(name: "status")
  late String status;

  @JsonKey(name: "totalResults")
  late int totalResults;

  @JsonKey(name: "articles")
  late List<ArticleClass> articleClass;

  TeslaNews();

  factory TeslaNews.fromJson(Map<String, dynamic>json) => _$TeslaNewsFromJson(json);
  Map<String, dynamic> toJson() => _$TeslaNewsToJson(this);
}