import 'package:dio/dio.dart';
import 'package:tecnofit_login/service/repositories/regres_repository.dart';

class TecnofitRepository {
  late Dio _dio;
  late RegresRepository _regresRepository;

  get dio => _dio;
  get regresRepository => _regresRepository;

  static TecnofitRepository? _singleton;

  TecnofitRepository() {
    if(_singleton == null) {
      BaseOptions options = BaseOptions(baseUrl: 'https://regres.in');
      _dio = Dio(options);
    }
  }
  
  static get instance => _singleton;
}