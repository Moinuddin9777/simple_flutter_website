import 'dart:convert';

class LoginResponse {
  LoginResponse({
    required this.isSuccess,
    required this.message,
    this.data,
  });

  bool isSuccess;
  String message;
  String? data;

  factory LoginResponse.fromRawJson(String str) =>
      LoginResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        isSuccess: json["success"],
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "success": isSuccess,
        "message": message,
        "data": data,
      };
}
