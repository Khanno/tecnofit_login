part of 'profile_bloc.dart';

class ProfileState {}

class EditingProfileState extends ProfileState {
  final Uint8List? base64;
  EditingProfileState({this.base64});
}

class SavingProfileState extends ProfileState {
  final UserModel userData;
  SavingProfileState({required this.userData});
}

class ProfileInitial extends ProfileState {}
