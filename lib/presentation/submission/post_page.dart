import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kr_app/common/constants.dart';
import 'package:kr_app/presentation/submission/post_model.dart';
import 'package:provider/provider.dart';

class PostPage extends StatelessWidget {
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
            title: Text('投入'),
            backgroundColor: Colors.brown.shade400,
            toolbarHeight: 60,
            actions: [
              IconButton(
                  onPressed: () async {
                    _showDialog(context,
                        'このアプリは、生ごみを自家処理した量と、それにより、不要になった税金（30円/㎏で換算）を記録することを目的としています');
                  },
                  icon: Icon(Icons.help))
            ],
          ),
          backgroundColor: Colors.orange.shade50,
          resizeToAvoidBottomInset: false,
          body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: kBackgroundDecoration,
            child: ChangeNotifierProvider<PostModel>(
              create: (_) => PostModel(),
              child: Consumer<PostModel>(
                builder: (context, model, child) {
                  return Center(
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 700),
                      width: 300,
                      height: model.canComment ? 340 : 260,
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
                              Container(
                                width: 200,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text('投入量'),
                                    SizedBox(width: 50),
                                    SizedBox(
                                      width: 80,
                                      child: TextField(
                                        controller: model.amountController,
                                        maxLength: 4,
                                        decoration: InputDecoration(
                                            hintText: '例：150',
                                            border: InputBorder.none,
                                            counterText: ''),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        keyboardType: TextInputType.number,
                                        textAlign: TextAlign.end,
                                        onChanged: (text) {
                                          model.amount = int.parse(text);
                                        },
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Text('g'),
                                  ],
                                ),
                              ),
                              Container(
                                width: 200,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                      child: Container(
                                        width: 200,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('コメント',
                                                style: TextStyle(
                                                    color: Colors.black)),
                                            SizedBox(width: 120),
                                            model.canComment
                                                ? Icon(Icons.expand_less,
                                                    color: Colors.black)
                                                : Icon(Icons.expand_more,
                                                    color: Colors.black)
                                          ],
                                        ),
                                      )),
                                  Visibility(
                                    visible: model.canComment,
                                    child: TextFormField(
                                      controller: model.commentController,
                                      textInputAction: TextInputAction.done,
                                      style: TextStyle(fontSize: 16),
                                      maxLines: 4,
                                      maxLength: 45,
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 36.0),
                                          border: InputBorder.none),
                                      onChanged: (text) {
                                        model.comment = text;
                                      },
                                    ),
                                  ),
                                  Container(
                                    margin: model.canComment
                                        ? null
                                        : EdgeInsets.only(top: 20),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.brown),
                                      onPressed: () async {
                                        model.amount == 0
                                            ? _showDialog(
                                                context, '投入量を記入してください')
                                            : _showDialog(
                                                context,
                                                '税金' +
                                                    (model.amount * 0.03)
                                                        .toStringAsFixed(1) +
                                                    '円分を節約しました');
                                        await model.submit();
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
      ),
    );
  }
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
