import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kr_app/presentation/top/top_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(TopPage());
  });
}
