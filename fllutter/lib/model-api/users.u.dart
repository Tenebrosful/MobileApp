// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String?, dynamic> json) => User(
      createdAt: json['createdAt'],
      default_event_mail: json['default_event_mail'],
      id: json['id'],
      //last_connexion: json['last_connexion'],
      updatedAt: json['updatedAt'],
      username: json['username'],
    );

Map<String?, dynamic> _$UserToJson(User instance) => <String?, dynamic>{
      'createdAt': instance.createdAt,
      'default_event_mail': instance.default_event_mail,
      'id': instance.id,
      //'last_connexion': instance.last_connexion,
      'updatedAt': instance.updatedAt,
      'username': instance.username,
    };
/*
Users _$ApiFromJson(Map<String?, dynamic> json) => Users(
      users: (json['users'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String?, dynamic>))
          .toList(),
      count: (json['count'] as int),
    );

Map<String?, dynamic> _$ApiToJson(Users instance) => <String?, dynamic>{
      'users': instance.users,
      'count': instance.count,
    };
*/