import 'package:dio/dio.dart';
import 'package:tecnofit_login/models/login_model.dart';
import 'package:tecnofit_login/models/new_user_model.dart';
import 'package:tecnofit_login/models/new_user_response.dart';
import 'package:tecnofit_login/service/repositories/regres_repository.dart';

class RegresService {
  static RegresService? _singleton;
  static get instance => _singleton;

  final RegresRepository regresRepository;

  RegresService({required this.regresRepository}) {
    if(_singleton == null) {
      _singleton = this;
    } else {
      throw Exception("RegresService already created. Use .instance instead");
    }
  }

  Future<NewUserResponse?> registerNewUser({required NewUserModel userDetails}) async {
    final NewUserResponse? response = await regresRepository.registerNewUser(userDetails: userDetails);
    return response;
  }

  Future<String?> loginWithEmail({required LoginModel loginModel}) async {
    final String? response = await regresRepository.loginWithEmail(loginModel: loginModel);
    return response;
  }
}