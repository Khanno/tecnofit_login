import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tecnofit_login/bloc/user_bloc/user_bloc.dart';
import 'package:tecnofit_login/constants/widget_keys.dart';
import 'package:tecnofit_login/pages/cover/cover_page.dart';
import 'package:tecnofit_login/pages/dashboard/dashboard_page.dart';
import 'package:tecnofit_login/pages/login/login_page.dart';
import 'package:tecnofit_login/pages/profile/profile_page.dart';
import 'package:tecnofit_login/pages/register/register_page.dart';
import 'package:tecnofit_login/service/regres_service.dart';
import 'package:tecnofit_login/service/repositories/tecnofit_repository.dart';
import 'package:tecnofit_login/service/user_service.dart';
import 'package:tecnofit_login/style/custom_theme.dart';

void main() {
  TecnofitRepository tecnofitRepository = TecnofitRepository();
  RegresService regresService = RegresService(regresRepository: tecnofitRepository.regresRepository);
  UserService userService = UserService(userRepository: tecnofitRepository.userRepository);
  runApp(TecnoLogin());
}

class TecnoLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => UserBloc(userService: UserService.instance))
      ],
      child: MaterialApp(
        key: mainKey,
        debugShowCheckedModeBanner: false,
        theme: getTheme(),
        initialRoute: '/',
        routes: {
          '/': (context) => CoverPage(),
          '/register': (context) => RegisterPage(),
          '/login': (context) => LoginPage(),
          '/dashboard': (context) => DashboardPage(),
          '/profile': (context) => ProfilePage(),
        },
      ),
    );
  }
}
