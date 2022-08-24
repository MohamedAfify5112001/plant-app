part of 'login_cubit.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  ResponseData responseLogin;

  LoginSuccess(this.responseLogin);
}

class LoginError extends LoginState {
  ErrorResponse responseLogin;

  LoginError(this.responseLogin);
}

class GoogleSignInSuccessState extends LoginState {}
