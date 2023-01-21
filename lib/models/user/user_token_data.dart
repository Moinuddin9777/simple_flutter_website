// To parse required this JSON data, do
//
//     final userTokenData = userTokenDataFromJson(jsonString);

import 'dart:convert';

//import 'package:fraghill/models/entities/user/user_data.dart';

UserTokenData userTokenDataFromJson(String str) =>
    UserTokenData.fromJson(json.decode(str));

String userTokenDataToJson(UserTokenData data) => json.encode(data.toJson());

class UserTokenData {
  UserTokenData({
    required this.name,
    required this.phone,
    this.password,
    required this.email,
    required this.countryCode,
    required this.dateOfBirth,
    this.image,
    required this.gender,
    //this.address,
    required this.referralCode,
    required this.isEnabled,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.iat,
    required this.exp,
  });

  String name;
  String phone;
  String? password;
  String email;
  String countryCode;
  DateTime dateOfBirth;
  String? image;
  String gender;
  //Address? address;
  String referralCode;
  bool isEnabled;
  bool isDeleted;
  DateTime createdAt;
  DateTime updatedAt;
  String id;
  int iat;
  int exp;

  factory UserTokenData.fromJson(Map<String, dynamic> json) => UserTokenData(
        name: json["name"],
        phone: json["phone"],
        password: json["password"],
        email: json["email"],
        countryCode: json["countryCode"],
        dateOfBirth: DateTime.parse(json["dateOfBirth"]),
        image: json["image"],
        gender: json["gender"],
        // address:
        //     json["address"] == null ? null : Address.fromJson(json["address"]),
        referralCode: json["referralCode"],
        isEnabled: json["isEnabled"],
        isDeleted: json["isDeleted"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        id: json["id"],
        iat: json["iat"],
        exp: json["exp"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "phone": phone,
        "password": password,
        "email": email,
        "countryCode": countryCode,
        "dateOfBirth": dateOfBirth.toIso8601String(),
        "image": image,
        "gender": gender,
        //"address": address?.toJson(),
        "referralCode": referralCode,
        "isEnabled": isEnabled,
        "isDeleted": isDeleted,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "id": id,
        "iat": iat,
        "exp": exp,
      };
}
