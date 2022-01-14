import 'package:json_annotation/json_annotation.dart';

part 'tesla_article_source_model.g.dart';

@JsonSerializable()
class Source {
  @JsonKey(name: "id")
  late String id;

  @JsonKey(name: "name")
  late String name;

  Source();

  factory Source.fromJson(Map<String, dynamic>json) => _$SourceFromJson(json);
  Map<String, dynamic>toJson() => _$SourceToJson(this);

}