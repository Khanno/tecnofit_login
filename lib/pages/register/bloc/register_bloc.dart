import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tecnofit_login/models/new_user_model.dart';
import 'package:tecnofit_login/models/new_user_response.dart';
import 'package:tecnofit_login/service/regres_service.dart';
import 'package:tecnofit_login/widgets/toast/toast_without_context.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegresService regresService;
  
  RegisterBloc({required this.regresService}) : super(RegisterInitial()) {
    on<SendInformationToApiEvent>((event, emit) => _sendInformationToApiEvent(event, emit));
  }

  void _sendInformationToApiEvent(SendInformationToApiEvent event, Emitter<RegisterState> emit) async {
    emit(LoadingRegisterState(email: state.email, password: state.password, isLoading: true));
    try {
      final NewUserModel userDetails = NewUserModel(userEmail: event.userEmail, userPassword: event.userPassword);
      final NewUserResponse? newUserResponse = await regresService.registerNewUser(userDetails: userDetails);
      emit(SuccessRegisterState(id: newUserResponse!.id, token: newUserResponse.token));
    } on DioError catch (e, stackTrace) {
      showToastWithoutContext(message: e.response!.data['error']);
      emit(RegisterState(email: state.email, password: state.password, isLoading: false));
    }
  }
}
