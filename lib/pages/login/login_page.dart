import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: LayoutBuilder(
          builder: (context, BoxConstraints constraints) {
            return const Center(
              child: Text('login page'),
            );
          }
        ),
      ),
    );
  }
}