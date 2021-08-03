import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'presentation/submission/submission_model.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ChangeNotifierProvider<SubmissionModel>(
          create: (_) => SubmissionModel(),
          child: Consumer<SubmissionModel>(
            builder: (context, model, child) {
              return SafeArea(
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
