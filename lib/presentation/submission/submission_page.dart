import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kr_app/presentation/submission/submission_model.dart';
import 'package:provider/provider.dart';

class SubmissionPage extends StatelessWidget {
  const SubmissionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<SubmissionModel>(
        create: (_) => SubmissionModel(),
        child: Consumer<SubmissionModel>(
          builder: (context, model, child) {
            return SafeArea(
              child: Center(
                child: Card(
                  margin: EdgeInsets.all(36.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('投入量'),
                            SizedBox(width: 50),
                            SizedBox(
                              width: 80,
                              child: TextField(
                                decoration: const InputDecoration(
                                    hintText: '例：150',
                                    border: InputBorder.none),
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(width: 8),
                            Text('g'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('日付'),
                            const SizedBox(width: 60),
                            TextButton(
                              child: Text(model.selectDate.substring(0, 10)),
                              onPressed: () async {
                                await model.setSelectDate(context);
                              },
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ElevatedButton(
                                onPressed: () => model.toggleComment(),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  shadowColor: Colors.white,
                                  elevation: 0,
                                  animationDuration:
                                      Duration(milliseconds: 500),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'コメント',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    SizedBox(
                                      width: 120,
                                    ),
                                    model.canComment
                                        ? Icon(Icons.expand_more,
                                            color: Colors.black)
                                        : Icon(Icons.chevron_left,
                                            color: Colors.black)
                                  ],
                                )),
                            Visibility(
                              visible: model.canComment,
                              child: Flexible(
                                child: SingleChildScrollView(
                                  child: TextField(
                                    maxLines: null,
                                    maxLength: 50,
                                    decoration: const InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                        border: InputBorder.none),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text('送信'),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
