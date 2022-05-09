import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:tecnofit_login/constants/widget_keys.dart';
import 'package:tecnofit_login/style/custom_gradient.dart';
import 'package:tecnofit_login/widgets/buttons/main_button_widget.dart';

class CoverPage extends StatefulWidget {
  @override
  State<CoverPage> createState() => _CoverPageState();
}

class _CoverPageState extends State<CoverPage> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 750),
    vsync: this,
  );

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void initState() {
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: buildGradient(context: context),
          ),
          child: LayoutBuilder(builder: (context, BoxConstraints constraints) {
            return FadeTransition(
              opacity: _animation,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 75.0),
                      child: Image.asset(
                        'assets/images/tecnofit_logo.png',
                        height: constraints.maxHeight * 0.3,
                      ),
                    ),
                    const SizedBox(height: 30),
                    MainButtonWidget(
                      key: coverRegisterButtonKey,
                      onTap: () => _controller.reverse().whenComplete(() => Navigator.pushReplacementNamed(context, '/register')),
                      text: 'Cadastrar',
                    ),
                    const SizedBox(height: 30),
                    MainButtonWidget(
                      key: coverLoginButtonKey,
                      onTap: () => _controller.reverse().whenComplete(() => Navigator.pushReplacementNamed(context, '/login')),
                      text: 'Login',
                    ),
                  ],
                )
            );
          }),
        ));
  }
}
