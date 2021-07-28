// ignore_for_file: public_member_api_docs, lines_longer_than_80_chars
import 'package:flutter/foundation.dart';
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
            final tabItems = [
              const BottomNavigationBarItem(
                backgroundColor: Colors.pink,
                icon: Icon(Icons.face),
                label: '',
              ),
              const BottomNavigationBarItem(
                backgroundColor: Colors.blue,
                icon: Icon(Icons.fastfood),
                label: '',
              ),
              const BottomNavigationBarItem(
                backgroundColor: Colors.yellow,
                icon: Icon(Icons.fastfood),
                label: '',
              ),
              const BottomNavigationBarItem(
                backgroundColor: Colors.green,
                icon: Icon(Icons.fastfood),
                label: '',
              ),
            ];

            return Scaffold(
              body: _pageList[model.currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                selectedItemColor: Colors.redAccent,
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
