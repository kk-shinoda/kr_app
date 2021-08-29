import 'package:flutter/material.dart';
import 'package:kr_app/common/constants.dart';
import 'package:kr_app/domain/area.dart';
import 'package:kr_app/domain/member.dart';
import 'package:kr_app/domain/my_post.dart';
import 'package:kr_app/domain/prefecture.dart';
import 'package:kr_app/logic/query_posts.dart';

class MemberDetailPage extends StatelessWidget {
  final int index;
  final Member member;
  MemberDetailPage(this.index, this.member);
  bool isCommentFull = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar('詳細'),
      backgroundColor: Colors.orange.shade50,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: kBackgroundDecoration,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Hero(
                      tag: 'tag' + index.toString(),
                      // child: _blueRectangle(context),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/placeholder.png')))),
                      )),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                        child: Text(
                          member.userName!,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                        child: Text(
                            PrefectureHelper.from(member.prefecture).name +
                                '  ' +
                                AreaHelper.from(member.area).name,
                            style: TextStyle(fontSize: 14)),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(60, 0, 60, 0),
                child: ExpansionTile(
                  title: Text('自己紹介'),
                  children: [
                    Text(member.introduction == ""
                        ? '未記入\n'
                        : member.introduction + '\n')
                  ],
                ),
              ),
              Expanded(
                  child: FutureBuilder(
                      future: fetchPostList(member.userId!),
                      builder: (context, userData) {
                        if (!userData.hasData) {
                          return Center(child: CircularProgressIndicator());
                        }
                        var x = userData as AsyncSnapshot<List<MyPost>>;
                        return Column(children: [
                          Text(
                            // '今月の投入量　200g\n累計の投入量　2,000g',
                            (x.data.toString() == '[]')
                                ? '今月の投入量　0g\n累計の投入量　0g'
                                : _calculateSumAmount(userData.data!),
                            style: TextStyle(
                                fontSize: 20, fontFamily: "KaiseiTokumin"),
                          ),
                          Expanded(
                              child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 8, 8, 0),
                                  child: Scrollbar(
                                    child: ListView.builder(
                                        itemBuilder: (context, i) =>
                                            buildBankList(
                                                userData.data![i].postDate
                                                    .toString(),
                                                userData.data![i].amount!,
                                                userData.data![i].comment!,
                                                member.isCommentPublic!),
                                        itemCount: userData.data!.length),
                                  )))
                        ]);
                      }))
            ],
          ),
        ),
      ),
    );
  }
}

String _calculateSumAmount(List<MyPost> userData) {
  int thisMonthSum = 0;
  int allTimeSum = 0;
  int thisMonth = parseDate(DateTime.now().toString());
  userData.forEach((element) {
    allTimeSum += element.amount!;
    if ((element.postDate! / 100).floor() == thisMonth) {
      thisMonthSum += element.amount!;
    }
  });
  return '今月の投入量　' +
      thisMonthSum.toString() +
      'g\n累計の投入量　' +
      allTimeSum.toString() +
      'g';
}
