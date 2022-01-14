import 'package:json_annotation/json_annotation.dart';
import 'package:json_dio/src/models/single_user.dart';

part 'list_users_response.g.dart';

@JsonSerializable()
class  UsersList {
  @JsonKey(name: "page")
  late int page;

  @JsonKey(name: "per_page")
  late int perPage;

  @JsonKey(name: "total")
  late int total;

  @JsonKey(name: "total_pages")
  late int totalPAges;

  @JsonKey(name: "data")
  late List<User> usersList;

  UsersList();

  factory UsersList.fromJson(Map<String, dynamic> json) => _$UsersListFromJson(json);
   Map<String, dynamic> toJson() => _$UsersListToJson(this);

}