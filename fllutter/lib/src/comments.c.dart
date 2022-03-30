// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments.dart';
// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Author _$AuthorFromJson(Map<String?, dynamic> json) => Author(
    username: json['username'],
    id: json['id'],
    updatedAt: json['updatedAt'],
    createdAt: json['createdAt']);

Map<String?, dynamic> _$AuthorToJson(Author instance) => <String, dynamic>{
      'username': instance.username,
      'id': instance.id,
      'updatedAt': instance.updatedAt,
      'createdAt': instance.createdAt
    };

Comment _$CommentFromJson(Map<String?, dynamic> json) => Comment(
    createdAt: json['createdAt'],
    author_id: json['author_id'],
    id: json['id'],
    event_id: json['event_id'],
    message: json['message'],
    updatedAt: json['updatedAt'],
    author: Author.fromJson(json['author'] as Map<String?, dynamic>));

Map<String?, dynamic> _$CommentToJson(Comment instance) => <String?, dynamic>{
      'createdAt': instance.createdAt,
      'author_id': instance.author_id,
      'id': instance.id,
      'event_id': instance.event_id,
      'updatedAt': instance.updatedAt,
      'message': instance.message,
      'author': instance.author
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
