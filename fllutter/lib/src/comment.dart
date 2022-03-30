import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
part 'comment.c.dart';

@JsonSerializable()
class CommentSansAuthor {
  CommentSansAuthor(
      {required this.author_id,
      required this.createdAt,
      required this.event_id,
      required this.id,
      required this.message,
      required this.updatedAt});

  factory CommentSansAuthor.fromJson(Map<String?, dynamic> json) =>
      _$CommentSansAuthorFromJson(json);
  Map<String?, dynamic> toJson() => _$CommentSansAuthorToJson(this);

  final String? createdAt;
  final String? author_id;
  final String? event_id;
  final String? id;
  final String? message;
  final String? updatedAt;
}

Future<CommentSansAuthor> addComment(
    String token, String id, String message) async {
  final response = await http.post(
    Uri.parse(
        'http://docketu.iutnc.univ-lorraine.fr:62461/api/event/${id}/comments'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      "Access-Control-Allow-Origin": "*",
      "user-agent":
          "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.83 Safari/537.36",
      'authorization': token
    },
    body: jsonEncode(<String, dynamic>{
      "message": message,
    }),
  );

  if (response.statusCode == 201) {
    var res = json.decode(response.body);
    print(response.body);
    return CommentSansAuthor.fromJson(res);
  } else {
    print(response.body);
    throw Exception('Failed to add comment');
  }
}
