import 'package:flutter/material.dart';
import 'package:kr_app/common/constants.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: commonAppBar('お問い合わせ'),
        backgroundColor: Colors.orange.shade50,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: kBackgroundDecoration,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              '改善してほしいところや追加してほしい機能などございましたら以下のアドレスまでメールを送信してください。\n\nexample.test.com',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ));
  }
}
