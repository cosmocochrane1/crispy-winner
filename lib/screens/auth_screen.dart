import '../widgets/login.dart';
import '../widgets/signup.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  static const routeName = '/auth';

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  void toggle() => setState(() => isLogin = !isLogin);

  @override
  Widget build(BuildContext context) => Scaffold(
      body: Center(
          child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(37, 30, 59, 1),
                  Color.fromRGBO(56, 60, 161, 1),
                ],

              )),
              child: Center(
                  child: isLogin
                      ? LoginWidget(onClickedSignUp: toggle)
                      : SignUpWidget(onClickedSignIn: toggle)))));
}
