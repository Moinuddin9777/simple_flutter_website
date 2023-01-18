// import 'dart:async';

// import 'package:bloc_playground/models/auth/get_otp_response.dart';
// import 'package:bloc_playground/models/auth/login_response.dart';
// import 'package:bloc_playground/models/auth/otp_response.dart';
// import 'package:bloc_playground/utils/constants.dart';
// import 'package:dio/dio.dart';

// class AuthServices {
//   /// PUT call to get otp
//   static Future<GetOtpResponse> getOtp(String phoneNumber) async {
//     try {
//       var dio = Dio();
//       var response = await dio.put(
//         '${AppConstants.fragUrl}customers/sendotp',
//         data: {"phone": phoneNumber, "veriType": 'phone'},
//       );
//       return GetOtpResponse.fromJson(response.data);
//     } catch (err) {
//       return GetOtpResponse(success: false, message: err.toString());
//     }
//   }

//   ///  POST call to login and get the token
//   static Future<LoginResponse> loginWithMobile(
//       String number, String otp) async {
//     try {
//       var dio = Dio();
//       var response = await dio.post("${AppConstants.fragUrl}customer-login",
//           data: {"phone": number, "otp": otp, "veriType": "phone"});
//       var searchResult = LoginResponse.fromJson(response.data);

//       return searchResult;
//     } catch (e) {
//       return LoginResponse(isSuccess: false, message: e.toString(), data: '');
//     }
//   }

//   /// Verification call
//   /// may not be used

//   static Future<OtpDataResponse> phoneVerification(String number) async {
//     try {
//       var dio = Dio();
//       var response = await dio.put(
//         '${AppConstants.fragUrl}customers/verify-phone',
//         data: {
//           "phone": number,
//         },
//       );
//       return OtpDataResponse.fromJson(response.data);
//     } catch (err) {
//       return OtpDataResponse(success: false, message: err.toString());
//     }
//   }
// }
