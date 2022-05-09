part of 'login_bloc.dart';

@immutable
class LoginEvent {}

class SendInformationToApiEvent extends LoginEvent {
  final String userEmail;
  final String userPassword;

  SendInformationToApiEvent({required this.userEmail, required this.userPassword});
}
