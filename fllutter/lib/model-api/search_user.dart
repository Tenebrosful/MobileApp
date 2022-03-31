import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/services.dart' show rootBundle;

part 'search_user.s.dart';

@JsonSerializable()
class Search_user {
  Search_user({
    required this.id,
    required this.username,
  });

  factory Search_user.fromJson(Map<String?, dynamic> json) =>
      _$SearchFromJson(json);
  Map<String?, dynamic> toJson() => _$SearchToJson(this);

  final String? id;
  final String? username;
}

@JsonSerializable()
class Search_users {
  Search_users({
    required this.users,
    required this.count,
  });

  factory Search_users.fromJson(Map<String?, dynamic> json) =>
      _$SearchsFromJson(json);
  Map<String?, dynamic> toJson() => _$SearchsToJson(this);

  final List<Search_user> users;
  final int count;
}

Future<Search_users> fetchSearchUser(String req, String token) async {
  final response = await http.get(
    Uri.parse(
        'http://docketu.iutnc.univ-lorraine.fr:62461/api/user/autocomplete?q=' +
            req),
    headers: <String, String>{
      'Authorization': token,
    },
  );

  if (response.statusCode == 200) {
    var res = json.decode(response.body);

    return Search_users.fromJson(res);
  } else {
    print(response.body);
    throw Exception('Failed to load user');
  }
}
