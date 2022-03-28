// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';
// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'],
      isAdmin: json['isAdmin'] as bool,
      token: json['token'],
      username: json['username'],
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'isAdmin': instance.isAdmin,
      'token': instance.token,
      'username': instance.username,
    };

Auth _$AuthFromJson(Map<String?, dynamic> json) => Auth(
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String?, dynamic> _$AuthToJson(Auth instance) => <String?, dynamic>{
      'user': instance.user,
    };
