import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
part 'auth.a.dart';

@JsonSerializable()
class User {
  User({
    required this.id,
    required this.isAdmin,
    required this.token,
    required this.username,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
  final String id;
  final bool isAdmin;
  final String token;
  final String username;
}

@JsonSerializable()
class Auth {
  Auth({required this.user});

  factory Auth.fromJson(Map<String?, dynamic> json) => _$AuthFromJson(json);
  Map<String?, dynamic> toJson() => _$AuthToJson(this);

  final User user;
}

Future<Auth> logIn(String login, String password) async {
  var response = await http.post(
      Uri.parse('http://docketu.iutnc.univ-lorraine.fr:62461/api/auth/'),
      body: {"login": login, "password": password});
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to get token');
  }
}
