import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tecnofit_login/bloc/user_bloc/user_bloc.dart';
import 'package:tecnofit_login/helper/media_query_helper.dart';
import 'package:tecnofit_login/pages/dashboard/widgets/dashboard_drawer_widget.dart';
import 'package:tecnofit_login/style/custom_text_styles.dart';
import 'package:tecnofit_login/widgets/app_bar/app_bar_widget.dart';
import 'package:tecnofit_login/widgets/indicators/circular_progress_indicator_widget.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, UserState state) {
        return LayoutBuilder(builder: (context, BoxConstraints constraints) {
          return Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            appBar: AppBarWidget(),
            drawer: state.runtimeType == ReadyUserState
                ? DashboardDrawerWidget(
                    constraints: constraints,
                  )
                : Container(),
            body: SafeArea(
              child: Builder(
                builder: (context) {
                  switch (state.runtimeType) {
                    case ReadyUserState:
                      return Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 15),
                            Image.asset('assets/images/tecnofit_logo.png', scale: 3.5),
                            const SizedBox(height: 15),
                            Text('Bem vindo(a) ao TecnoLogin', style: DashboardPageTextStyle(context: context).style()),
                            const SizedBox(height: 15),
                            Text('Para navegar pela aplicação, utilize o menu lateral.',
                                style: DashboardPageTextStyle(context: context).style(), textAlign: TextAlign.center),
                            const SizedBox(height: 15),
                            Text(
                                'Nessa aplicação é possível atualizar os dados cadastrados, e tambem a foto do usuário.',
                                style: DashboardPageTextStyle(context: context).style(),
                                textAlign: TextAlign.center)
                          ],
                        ),
                      );
                    case LoadingState:
                    default:
                      return Center(
                        child: CircularProgressIndicatorWidget(),
                      );
                  }
                },
              ),
            ),
          );
        });
      },
    );
  }
}
