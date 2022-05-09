
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tecnofit_login/models/user_model.dart';
import 'package:tecnofit_login/service/user_service.dart';
import 'package:tecnofit_login/widgets/toast/toast_without_context.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserService userService;

  UserBloc({required this.userService}) : super(UserInitial()) {
    on<GetUserInformation>((event, emit) => _getUserInformation(event, emit));
    on<UpdateUserInformation>((event, emit) => _updateUserInformation(event, emit));
  }

  void _getUserInformation(GetUserInformation event, Emitter<UserState> emit) async {
    emit(LoadingState());
    try {
      final UserModel userData = await userService.getUserInfo();
      emit(ReadyUserState(user: userData));
    } on DioError catch (e) {
      showToastWithoutContext(message: e.response!.data['error']);
    }
  }

  void _updateUserInformation(UpdateUserInformation event, Emitter<UserState> emit) {
    emit(LoadingState());
    emit(ReadyUserState(user: event.userData));
  }
}
