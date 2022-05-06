part of 'register_bloc.dart';

class RegisterState {
  final String? email;
  final String? password;
  final bool? isLoading;
  final int? id;
  final String? token;

  RegisterState({
    this.email,
    this.password,
    this.isLoading,
    this.id,
    this.token,
  });
}

class RegisterInitial extends RegisterState {
  final bool? isLoading;
  RegisterInitial({this.isLoading = false});
}

class LoadingRegisterState extends RegisterState {
  final String? email;
  final String? password;
  final bool? isLoading;

  LoadingRegisterState({
    required this.email,
    required this.password,
    required this.isLoading,
  });
}

class SuccessRegisterState extends RegisterState {
  final int id;
  final String token;

  SuccessRegisterState({required this.id, required this.token});
}
