import 'package:flutter/material.dart';
import 'package:kr_app/presentation/top/top_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(TopPage()

      /// Providers are above [MyApp] instead of inside it, so that tests
      /// can use [MyApp] while mocking the providers
      // MultiProvider(
      //   providers: [
      //     ChangeNotifierProvider(create: (_) => Counter()),
      //   ],
      //   child: TopPage(),
      // ),
      );
}
