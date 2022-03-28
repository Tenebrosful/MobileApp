// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Author _$AuthorFromJson(Map<String, dynamic> json) => Author(
    createdAt: json['createdAt'],
    id: json['id'],
    updatedAt: json['updatedAt'],
    username: json['username']);

Map<String, dynamic> _$AuthorToJson(Author instance) => <String, dynamic>{
      'createdAt': instance.createdAt,
      'id': instance.id,
      'updatedAt': instance.updatedAt,
      'username': instance.username,
    };

Comment _$CommentFromJson(Map<String?, dynamic> json) => Comment(
      author_id: json['author_id'],
      createdAt: json['createdAt'],
      event_id: json['event_id'],
      id: json['id'],
      message: json['message'],
      updatedAt: json['updatedAt'],
      author: Author.fromJson(json['author'] as Map<String, dynamic>),
    );

Map<String?, dynamic> _$CommentToJson(Comment instance) => <String?, dynamic>{
      'author_id': instance.author_id,
      'createdAt': instance.createdAt,
      'event_id': instance.event_id,
      'id': instance.id,
      'message': instance.message,
      'updatedAt': instance.updatedAt,
      'author': instance.author,
    };

Comments _$CommentsFromJson(Map<String?, dynamic> json) => Comments(
      comments: (json['comments'] as List<dynamic>)
          .map((e) => Comment.fromJson(e as Map<String?, dynamic>))
          .toList(),
      count: (json['count'] as int),
    );

Map<String?, dynamic> _$CommentsToJson(Comments instance) => <String?, dynamic>{
      'comments': instance.comments,
      'count': instance.count,
    };
