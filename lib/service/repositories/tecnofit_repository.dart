import 'package:dio/dio.dart';
import 'package:tecnofit_login/service/repositories/regres_repository.dart';
import 'package:tecnofit_login/service/repositories/user_repository.dart';

class TecnofitRepository {
  late Dio _dio;
  late RegresRepository _regresRepository;
  late UserRepository _userRepository;

  get dio => _dio;
  get regresRepository => _regresRepository;
  get userRepository => _userRepository;

  static TecnofitRepository? _singleton;

  TecnofitRepository() {
    if(_singleton == null) {
      BaseOptions options = BaseOptions(baseUrl: 'https://reqres.in', headers: {'Content-Type': 'application/json'});
      _dio = Dio(options);
      _regresRepository = RegresRepository(dio: _dio);
      _userRepository = UserRepository(dio: _dio);
    }
  }
  
  static get instance => _singleton;
}