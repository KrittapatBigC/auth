import 'package:json_annotation/json_annotation.dart';


@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class Auth {
  String? token;
  String? username;

  Auth(
      {required this.token,
        required this.username});


  Auth.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    username = json['username'];
  }

}
