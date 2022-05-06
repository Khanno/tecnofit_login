
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
  }

  void _getUserInformation(GetUserInformation event, Emitter<UserState> emit) async {
    try {
      final UserModel userData = await userService.getUserInfo();
      emit(UserState(user: userData));
    } on DioError catch (e) {
      showToastWithoutContext(message: e.response!.data['error']);
    }
  }
}
