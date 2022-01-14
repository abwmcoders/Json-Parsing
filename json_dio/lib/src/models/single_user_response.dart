import 'package:json_annotation/json_annotation.dart';
import 'package:json_dio/src/models/single_user.dart';

 part 'single_user_response.g.dart';

@JsonSerializable()
class SingleUserResponse {
  SingleUserResponse();

  @JsonKey(name: "data")
  late User user;

  factory SingleUserResponse.fromJson(Map<String, dynamic> json) => _$SingleUserResponseFromJson(json);
   Map<String, dynamic> toJson() => _$SingleUserResponseToJson(this);
}