// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events.dart';

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
      date: json['date'],
      description: json['description'],
      id: json['id'],
      owner_id: json['owner_id'],
      title: json['title'],
    );

Map<String?, dynamic> _$EventToJson(Event instance) => <String?, dynamic>{
      'coords': instance.coords,
      'date': instance.date,
      'description': instance.description,
      'id': instance.id,
      'owner_id': instance.owner_id,
      'title': instance.title,
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
