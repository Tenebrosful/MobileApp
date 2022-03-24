import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
part 'participants.p.dart';

@JsonSerializable()
class LatLng {
  LatLng({
    required this.address,
    required this.lat,
    required this.long,
  });

  factory LatLng.fromJson(Map<String, dynamic> json) => _$LatLngFromJson(json);
  Map<String, dynamic> toJson() => _$LatLngToJson(this);
  final String address;
  final double lat;
  final double long;
}

@JsonSerializable()
class Participant {
  Participant({
    required this.comeToEvent,
    required this.createdAt,
    required this.id,
    required this.updatedAt,
    required this.username,
  });

  factory Participant.fromJson(Map<String?, dynamic> json) =>
      _$ParticipantFromJson(json);
  Map<String?, dynamic> toJson() => _$ParticipantToJson(this);

  final bool comeToEvent;
  final String? createdAt;
  final String? id;
  final String? updatedAt;
  final String? username;
}

@JsonSerializable()
class Event {
  Event(
      {required this.coords,
      required this.createdAt,
      required this.date,
      required this.description,
      required this.id,
      required this.mail,
      required this.owner_id,
      required this.title,
      required this.updatedAt,
      required this.participants,
      required this.comingParticipant,
      required this.totalParticipant});

  factory Event.fromJson(Map<String?, dynamic> json) => _$EventFromJson(json);
  Map<String?, dynamic> toJson() => _$EventToJson(this);

  final LatLng coords;
  final String? createdAt;
  final String? date;
  final String? description;
  final String? id;
  final String? mail;
  final String? owner_id;
  final String? title;
  final String? updatedAt;
  final List<Participant> participants;
  final int? comingParticipant;
  final int? totalParticipant;
}

@JsonSerializable()
class Events {
  Events({
    required this.events,
    required this.count,
  });

  factory Events.fromJson(Map<String?, dynamic> json) => _$EventsFromJson(json);
  Map<String?, dynamic> toJson() => _$EventsToJson(this);

  final List<Event> events;
  final int count;
}

Future<Events> fetchParticipant() async {
  final response = await http.get(Uri.parse(
      'http://docketu.iutnc.univ-lorraine.fr:62460/api/event?participants=true'));

  if (response.statusCode == 200) {
    var res = json.decode(response.body);

    return Events.fromJson(res);
  } else {
    throw Exception('Failed to load event');
  }
}
