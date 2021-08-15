import 'package:flutter/material.dart';
import 'package:kr_app/presentation/bankbook/bankbook_page.dart';
import 'package:kr_app/presentation/members/members_page.dart';
import 'package:kr_app/presentation/mypage/mypage_page.dart';
import 'package:kr_app/presentation/submission/submission_page.dart';
import 'package:kr_app/presentation/top/top_model.dart';
import 'package:provider/provider.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

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
            final tabItems = [
              const TabItem(icon: Icon(Icons.create_outlined), title: '投稿'),
              const TabItem(icon: Icon(Icons.receipt_outlined), title: '通帳'),
              const TabItem(icon: Icon(Icons.groups_outlined), title: '仲間'),
              const TabItem(icon: Icon(Icons.person_outline), title: 'マイページ'),
            ];

            return Scaffold(
              body:
                  IndexedStack(index: model.currentIndex, children: _pageList),
              bottomNavigationBar: ConvexAppBar(
                initialActiveIndex: model.currentIndex,
                onTap: (index) {
                  model.setCurrentIndex(index);
                },
                items: tabItems,
                style: TabStyle.titled,
                backgroundColor: Colors.green,
                activeColor: Colors.lime.shade100,
              ),
            );
          },
        ),
      ),
    );
  }
}
