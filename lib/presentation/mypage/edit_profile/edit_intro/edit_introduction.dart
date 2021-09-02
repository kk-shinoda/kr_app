import 'package:flutter/material.dart';
import 'package:kr_app/common/constants.dart';

class EditIntroductionPage extends StatefulWidget {
  final String introduction;
  EditIntroductionPage(this.introduction);

  @override
  _EditIntroductionPageState createState() => _EditIntroductionPageState();
}

class _EditIntroductionPageState extends State<EditIntroductionPage> {
  @override
  Widget build(BuildContext context) {
    String name = widget.introduction;
    return Scaffold(
        appBar: commonAppBar('自己紹介変更'),
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
                  initialValue: widget.introduction,
                  maxLines: 8,
                  minLines: 1,
                  maxLength: 150,
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
