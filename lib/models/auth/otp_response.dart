// To parse this JSON data, do
//
//     final otpData = otpDataFromJson(jsonString);

import 'dart:convert';

OtpDataResponse otpDataFromJson(String str) =>
    OtpDataResponse.fromJson(json.decode(str));

String otpDataToJson(OtpDataResponse data) => json.encode(data.toJson());

class OtpDataResponse {
  OtpDataResponse({
    required this.success,
    required this.message,
  });

  bool success;
  String message;

  factory OtpDataResponse.fromJson(Map<String, dynamic> json) =>
      OtpDataResponse(
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
      };
}
