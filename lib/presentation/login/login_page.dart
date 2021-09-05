import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kr_app/common/constants.dart';
import 'package:kr_app/presentation/signup/signup_page.dart';
import 'package:kr_app/presentation/top/top_page.dart';

import 'package:provider/provider.dart';

import 'login_model.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          appBar: commonAppBar('ログイン'),
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.orange.shade50,
          body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: kBackgroundDecoration,
            child: ChangeNotifierProvider<LoginModel>(
              create: (_) => LoginModel(),
              child: Consumer<LoginModel>(builder: (context, model, child) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(
                          height: 60,
                        ),
                        TextField(
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            hintText: 'メールアドレスを入力してください',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          controller: model.mailController,
                          onChanged: (text) {
                            model.mail = text;
                          },
                        ),
                        SizedBox(height: 50),
                        TextField(
                          obscureText: true,
                          maxLength: 8,
                          textInputAction: TextInputAction.next,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            hintText: 'パスワードを入力してください',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          controller: model.passwordController,
                          onChanged: (text) {
                            model.password = text;
                          },
                        ),
                        const Text(
                            'ヒント：パスワードは生年月日です。(数字8文字)\n例) 1950年12月１日生まれの方：19501201'),
                        const SizedBox(height: 30),
                        ElevatedButton(
                          child: _buttonContainer("ログイン"),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.brown.shade400),
                          onPressed: () async {
                            try {
                              await model.login();
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TopPage()),
                              );
                            } catch (e) {
                              _showDialog(context, e.toString());
                            }
                          },
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          child: _buttonContainer("新規登録はこちら"),
                          style: kButtonStyleForm,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignupPage()));
                          },
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }

  Future _showDialog(BuildContext context, String title) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buttonContainer(String title) => Container(
      child: Text(
        title,
        textAlign: TextAlign.center,
      ),
      width: 120);
}
