import 'package:tecnofit_login/models/user_model.dart';
import 'package:tecnofit_login/service/repositories/user_repository.dart';

class UserService {
  static UserService? _singleton;
  static get instance => _singleton;

  final UserRepository userRepository;

  UserService({required this.userRepository}) {
    if (_singleton == null) {
      _singleton = this;
    } else {
      throw Exception("UserService already created. Use .instance instead");
    }
  }

  Future<UserModel> getUserInfo() async {
    final UserModel userModel = await userRepository.getUserInfo();
    return userModel;
  }
}
