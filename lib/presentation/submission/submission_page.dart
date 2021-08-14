import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kr_app/presentation/submission/submission_model.dart';
import 'package:provider/provider.dart';

class SubmissionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            toolbarHeight: 60,
            backgroundColor: Colors.brown.shade400,
            title: Text('投稿'),
          ),
          backgroundColor: Colors.orange.shade50,
          resizeToAvoidBottomInset: false,
          body: ChangeNotifierProvider<SubmissionModel>(
            create: (_) => SubmissionModel(),
            child: Consumer<SubmissionModel>(
              builder: (context, model, child) {
                return Center(
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 700),
                    width: 300,
                    height: model.canComment ? 330 : 260,
                    margin: EdgeInsets.all(36.0),
                    decoration: BoxDecoration(
                        color: Colors.deepOrange.shade200,
                        borderRadius: BorderRadius.circular(20)),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            SizedBox(height: 15),
                            SizedBox(
                              width: 200,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text('投入量'),
                                  SizedBox(width: 50),
                                  SizedBox(
                                    width: 80,
                                    child: TextField(
                                      maxLength: 3,
                                      decoration: InputDecoration(
                                          hintText: '例：150',
                                          border: InputBorder.none,
                                          counterText: ''),
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Text('g'),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 200,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text('日付'),
                                  const SizedBox(width: 60),
                                  TextButton(
                                    child: Text(
                                      model.selectDate.substring(0, 10),
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                    onPressed: () async {
                                      await model.setSelectDate(context);
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                TextButton(
                                    onPressed: () => model.toggleComment(),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'コメント',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        SizedBox(
                                          width: 120,
                                        ),
                                        model.canComment
                                            ? Icon(Icons.expand_less,
                                                color: Colors.black)
                                            : Icon(Icons.expand_more,
                                                color: Colors.black)
                                      ],
                                    )),
                                Visibility(
                                  visible: model.canComment,
                                  child: TextFormField(
                                    textInputAction: TextInputAction.done,
                                    style: TextStyle(fontSize: 12),
                                    maxLines: 4,
                                    maxLength: 50,
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 44.0),
                                        border: InputBorder.none),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.brown),
                                    onPressed: () {
                                      model.printID();
                                    },
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
        ),
      ),
    );
  }
}
