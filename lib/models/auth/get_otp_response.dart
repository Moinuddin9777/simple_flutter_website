// To parse this JSON data, do
//
//     final getOtpResponse = getOtpResponseFromJson(jsonString);

import 'dart:convert';

GetOtpResponse getOtpResponseFromJson(String str) =>
    GetOtpResponse.fromJson(json.decode(str));

String getOtpResponseToJson(GetOtpResponse data) => json.encode(data.toJson());

class GetOtpResponse {
  GetOtpResponse({
    required this.success,
    required this.message,
    this.data,
  });

  bool success;
  String message;
  String? data;

  factory GetOtpResponse.fromJson(Map<String, dynamic> json) => GetOtpResponse(
        success: json["success"],
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data,
      };
}
