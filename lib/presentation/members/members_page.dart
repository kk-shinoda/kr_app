import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kr_app/common/constants.dart';
import 'package:kr_app/domain/member.dart';
import 'package:kr_app/presentation/login/login_page.dart';
import 'package:provider/provider.dart';

import 'member_detail_page.dart';
import 'members_model.dart';
import 'package:auto_size_text/auto_size_text.dart';

class MembersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MembersModel(),
      child: Consumer<MembersModel>(builder: (context, model, child) {
        return Scaffold(
            appBar: AppBar(
                toolbarHeight: 60,
                backgroundColor: Colors.brown.shade400,
                title: TextButton(
                  // ここで地域ごとのクエリ
                  onPressed: () {},
                  child: Text(
                    '全国の仲間たち',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      model.reload();
                    },
                    child: Icon(Icons.refresh, color: Colors.lime.shade100),
                  )
                ]),
            backgroundColor: Colors.orange.shade50,
            body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: kBackgroundDecoration,
              child: model.isLoading
                  ? Center(child: CircularProgressIndicator())
                  : Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24, 28, 24, 8),
                          child: Card(
                            color: Colors.brown.shade200,
                            shadowColor: Colors.brown.shade800,
                            elevation: 10,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  image: DecorationImage(
                                      image:
                                          AssetImage("assets/images/wood.jpg"),
                                      fit: BoxFit.fitWidth)),
                              height: 90,
                              child: Center(
                                  child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    '現在登録している人数は　 ' +
                                        model.targetMembersLength.toString() +
                                        '人',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: "KaiseiTokumin"),
                                  ),
                                  Text(
                                    '本日投入してくれた人数は ' +
                                        model.todayMembers.toString() +
                                        '人',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: "KaiseiTokumin"),
                                  ),
                                ],
                              )),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GridView.count(
                              primary: false,
                              padding: const EdgeInsets.all(8),
                              crossAxisCount: 3,
                              children:
                                  List.generate(model.members!.length, (index) {
                                return Column(
                                  children: [
                                    Hero(
                                      child: _showIconImage(context, index,
                                          model.members![index]),
                                      tag: 'tag' + index.toString(),
                                    ),
                                    AutoSizeText(
                                        model.members![index].userName!)
                                  ],
                                );
                              })),
                        ),
                      ],
                    ),
            ));
      }),
    );
  }

  Widget _showIconImage(BuildContext context, int index, Member member) {
    return GestureDetector(
        onTap: () => _gotoDetailsPage(context, index, member),
        child: ClipOval(
            child: member.imageURL != ""
                ? Image.network(
                    member.imageURL!,
                    height: 95,
                    width: 95,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    "assets/images/placeholder.jpg",
                    height: 95,
                    width: 95,
                    fit: BoxFit.cover,
                  )));
  }

  void _gotoDetailsPage(BuildContext context, int index, Member member) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (BuildContext context) {
        return MemberDetailPage(index, member);
      }),
    );
  }
}
