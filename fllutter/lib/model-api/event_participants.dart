import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
part 'event_participants.e.dart';

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
class Participants {
  Participants({
    required this.participants,
    required this.count,
  });

  factory Participants.fromJson(Map<String?, dynamic> json) =>
      _$ParticipantsFromJson(json);
  Map<String?, dynamic> toJson() => _$ParticipantsToJson(this);

  final List<Participant> participants;
  final int count;
}

Future<Participants> fetchEventParticipants(String token, String id) async {
  final response = await http.get(
      Uri.parse(
          'http://docketu.iutnc.univ-lorraine.fr:62461/api/event/${id}/participants'),
      headers: <String, String>{'authorization': token});

  if (response.statusCode == 200) {
    var res = json.decode(response.body);
    return Participants.fromJson(res);
  } else {
    throw Exception('Failed to load event');
  }
}
