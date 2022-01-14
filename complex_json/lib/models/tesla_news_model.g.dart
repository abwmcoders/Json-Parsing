// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tesla_news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeslaNews _$TeslaNewsFromJson(Map<String, dynamic> json) => TeslaNews()
  ..status = json['status'] as String
  ..totalResults = json['totalResults'] as int
  ..articleClass = (json['articles'] as List<dynamic>)
      .map((e) => ArticleClass.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$TeslaNewsToJson(TeslaNews instance) => <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.totalResults,
      'articles': instance.articleClass,
    };
