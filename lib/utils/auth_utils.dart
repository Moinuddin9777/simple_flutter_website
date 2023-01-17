//import 'package:jwt_decode/jwt_decode.dart';
//import 'package:shared_preferences/shared_preferences.dart';

/// WILL BE USED FOR LOGIN ///

// class AuthUtils {
//   static const token = "bloc_playground";
//   static Future<bool> saveToken(String newToken) async {
//     if (newToken == null) return false;
//     var prefs = await SharedPreferences.getInstance();
//     await prefs.setString(token, newToken);
//     return true;
//   }

//   static Future<bool> deleteToken() async {
//     var prefs = await SharedPreferences.getInstance();
//     if (prefs.containsKey(token)) {
//       return await prefs.remove(token);
//     }
//     return true;
//   }

//   static Future<String?> getToken() async {
//     var prefs = await SharedPreferences.getInstance();
//     if (prefs.containsKey(token)) {
//       String? tokenData = prefs.getString(token);
//       if (tokenData != null) {
//         return tokenData;
//       }
//     }
//     return null;
//   }

//   static Future<UserTokenData?> decodeToken() async {
//     var token = await getToken();
//     if (token != null) {
//       var payload = Jwt.parseJwt(token);
//       return UserTokenData.fromJson(payload);
//     } else {
//       return null;
//     }
//   }
// }
