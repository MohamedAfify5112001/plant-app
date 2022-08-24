part of 'register_cubit.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  ResponseData responseRegister;

  RegisterSuccess(this.responseRegister);
}

class RegisterError extends RegisterState {}
