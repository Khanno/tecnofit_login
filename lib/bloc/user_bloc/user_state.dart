part of 'user_bloc.dart';

class UserState {}

class ReadyUserState extends UserState {
  final UserModel? user;
  ReadyUserState({this.user});
}

class LoadingState extends UserState {
  final UserModel? user;
  LoadingState({this.user});
}

class UserInitial extends UserState {}
