// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_users_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersList _$UsersListFromJson(Map<String, dynamic> json) => UsersList()
  ..page = json['page'] as int
  ..perPage = json['per_page'] as int
  ..total = json['total'] as int
  ..totalPAges = json['total_pages'] as int
  ..usersList = (json['data'] as List<dynamic>)
      .map((e) => User.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$UsersListToJson(UsersList instance) => <String, dynamic>{
      'page': instance.page,
      'per_page': instance.perPage,
      'total': instance.total,
      'total_pages': instance.totalPAges,
      'data': instance.usersList,
    };
