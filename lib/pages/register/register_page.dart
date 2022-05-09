import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tecnofit_login/bloc/user_bloc/user_bloc.dart';
import 'package:tecnofit_login/helper/media_query_helper.dart';
import 'package:tecnofit_login/pages/register/bloc/register_bloc.dart';
import 'package:tecnofit_login/service/regres_service.dart';
import 'package:tecnofit_login/style/custom_gradient.dart';
import 'package:tecnofit_login/style/custom_text_styles.dart';
import 'package:tecnofit_login/widgets/animations/fade_in_widget.dart';
import 'package:tecnofit_login/widgets/buttons/main_button_widget.dart';
import 'package:tecnofit_login/widgets/indicators/circular_progress_indicator_widget.dart';
import 'package:tecnofit_login/widgets/inputs/main_text_form_field.dart';

class RegisterPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(regresService: RegresService.instance),
      child: Scaffold(
          body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: buildGradient(context: context),
        ),
        child: LayoutBuilder(builder: (context, BoxConstraints constraints) {
          return SafeArea(
            child: FadeInWidget(
              child: BlocConsumer<RegisterBloc, RegisterState>(
                listener: (context, RegisterState state) {
                  if (state.runtimeType == SuccessRegisterState) {
                    context.read<UserBloc>().add(GetUserInformation());
                    Navigator.pushReplacementNamed(context, '/dashboard');
                  }
                },
                builder: (context, state) {
                  switch (state.runtimeType) {
                    case SuccessRegisterState:
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: mediaQueryHelper(context: context)),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Spacer(),
                              SizedBox(height: constraints.maxHeight * 0.05),
                              Text('Cadastro realizado com sucesso!',
                                  style: RegisterTextStyles(context: context).style()),
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
                          kIsWeb ? Container() : Align(
                            alignment: Alignment.topLeft,
                            child: IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ),
                              onPressed: () => Navigator.pushReplacementNamed(context, '/'),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: mediaQueryHelper(context: context)),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Para se cadastrar,\npreencha os dados abaixo',
                                    style: RegisterTextStyles(context: context).style(),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: constraints.maxHeight * 0.05,
                                  ),
                                  MainTextFormFieldWidget(
                                    controller: _emailController,
                                    label: 'E-mail',
                                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                                    isRequired: true,
                                    isEmail: true,
                                  ),
                                  SizedBox(
                                    height: constraints.maxHeight * 0.05,
                                  ),
                                  MainTextFormFieldWidget(
                                    controller: _passwordController,
                                    label: 'Senha',
                                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                                    isRequired: true,
                                    isPassword: true,
                                    textInputAction: TextInputAction.next,
                                     validator: (String? value) {
                                      if (value != null &&
                                          value.isNotEmpty &&
                                          _repeatPasswordController.text != _passwordController.text) {
                                        return 'Os campos de senha são diferentes';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: constraints.maxHeight * 0.05,
                                  ),
                                  MainTextFormFieldWidget(
                                    controller: _repeatPasswordController,
                                    label: 'Repita a senha',
                                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                                    isRequired: true,
                                    isPassword: true,
                                    textInputAction: TextInputAction.done,
                                    validator: (String? value) {
                                      if(value != null && value.isNotEmpty && _repeatPasswordController.text != _passwordController.text) {
                                        return 'Os campos de senha são diferentes';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: constraints.maxHeight * 0.05,
                                  ),
                                  MainButtonWidget(
                                    text: state.isLoading! ? null : 'Registrar',
                                    child: state.isLoading!
                                        ? CircularProgressIndicatorWidget(
                                            color: Theme.of(context).colorScheme.primary,
                                            strokeWidth: 3.0,
                                            padding: 1.5,
                                          )
                                        : null,
                                    onTap: state.isLoading! ? () {} : () {
                                      if (_formKey.currentState!.validate()) {
                                        context.read<RegisterBloc>().add(SendInformationToApiEvent(
                                            userEmail: _emailController.text, userPassword: _passwordController.text));
                                      }
                                    },
                                  ),
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
          );
        }),
      )),
    );
  }
}
