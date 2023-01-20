class AuthEvent {}

// tro check on app start, if user is logged in or not
class AppStartedEvent extends AuthEvent {}

// user requests OTP
class LoginAttemptEvent extends AuthEvent {
  final String phoneNumber;
  LoginAttemptEvent(this.phoneNumber);
}

// user logs in
class LogInEvent extends AuthEvent {
  final String phoneNumber;
  final String otp;
  LogInEvent(this.phoneNumber, this.otp);
}

// user is Logged in
class LoggedIn extends AuthEvent {}

// user logs out
class LoggedOutEvent extends AuthEvent {}
