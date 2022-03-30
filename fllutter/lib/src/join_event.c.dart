// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'join_event.dart';
// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JoinEvent _$JoinEventFromJson(Map<String?, dynamic> json) => JoinEvent(
    username: json['username'],
    user_id: json['user_id'],
    event_id: json['event_id'],
    comeToEvent: json['comeToEvent']);
Map<String?, dynamic> _$JoinEventToJson(JoinEvent instance) =>
    <String?, dynamic>{
      'username': instance.username,
      'user_id': instance.user_id,
      'event_id': instance.event_id,
      'comeToEvent': instance.comeToEvent,
    };
