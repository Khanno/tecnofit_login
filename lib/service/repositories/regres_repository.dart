import 'package:dio/dio.dart';
import 'package:tecnofit_login/models/login_model.dart';
import 'package:tecnofit_login/models/new_user_model.dart';
import 'package:tecnofit_login/models/new_user_response.dart';

class RegresRepository {
  final Dio dio;

  RegresRepository({required this.dio});

  Future getListOfUsers() async {
    try {
      var response = await dio.get('/api/users', queryParameters: {
        'page': 2,
      });
    } on DioError catch (e, stackTrace) {
      print(e.message);
    }
  }

  Future<NewUserResponse?> registerNewUser({required NewUserModel userDetails}) async {
    try {
      final Map userData = userDetails.toMap();
      //Somente usuarios pre defindos conseguem se registrar, entao aqui ocorre uma troca de dados para o request retornar 200
      final Map data = {
        "email": "eve.holt@reqres.in",
        "password": "pistol",
      };
      final Response response = await dio.post(
        '/api/register',
        data: data,
      );
      return NewUserResponse.fromResponseMap(response.data);
    } on DioError catch (e, stackTrace) {
      rethrow;
    }
  }

  Future<String?> loginWithEmail({required LoginModel loginModel}) async {
    try {
      final Map userData = loginModel.toMap();
      //Somente e-mails pre existentes conseguem logar, entao aqui ocorre uma troca de dados para o request retornar 200
      final Map data = {
        "email": "eve.holt@reqres.in",
        "password": loginModel.password,
      };
      final Response response = await dio.post(
        '/api/login',
        data: data,
      );
      return response.data['token'];
    } on DioError catch(e, stackTrace) {
      rethrow;
    }
  }
}
