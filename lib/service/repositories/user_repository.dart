import 'package:dio/dio.dart';
import 'package:tecnofit_login/models/user_model.dart';

class UserRepository {
  final Dio dio;
  UserRepository({required this.dio});

  Future<UserModel> getUserInfo() async {
    try {
      final Response response = await dio.get('/api/users/2');
      return UserModel.fromResponseMap(response.data);
    } on DioError catch (e, stackTrace) {
      rethrow;
    }
  }
}