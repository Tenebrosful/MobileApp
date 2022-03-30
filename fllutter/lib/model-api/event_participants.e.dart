// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_participants.dart';
// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Participants _$ParticipantsFromJson(Map<String?, dynamic> json) => Participants(
      participants: (json['participants'] as List<dynamic>)
          .map((e) => Participant.fromJson(e as Map<String?, dynamic>))
          .toList(),
      count: (json['count'] as int),
    );

Map<String?, dynamic> _$ParticipantsToJson(Participants instance) =>
    <String?, dynamic>{
      'participants': instance.participants,
      'count': instance.count,
    };

Participant _$ParticipantFromJson(Map<String?, dynamic> json) => Participant(
      comeToEvent: json['comeToEvent'],
      createdAt: json['createdAt'],
      id: json['id'],
      updatedAt: json['updatedAt'],
      username: json['username'],
    );

Map<String?, dynamic> _$ParticipantToJson(Participant instance) =>
    <String?, dynamic>{
      'comeToEvent': instance.comeToEvent,
      'createdAt': instance.createdAt,
      'id': instance.id,
      'updatedAt': instance.updatedAt,
      'username': instance.username,
    };
