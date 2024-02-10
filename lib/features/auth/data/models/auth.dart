import 'package:json_annotation/json_annotation.dart';

part 'auth.g.dart';

@JsonSerializable()
class DataAuth {
  String? displayName;
  String? email;
  String? uid;

  DataAuth({this.email, this.uid, this.displayName});

  factory DataAuth.fromJson(Map<String, dynamic> data) =>
      _$DataAuthFromJson(data);

  Map<String, dynamic> toJson() => _$DataAuthToJson(this);
}
