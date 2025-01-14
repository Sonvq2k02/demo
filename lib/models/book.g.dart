// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookImpl _$$BookImplFromJson(Map<String, dynamic> json) => _$BookImpl(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      subTitle: json['subTitle'] as String?,
      author: json['author'] as String?,
      image: json['image'] as String?,
      views: (json['views'] as num?)?.toInt(),
      datePublished: json['datePublished'] as String?,
      dateUpdated: json['dateUpdated'] as String?,
      chapterCount: (json['chapterCount'] as num?)?.toInt(),
      latestChapterDate: json['latestChapterDate'] as String?,
      commentsCount: (json['commentsCount'] as num?)?.toInt(),
      content: json['content'] as String?,
      category: json['category'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$BookImplToJson(_$BookImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subTitle': instance.subTitle,
      'author': instance.author,
      'image': instance.image,
      'views': instance.views,
      'datePublished': instance.datePublished,
      'dateUpdated': instance.dateUpdated,
      'chapterCount': instance.chapterCount,
      'latestChapterDate': instance.latestChapterDate,
      'commentsCount': instance.commentsCount,
      'content': instance.content,
      'category': instance.category,
      'status': instance.status,
    };
