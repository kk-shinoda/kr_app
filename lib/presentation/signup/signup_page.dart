import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kr_app/common/constants.dart';
import 'package:kr_app/presentation/profile_setting/profile_setting_page.dart';
import 'package:kr_app/presentation/signup/signup_model.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('新規登録'),
          backgroundColor: Colors.brown.shade400,
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.orange.shade50,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: kBackgroundDecoration,
          child: ChangeNotifierProvider<SignupModel>(
            create: (_) => SignupModel(),
            child: Consumer<SignupModel>(builder: (context, model, child) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 80,
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
                      SizedBox(height: 60),
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
                          hintText: 'パスワードを設定してください',
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
                          'パスワードは生年月日にしてください。(数字8文字)\n例) 1950年12月１日生まれの方：19501201'),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        child: _buttonContainer("登録"),
                        style: kButtonStyleForm,
                        onPressed: () async {
                          try {
                            await model.signUp();
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfileSettingPage()),
                            );
                          } catch (e) {
                            _showDialog(context, e.toString());
                          }
                        },
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                          style: kButtonStyleForm,
                          onPressed: () {
                            if (Navigator.canPop(context)) {
                              Navigator.pop(context);
                            } else {
                              SystemNavigator.pop();
                            }
                          },
                          child: _buttonContainer("戻る"))
                    ],
                  ),
                ),
              );
            }),
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
