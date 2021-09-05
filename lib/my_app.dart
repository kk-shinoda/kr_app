import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'presentation/submission/post_model.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ChangeNotifierProvider<PostModel>(
          create: (_) => PostModel(),
          child: Consumer<PostModel>(
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
