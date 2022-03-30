import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
part 'join_event.c.dart';

@JsonSerializable()
class JoinEvent {
  JoinEvent(
      {required this.username,
      required this.event_id,
      required this.user_id,
      required this.comeToEvent});

  factory JoinEvent.fromJson(Map<String?, dynamic> json) =>
      _$JoinEventFromJson(json);
  Map<String?, dynamic> toJson() => _$JoinEventToJson(this);

  final String? username;
  final String? user_id;
  final String? event_id;
  final bool comeToEvent;
}

Future<JoinEvent> joinEvent(String token, String id, bool join) async {
  final response = await http.post(
    Uri.parse(
        'http://docketu.iutnc.univ-lorraine.fr:62461/api/event/${id}/join-event/auth'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      "Access-Control-Allow-Origin": "*",
      "user-agent":
          "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.83 Safari/537.36",
      'authorization': token
    },
    body: jsonEncode(<String, dynamic>{
      "comeToEvent": join,
    }),
  );

  if (response.statusCode == 201) {
    var res = json.decode(response.body);
    return JoinEvent.fromJson(res);
  } else {
    throw Exception('Failed to join event');
  }
}
