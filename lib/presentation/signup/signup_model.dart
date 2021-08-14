import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupModel extends ChangeNotifier {
  String mail = '';
  String password = '';

  final mailController = TextEditingController();
  final passwordController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;

  SignupModel() {
    mail = '';
    password = '';
  }

  Future signUp() async {
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

    final User? user = (await auth.createUserWithEmailAndPassword(
      email: mail,
      password: password,
    ))
        .user;

    await FirebaseFirestore.instance.collection('users').doc(user!.uid).set(
      {
        'userId': user.uid,
        'createdAt': Timestamp.now(),
      },
    );

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
