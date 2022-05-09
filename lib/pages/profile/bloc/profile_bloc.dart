import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tecnofit_login/models/user_model.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<EditProfileEvent>((event, emit) => emit(EditingProfileState()));
    on<SaveNewProfileEvent>((event, emit) => emit(SavingProfileState(userData: event.userData)));
    on<CancelUpdateEvent>((event, emit) => emit(ProfileState()));
    on<AddPhotoToStateEvent>((event, emit) => emit(EditingProfileState(base64: event.base64)));
  }
}
