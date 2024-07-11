import 'package:authentication/models/auth.dart';
import 'package:authentication/models/customer.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class Login {
  Auth? auth;
  Customer? customer;

  Login({required this.auth, required this.customer});

  Login.fromJson(Map<String, dynamic> json) {
    auth = Auth.fromJson(json['auth']);
    customer = Customer.fromJson(json['customer']);
  }
}
