import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_complete_guide/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/http_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../widgets/utils.dart';

class Auth with ChangeNotifier {
  Future<void> login(String? email, String? password, context) async {
    try {
      showDialog(
          context: context,
          builder: (context) => Center(
                child: CircularProgressIndicator(),
              ));
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email!.trim(), password: password!.trim());

      navigatorKey.currentState!.popUntil((route) => route.isFirst);
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      print(e);
      Utils.showSnackBar(e.message);

    }
  }

  Future<void> signUp(String? email, String? password, context) async {
    try {
      showDialog(
          context: context,
          builder: (context) => Center(
                child: CircularProgressIndicator(),
              ));
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email!.trim(), password: password!.trim());

      navigatorKey.currentState!.popUntil((route) => route.isFirst);
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      print(e);

      Utils.showSnackBar(e.message);
    }
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    notifyListeners();
  }

  Future<void> forgotPassword(String? email, context) async {
    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator()),
      );
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email!.trim());

      Utils.showSnackBar('Password Reset Email Sent', backgroundColor: Colors.blue);
      Navigator.of(context).popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      print(e);

      Utils.showSnackBar(e.message);
      Navigator.of(context).pop();
    }
  }
}
