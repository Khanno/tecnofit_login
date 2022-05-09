part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class EditProfileEvent extends ProfileEvent {}

class SaveNewProfileEvent extends ProfileEvent {
  final UserModel userData;

  SaveNewProfileEvent({required this.userData});
}

class AddPhotoToStateEvent extends ProfileEvent {
  final Uint8List base64;
  AddPhotoToStateEvent({required this.base64});
}

class CancelUpdateEvent extends ProfileEvent {}
