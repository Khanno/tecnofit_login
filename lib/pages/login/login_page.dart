import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tecnofit_login/bloc/user_bloc/user_bloc.dart';
import 'package:tecnofit_login/helper/media_query_helper.dart';
import 'package:tecnofit_login/pages/login/bloc/login_bloc.dart';
import 'package:tecnofit_login/service/regres_service.dart';
import 'package:tecnofit_login/style/custom_gradient.dart';
import 'package:tecnofit_login/style/custom_text_styles.dart';
import 'package:tecnofit_login/widgets/animations/fade_in_widget.dart';
import 'package:tecnofit_login/widgets/buttons/main_button_widget.dart';
import 'package:tecnofit_login/widgets/indicators/circular_progress_indicator_widget.dart';
import 'package:tecnofit_login/widgets/inputs/main_text_form_field.dart';

class LoginPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(regresService: RegresService.instance),
      child: Scaffold(
        body: LayoutBuilder(builder: (context, BoxConstraints constraints) {
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: buildGradient(context: context),
            ),
            child: SafeArea(
              child: FadeInWidget(
                child: BlocConsumer<LoginBloc, LoginState>(
                  listener: (context, state) {
                    if(state.runtimeType == SuccessLoginState) {
                      context.read<UserBloc>().add(GetUserInformation());
                      Navigator.pushReplacementNamed(context, '/dashboard');
                    }
                  },
                  builder: (context, state) {
                    switch (state.runtimeType) {
                      case SuccessLoginState:
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: mediaQueryHelper(context: context)),
                          child: Column(
                            children: [
                              Spacer(),
                              SizedBox(height: constraints.maxHeight * 0.05),
                              Text('Login realizado com sucesso!', style: RegisterTextStyles(context: context).style()),
                              SizedBox(height: constraints.maxHeight * 0.05),
                              Text(
                                'Um momento enquanto \ncarregamos suas informações...',
                                style: RegisterTextStyles(context: context).style(),
                                textAlign: TextAlign.center,
                              ),
                              Spacer(),
                              CircularProgressIndicatorWidget(
                                  color: Theme.of(context).colorScheme.primary, strokeWidth: 5.0),
                              SizedBox(height: constraints.maxHeight * 0.10),
                            ],
                          ),
                        );
                      default:
                        return Stack(
                          children: [
                            kIsWeb ? Container() : Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.white,
                                  ),
                                  onPressed: () => Navigator.pushReplacementNamed(context, '/'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: mediaQueryHelper(context: context)),
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    const Spacer(),
                                    SizedBox(height: constraints.maxHeight * 0.05),
                                    Text('Para realizar o login,',
                                        style: LoginTextWidgetTextStyle(context: context).style()),
                                    Text('insira os dados abaixo:',
                                        style: LoginTextWidgetTextStyle(context: context).style()),
                                    SizedBox(height: constraints.maxHeight * 0.05),
                                    MainTextFormFieldWidget(
                                      controller: _emailController,
                                      isEmail: true,
                                      isRequired: true,
                                      label: 'E-mail',
                                    ),
                                    SizedBox(
                                      height: constraints.maxHeight * 0.05,
                                    ),
                                    MainTextFormFieldWidget(
                                      controller: _passwordController,
                                      isPassword: true,
                                      isRequired: true,
                                      label: 'Senha',
                                      textInputAction: TextInputAction.done,
                                    ),
                                    SizedBox(
                                      height: constraints.maxHeight * 0.05,
                                    ),
                                    MainButtonWidget(
                                      text: state.isLoading! ? null : 'Entrar',
                                      child: state.isLoading!
                                          ? CircularProgressIndicatorWidget(
                                              color: Theme.of(context).colorScheme.primary,
                                              strokeWidth: 3.0,
                                              padding: 1.5,
                                            )
                                          : null,
                                      onTap: state.isLoading! ? () {} : () {
                                        if (_formKey.currentState!.validate()) {
                                          context.read<LoginBloc>().add(SendInformationToApiEvent(
                                              userEmail: _emailController.text,
                                              userPassword: _passwordController.text));
                                        }
                                      },
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                    }
                  },
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
