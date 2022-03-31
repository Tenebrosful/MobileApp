// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Search_user _$SearchFromJson(Map<String?, dynamic> json) => Search_user(
      id: json['id'],
      username: json['username'],
    );

Map<String?, dynamic> _$SearchToJson(Search_user instance) =>
    <String?, dynamic>{
      'id': instance.id,
      'username': instance.username,
    };

Search_users _$SearchsFromJson(Map<String?, dynamic> json) => Search_users(
      users: (json['users'] as List<dynamic>)
          .map((e) => Search_user.fromJson(e as Map<String?, dynamic>))
          .toList(),
      count: (json['count'] as int),
    );

Map<String?, dynamic> _$SearchsToJson(Search_users instance) =>
    <String?, dynamic>{
      'users': instance.users,
      'count': instance.count,
    };
