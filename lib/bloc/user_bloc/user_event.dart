part of 'user_bloc.dart';

class UserEvent {}

class GetUserInformation extends UserEvent {}

class UpdateUserInformation extends UserEvent {
  final UserModel userData;
  UpdateUserInformation({required this.userData});
}
