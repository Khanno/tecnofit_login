part of 'login_bloc.dart';

@immutable
class LoginState {
  final String? email;
  final String? password;
  final bool? isLoading;

  LoginState({this.email, this.password, this.isLoading});
}

class LoginInitial extends LoginState {
  final bool isLoading;
  LoginInitial({required this.isLoading});
}

class SuccessLoginState extends LoginState {
  final String token;
  SuccessLoginState({required this.token});
}
