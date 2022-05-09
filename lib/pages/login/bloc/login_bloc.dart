import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tecnofit_login/models/login_model.dart';
import 'package:tecnofit_login/service/regres_service.dart';
import 'package:tecnofit_login/widgets/toast/toast_without_context.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final RegresService regresService;
  LoginBloc({required this.regresService}) : super(LoginInitial(isLoading: false)) {
    on<SendInformationToApiEvent>((event, emit) => _sendInformationToApiEvent(event, emit));
  }

  void _sendInformationToApiEvent(SendInformationToApiEvent event, Emitter<LoginState> emit) async {
    emit(LoginState(
      email: event.userEmail,
      password: event.userPassword,
      isLoading: true,
    ));
    try {
      final LoginModel loginModel = LoginModel(
        email: event.userEmail,
        password: event.userPassword,
      );
      final String? token = await regresService.loginWithEmail(loginModel: loginModel);
      emit(SuccessLoginState(token: token as String));
    } on DioError catch (e) {
      showToastWithoutContext(message: e.response!.data['error']);
      emit(LoginState(
        email: state.email,
        password: state.password,
        isLoading: false,
      ));
    }
  }
}
