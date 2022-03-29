import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';
part 'events.e.dart';

@JsonSerializable()
class LatLng {
  LatLng({
    required this.address,
    required this.lat,
    required this.long,
  });

  factory LatLng.fromJson(Map<String, dynamic> json) => _$LatLngFromJson(json);
  Map<String, dynamic> toJson() => _$LatLngToJson(this);
  final String? address;
  final double lat;
  final double long;
}

@JsonSerializable()
class Event {
  Event({
    required this.coords,
    required this.createdAt,
    required this.date,
    required this.description,
    required this.id,
    required this.mail,
    required this.owner_id,
    required this.title,
    required this.updatedAt,
  });

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

/*
Future<Events> fetchEvent() async {
  final response = await http
      .get(Uri.parse('http://docketu.iutnc.univ-lorraine.fr:62460/api/event'));

  if (response.statusCode == 200) {
    var res = json.decode(response.body);

    return Events.fromJson(res);
  } else {
    throw Exception('Failed to load event');
  }
}
*/
Future<Event> createEvent(String? title, String date, String address,
    String desc, double lat, double long, String token, String owner_id) async {
  var uuid = Uuid();
  final response = await http.post(
    Uri.parse('http://docketu.iutnc.univ-lorraine.fr:62461/api/event'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      "Access-Control-Allow-Origin": "*",
      'authorization': token,
      "user-agent":
          "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.83 Safari/537.36"
    },
    body: jsonEncode(<String, dynamic>{
      "id": uuid.v4(),
      "date": date,
      "title": title,
      "description": desc,
      "owner_id": owner_id,
      "coords": {"address": address, "lat": lat, "long": long}
    }),
  );

  if (response.statusCode == 201) {
    var res = json.decode(response.body);

    return Event.fromJson(res);
  } else {
    print(response.body);
    print(address);
    throw Exception('Failed to create event');
  }
}
