// ignore_for_file: public_member_api_docs, lines_longer_than_80_chars
import 'package:flutter/material.dart';
import 'package:kr_app/presentation/bankbook/bankbook_page.dart';
import 'package:kr_app/presentation/members/members_page.dart';
import 'package:kr_app/presentation/mypage/mypage_page.dart';
import 'package:kr_app/presentation/submission/submission_page.dart';
import 'package:kr_app/presentation/top/top_model.dart';
import 'package:provider/provider.dart';

class TopPage extends StatelessWidget {
  final List<Widget> _pageList = <Widget>[
    SubmissionPage(),
    BankBookPage(),
    MembersPage(),
    MyPagePage()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<TopModel>(
        create: (_) => TopModel(),
        child: Consumer<TopModel>(
          builder: (context, model, child) {
            /// Low もっとお洒落なものにできる
            /// ConvexAppBarってやつ！
            final tabItems = [
              const BottomNavigationBarItem(
                backgroundColor: Colors.lightGreen,
                icon: Icon(Icons.create_outlined),
                label: '投稿',
              ),
              const BottomNavigationBarItem(
                backgroundColor: Colors.lightGreen,
                icon: Icon(Icons.receipt_outlined),
                label: '通帳',
              ),
              const BottomNavigationBarItem(
                backgroundColor: Colors.lightGreen,
                icon: Icon(Icons.groups_outlined),
                label: '仲間',
              ),
              const BottomNavigationBarItem(
                backgroundColor: Colors.lightGreen,
                icon: Icon(Icons.person_outline),
                label: 'マイページ',
              ),
            ];

            return Scaffold(
              body:
                  IndexedStack(index: model.currentIndex, children: _pageList),
              bottomNavigationBar: BottomNavigationBar(
                selectedItemColor: Colors.red.shade300,
                currentIndex: model.currentIndex,
                onTap: (index) {
                  model.setCurrentIndex(index);
                },
                items: tabItems,
              ),
            );
          },
        ),
      ),
    );
  }
}
