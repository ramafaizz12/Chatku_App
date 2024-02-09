// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datachat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataChat _$DataChatFromJson(Map<String, dynamic> json) => DataChat(
      message: json['message'] as String?,
      senderemail: json['senderemail'] as String?,
      receiverid: json['receiverid'] as String?,
      senderid: json['senderid'] as String?,
    );

Map<String, dynamic> _$DataChatToJson(DataChat instance) => <String, dynamic>{
      'receiverid': instance.receiverid,
      'senderemail': instance.senderemail,
      'senderid': instance.senderid,
      'message': instance.message,
    };
