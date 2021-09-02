import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kr_app/domain/member.dart';
import 'package:kr_app/logic/fetch_my_account.dart';
import 'package:kr_app/presentation/login/login_page.dart';

class MyPageModel extends ChangeNotifier {
  Member? myAccount;
  bool isLoading = false;
  String imageURL = '';

  MyPageModel() {
    init();
  }

  init() async {
    startLoading();
    myAccount = await fetchMyAccount();
    imageURL = myAccount!.imageURL!;
    endLoading();
  }

  void startLoading() {
    isLoading = true;
    notifyListeners();
  }

  void endLoading() {
    isLoading = false;
    notifyListeners();
  }

  void logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    await Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) {
      return LoginPage();
    }));
  }
}
