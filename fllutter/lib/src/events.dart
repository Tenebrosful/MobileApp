import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
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
  final String address;
  final double lat;
  final double long;
}

@JsonSerializable()
class Event {
  Event({
    required this.coords,
    required this.date,
    required this.description,
    required this.id,
    required this.owner_id,
    required this.title,
  });

  factory Event.fromJson(Map<String?, dynamic> json) => _$EventFromJson(json);
  Map<String?, dynamic> toJson() => _$EventToJson(this);

  final LatLng coords;
  final String? date;
  final String? description;
  final String? id;
  final String? owner_id;
  final String? title;
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
