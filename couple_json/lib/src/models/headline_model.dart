import 'package:couple_json/src/models/article_model.dart';
import 'package:json_annotation/json_annotation.dart';


part 'headline_model.g.dart';

@JsonSerializable()
class Headline {

  @JsonKey(name: "status")
  late String status;

  @JsonKey(name: "totalResults")
  late int totalResults;

  @JsonKey(name: "articles")
  late List<Article> articles;

  Headline();

  factory Headline.fromJson(Map<String, dynamic>json) => _$HeadlineFromJson(json);
  Map<String, dynamic> toJson() => _$HeadlineToJson(this);
  
}