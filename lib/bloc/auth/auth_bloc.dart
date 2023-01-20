// import 'package:bloc_playground/bloc/auth/auth_event.dart';
// import 'package:bloc_playground/bloc/auth/auth_state.dart';
// import 'package:bloc_playground/models/auth/login_response.dart';
// import 'package:bloc_playground/models/user/user_token_data.dart';
// import 'package:bloc_playground/services/auth/auth_services.dart';
// import 'package:bloc_playground/utils/auth_utils.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:http/http.dart';

// class AuthBloc extends Bloc<AuthEvent, AuthState> {
//   AuthBloc() : super(AuthorizingState()) {
//     on<AppStartedEvent>(checkAuth);
//     on<LoginAttemptEvent>(getOtp);
//     on<LogInEvent>(verifyOtp);
//   }
//   //final AuthServices authServices;
//   Future<void> checkAuth(AppStartedEvent event, Emitter<AuthState> emit) async {
//     String? isLogIn = await AuthUtils.getToken();
//     if (isLogIn != null && isLogIn.isNotEmpty) {
//       UserTokenData? userTokenData = await AuthUtils.decodeToken();
//       emit(
//         AuthenticatedState(userData: userTokenData),
//       );
//     } else {
//       emit(
//         UnAuthenticatedState(),
//       );
//     }
//   }

//   Future<void> getOtp(LoginAttemptEvent event, Emitter<AuthState> emit) async {
//     emit(AuthorizingState());
//     try {
//       var response = await AuthServices.getOtp(event.phoneNumber);
//       //emit(AuthorizingState());
//       if (response.success) {
//         emit(
//           OtpSent(otp: response.data!),
//         );
//       } else {
//         emit(
//           UnAuthenticatedState(),
//         );
//       }
//     } catch (e) {
//       emit(AuthFailedState(e.toString()));
//     }
//   }

//   Future<void> verifyOtp(LogInEvent event, Emitter<AuthState> emit) async {
//     emit(AuthorizingState());
//     late bool isLoggedIn;
//     try {
//       var response =
//           await AuthServices.loginWithMobile(event.phoneNumber, event.otp);
//       if (response.isSuccess) {
//         isLoggedIn = await AuthUtils.saveToken(response.data!);
//       }
//       if (isLoggedIn) {
//         UserTokenData? userTokenData = await AuthUtils.decodeToken();

//         emit(AuthenticatedState(userData: userTokenData));
//       }
//     } catch (e) {
//       emit(AuthFailedState(e.toString()));
//     }
//   }

//   Future<void> logout(LoggedOutEvent event, Emitter<AuthState> emit) async {
//     await AuthUtils.deleteToken();
//     emit(UnAuthenticatedState());
//   }

//   // Future<void> getUserData(LoggedIn event, Emitter<AuthState> emit) async {
//   //   var userData = await AuthUtils.getToken();
//   // }
// }
