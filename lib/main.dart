import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kr_app/presentation/top/top_page.dart';

import 'presentation/login/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final currentUser = await FirebaseAuth.instance.currentUser;

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    if (currentUser != null) {
      runApp(TopPage());
    } else {
      runApp(LoginPage());
    }
  });
}
