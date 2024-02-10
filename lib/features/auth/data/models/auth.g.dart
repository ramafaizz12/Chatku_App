// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataAuth _$DataAuthFromJson(Map<String, dynamic> json) => DataAuth(
      email: json['email'] as String?,
      uid: json['uid'] as String?,
      displayName: json['displayName'] as String?,
    );

Map<String, dynamic> _$DataAuthToJson(DataAuth instance) => <String, dynamic>{
      'displayName': instance.displayName,
      'email': instance.email,
      'uid': instance.uid,
    };
