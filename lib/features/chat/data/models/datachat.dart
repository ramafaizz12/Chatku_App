import 'package:json_annotation/json_annotation.dart';

part 'datachat.g.dart';

@JsonSerializable()
class DataChat {
  String? receiverid;
  String? senderemail;
  String? senderid;
  String? message;

  DataChat({
    this.message,
    this.senderemail,
    this.receiverid,
    this.senderid,
  });

  factory DataChat.fromJson(Map<String, dynamic> data) =>
      _$DataChatFromJson(data);

  Map<String, dynamic> toJson() => _$DataChatToJson(this);
}
