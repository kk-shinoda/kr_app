import 'package:cloud_firestore/cloud_firestore.dart';
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
  final bool isOthers;
  MemberDetailPage(this.index, this.member, this.isOthers);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('詳細'),
        backgroundColor: Colors.brown.shade400,
        toolbarHeight: 60,
        actions: [
          isOthers
              ? IconButton(
                  onPressed: () async {
                    _showDialog(context, 'このユーザーを通報しますか？', member);
                  },
                  icon: Icon(Icons.campaign_outlined,
                      color: Colors.lime.shade100))
              : SizedBox()
        ],
      ),
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
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ClipOval(
                            child: member.imageURL != ""
                                ? Image.network(
                                    member.imageURL!,
                                    height: 100,
                                    width: 100,
                                    fit: BoxFit.cover,
                                  )
                                : Image.asset(
                                    "assets/images/placeholder.jpg",
                                    height: 95,
                                    width: 95,
                                    fit: BoxFit.cover,
                                  )),
                      )),
                  Flexible(
                    child: Column(
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

Future _showDialog(BuildContext context, String title, Member member) async {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content:
            Text('\n通報の対象\n・プロフィール画像が不適切\n・自己紹介が不適切\n・投入量が不自然\n・投入コメントが不適切'),
        actions: [
          TextButton(
            child: const Text('いいえ'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text(
              'はい',
            ),
            onPressed: () async {
              await FirebaseFirestore.instance
                  .collection('reports')
                  .add({'reportedUserId': member.userId});
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
