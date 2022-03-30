// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'self_events.dart';
// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LatLng _$LatLngFromJson(Map<String, dynamic> json) => LatLng(
      address: json['address'],
      lat: (json['lat'] as num).toDouble(),
      long: (json['long'] as num).toDouble(),
    );

Map<String, dynamic> _$LatLngToJson(LatLng instance) => <String, dynamic>{
      'address': instance.address,
      'lat': instance.lat,
      'long': instance.long,
    };

Event _$EventFromJson(Map<String?, dynamic> json) => Event(
      coords: LatLng.fromJson(json['coords'] as Map<String, dynamic>),
      createdAt: json['createdAt'],
      date: json['date'],
      description: json['description'],
      id: json['id'],
      mail: json['mail'],
      owner_id: json['owner_id'],
      title: json['title'],
      updatedAt: json['updatedAt'],
      participants: (json['participants'] as List<dynamic>)
          .map((e) => Participant.fromJson(e as Map<String?, dynamic>))
          .toList(),
      comingParticipant: json['comingParticipant'],
      totalParticipant: json['totalParticipant'],
    );

Map<String?, dynamic> _$EventToJson(Event instance) => <String?, dynamic>{
      'coords': instance.coords,
      'createdAt': instance.createdAt,
      'date': instance.date,
      'description': instance.description,
      'id': instance.id,
      'mail': instance.mail,
      'owner_id': instance.owner_id,
      'title': instance.title,
      'updatedAt': instance.updatedAt,
      'participants': instance.participants,
      'comingParticipant': instance.comingParticipant,
      'totalParticipant': instance.totalParticipant
    };

Events _$EventsFromJson(Map<String?, dynamic> json) => Events(
      events: (json['events'] as List<dynamic>)
          .map((e) => Event.fromJson(e as Map<String?, dynamic>))
          .toList(),
      count: (json['count'] as int),
    );

Map<String?, dynamic> _$EventsToJson(Events instance) => <String?, dynamic>{
      'events': instance.events,
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
