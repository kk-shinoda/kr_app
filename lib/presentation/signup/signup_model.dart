import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:math' as Math;

class SignupModel extends ChangeNotifier {
  String mail = '';
  String password = '';
  DateTime? latestPost;

  final mailController = TextEditingController();
  final passwordController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;

  SignupModel() {
    mail = '';
    password = '';
    latestPost = DateTime.now();
    latestPost = latestPost!.add(Duration(days: -1));
  }

  Future signUp() async {
    if (mail.isEmpty) {
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

    String assumedName = mail.split('@')[0];
    await FirebaseFirestore.instance.collection('users').doc(user!.uid).set(
      {
        'userId': auth.currentUser!.uid,
        'imageURL': "",
        'userName': assumedName.substring(0, Math.min(8, assumedName.length)),
        'sex': "UNSELECTED",
        'prefecture': "UNSELECTED",
        'area': "UNSELECTED",
        'introduction': "",
        'latestPost': Timestamp.fromDate(latestPost!),
        'isCommentPublic': true
      },
    );
  }
}
