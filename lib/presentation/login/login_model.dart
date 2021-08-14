import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginModel extends ChangeNotifier {
  String mail = '';
  String password = '';

  final mailController = TextEditingController();
  final passwordController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;

  LoginModel() {
    mail = '';
    password = '';
  }

  Future login() async {
    if (mail.isEmpty) {
      print('aa');
      throw ('メールアドレスを入力してください');
    }

    if (!mail.contains('@')) {
      throw ('メールアドレスが正しくありません');
    }

    if (password.isEmpty) {
      throw ('パスワードを入力してください');
    }

    final result = await auth.signInWithEmailAndPassword(
      email: mail,
      password: password,
    );
    final uid = result.user!.uid;

    // await FirebaseFirestore.instance
    //     .collection('users')
    //     .doc(user.uid)
    //     .collection('posts')
    //     .doc(user.uid)
    //     .set(
    //   {
    //     'email': user.email,
    //   },
    // );
  }
}
