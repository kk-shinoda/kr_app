import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kr_app/presentation/submission/submission_page.dart';
import 'package:kr_app/presentation/top/top_page.dart';

import 'my_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(SubmissionPage());
  });
}
