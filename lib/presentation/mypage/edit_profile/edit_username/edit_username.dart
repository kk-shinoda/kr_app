import 'package:flutter/material.dart';
import 'package:kr_app/common/constants.dart';

class EditUserNamePage extends StatefulWidget {
  final String userName;
  EditUserNamePage(this.userName);

  @override
  _EditUserNamePageState createState() => _EditUserNamePageState();
}

class _EditUserNamePageState extends State<EditUserNamePage> {
  @override
  Widget build(BuildContext context) {
    String name = widget.userName;
    return Scaffold(
        appBar: commonAppBar('ユーザー名変更'),
        backgroundColor: Colors.orange.shade50,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: kBackgroundDecoration,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  initialValue: widget.userName,
                  maxLength: 8,
                  onChanged: (text) {
                    name = text;
                  },
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context, name);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.brown,
                        border: Border.all(color: Colors.brown),
                        borderRadius: BorderRadius.circular(5)),
                    width: 100,
                    height: 30,
                    child: Center(
                        child:
                            Text('決定', style: TextStyle(color: Colors.white))),
                  ))
            ],
          ),
        ));
  }
}
