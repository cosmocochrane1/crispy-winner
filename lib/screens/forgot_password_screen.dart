import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widgets/utils.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import '../providers/auth.dart';

class ForgotPasswordPage extends StatefulWidget {
  static const routeName = '/forgot-password-page';

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }

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
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Receive an email to\nreset your password.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: emailController,
                      cursorColor: Colors.white,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                              borderRadius: BorderRadius.circular(10.0)),
                          hintText: 'Email'),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (email) =>
                          email != null && !EmailValidator.validate(email)
                              ? 'Enter a valid email'
                              : null,
                    ),
                    SizedBox(height: 20),
                     ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(142, 151, 253, 1),
                      minimumSize: const Size.fromHeight(50),
                      shape: StadiumBorder()),
                 onPressed: () {
                          Provider.of<Auth>(context, listen: false)
                              .forgotPassword(
                            emailController.text,
                            context,
                          );
                        },
                  child: Text(
                    'Reset Password',
                    style: TextStyle(fontSize: 18),
                  )),
                   
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
