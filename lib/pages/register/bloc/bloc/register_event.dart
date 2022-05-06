part of 'register_bloc.dart';

class RegisterEvent {}

class SendInformationToApiEvent extends RegisterEvent {
  final String userEmail;
  final String userPassword;

  SendInformationToApiEvent({required this.userEmail, required this.userPassword});
}
