// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tesla_articles_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleClass _$ArticleClassFromJson(Map<String, dynamic> json) => ArticleClass()
  ..source = Source.fromJson(json['source'] as Map<String, dynamic>)
  ..author = json['author'] as String
  ..title = json['title'] as String
  ..description = json['description'] as String
  ..url = json['url'] as String
  ..urlToImage = json['urlToImage'] as String
  ..publishedAt = json['publishedAt'] as String
  ..content = json['content'] as String;

Map<String, dynamic> _$ArticleClassToJson(ArticleClass instance) =>
    <String, dynamic>{
      'source': instance.source,
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
      'publishedAt': instance.publishedAt,
      'content': instance.content,
    };
