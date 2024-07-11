import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(
  explicitToJson: true,
  createToJson: true,
  fieldRename: FieldRename.snake,
)
class Customer {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? gender;
  String? prefixId;
  String? phoneNo;
  String? idCard;
  String? bigcard;
  String? profilePicture;
  String? birthDay;
  String? birthMonth;
  String? birthYear;
  String? facebookId;
  String? language;
  String? bigWallet;
  String? mappingType;
  bool? isVerifyBigcard;

  Customer({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gender,
    required this.prefixId,
    required this.phoneNo,
    required this.idCard,
    required this.bigcard,
    required this.profilePicture,
    required this.birthDay,
    required this.birthMonth,
    required this.birthYear,
    required this.facebookId,
    required this.language,
    required this.bigWallet,
    required this.mappingType,
    this.isVerifyBigcard = false,
  });



  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    firstName= json['first_name'] as String;
    lastName= json['last_name'] as String;
    email= json['email'] as String;
    gender= json['gender'] as String?;
    prefixId= json['prefix_id'] as String?;
    phoneNo= json['phone_no'] as String?;
    idCard= json['id_card'] as String?;
    bigcard= json['bigcard'] as String?;
    profilePicture= json['profile_picture'] as String?;
    birthDay= json['birth_day'] as String?;
    birthMonth= json['birth_month'] as String?;
    birthYear= json['birth_year'] as String?;
    facebookId= json['facebook_id'] as String?;
    language= json['language'] as String;
    bigWallet= json['big_wallet'] as String?;
    mappingType= json['mapping_type'] as String?;
    isVerifyBigcard= json['is_verify_bigcard'] as bool? ?? false;
  }
  

  // Map<String, dynamic> toJson() => <String, dynamic>{
  //   'id': id,
  //   'first_name': firstName,
  //   'last_name': lastName,
  //   'email': email,
  //   'gender': gender,
  //   'prefix_id': prefixId,
  //   'phone_no': phoneNo,
  //   'id_card': idCard,
  //   'bigcard': bigcard,
  //   'profile_picture': profilePicture,
  //   'birth_day': birthDay,
  //   'birth_month': birthMonth,
  //   'birth_year': birthYear,
  //   'facebook_id': facebookId,
  //   'language': language,
  //   'big_wallet': bigWallet,
  //   'mapping_type': mappingType,
  //   'is_verify_bigcard': isVerifyBigcard,
  // };
}
