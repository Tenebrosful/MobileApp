// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';
// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentSansAuthor _$CommentSansAuthorFromJson(Map<String?, dynamic> json) =>
    CommentSansAuthor(
      createdAt: json['createdAt'],
      author_id: json['author_id'],
      id: json['id'],
      event_id: json['event_id'],
      message: json['message'],
      updatedAt: json['updatedAt'],
    );
Map<String?, dynamic> _$CommentSansAuthorToJson(CommentSansAuthor instance) =>
    <String?, dynamic>{
      'createdAt': instance.createdAt,
      'author_id': instance.author_id,
      'id': instance.id,
      'event_id': instance.event_id,
      'updatedAt': instance.updatedAt,
      'message': instance.message
    };
