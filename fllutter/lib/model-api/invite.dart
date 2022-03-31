import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> inviteParticipant(
    String token, String comeToEvent, String event_id, String user_id) async {
  var response = await http.post(
      Uri.parse('http://docketu.iutnc.univ-lorraine.fr:62461/api/event/' +
          event_id +
          '/invite-event/' +
          user_id),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Access-Control-Allow-Origin": "*",
        'authorization': token,
        "user-agent":
            "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.83 Safari/537.36"
      },
      body: {
        "comeToEvent": comeToEvent
      });
  if (response.statusCode == 201) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to post invite');
  }
}
