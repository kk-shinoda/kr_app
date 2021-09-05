import 'package:flutter/material.dart';
import 'package:kr_app/common/constants.dart';
import 'package:kr_app/domain/area.dart';

import 'package:kr_app/domain/prefecture.dart';
import 'package:kr_app/presentation/mypage/about_kr/about_page.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'contact/contact_page.dart';
import 'edit_profile/profile_hub_page.dart';
import 'mypage_model.dart';

class MyPagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar('マイページ'),
      backgroundColor: Colors.orange.shade50,
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: kBackgroundDecoration,
          child: ChangeNotifierProvider<MyPageModel>(
            create: (_) => MyPageModel(),
            child: Consumer<MyPageModel>(builder: (context, model, child) {
              return model.isLoading
                  ? Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
                              child: Card(
                                elevation: 5,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    color: Colors.grey.shade50,
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 8),
                                              child: ClipOval(
                                                  child: model.imageURL != ""
                                                      ? Image.network(
                                                          model.imageURL,
                                                          height: 100,
                                                          width: 100,
                                                          fit: BoxFit.cover,
                                                        )
                                                      : Image.asset(
                                                          "assets/images/placeholder.jpg",
                                                          height: 100,
                                                          width: 100,
                                                          fit: BoxFit.cover,
                                                        )),
                                            ),
                                            Flexible(
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(0, 8, 0, 8),
                                                    child: Text(
                                                      model
                                                          .myAccount!.userName!,
                                                      style: TextStyle(
                                                          fontSize: 20),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(0, 8, 0, 0),
                                                    child: Text(
                                                        PrefectureHelper.from(model
                                                                    .myAccount!
                                                                    .prefecture)
                                                                .name +
                                                            '  ' +
                                                            AreaHelper.from(model
                                                                    .myAccount!
                                                                    .area)
                                                                .name,
                                                        style: TextStyle(
                                                            fontSize: 14)),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              60, 0, 60, 15),
                                          child: ExpansionTile(
                                            title: Text('自己紹介'),
                                            children: [
                                              Text(model.myAccount!
                                                          .introduction ==
                                                      ""
                                                  ? '未記入\n'
                                                  : model.myAccount!
                                                          .introduction +
                                                      '\n')
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                elevation: 5,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    color: Colors.grey.shade50,
                                    height: 200,
                                    child: ListView(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      children: [
                                        _menuItem('プロフィール編集', Icon(Icons.edit),
                                            () async {
                                          final result =
                                              await Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                            return ProfileHubPage(
                                                model.myAccount!);
                                          }));

                                          if (result == true) {
                                            model.init();
                                          }
                                        }),
                                        _menuItem('キエーロについて', Icon(Icons.help),
                                            () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return AboutPage();
                                          }));
                                        }),
                                        _menuItem('お問い合わせ', Icon(Icons.mail),
                                            () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return ContactPage();
                                          }));
                                        }),
                                        _menuItem('ログアウト', Icon(Icons.logout),
                                            () => _logout(context, model)),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ]),
                    );
            }),
          )),
    );
  }
}

Widget _menuItem(String title, Icon icon, Function func) {
  return Container(
    height: 50,
    decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey))),
    child: ListTile(
      leading: icon,
      title: Text(
        ' $title',
        style: TextStyle(color: Colors.black, fontSize: 18.0),
      ),
      // onTap: () => _launchURL(), // タップ
      onTap: () => func(),
      onLongPress: () {
        print("onLongPress called.");
      }, // 長押し
    ),
  );
}

void _logout(BuildContext context, MyPageModel model) {
  showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            title: Text('ログアウト'),
            content: Text('本当にログアウトしますか？'),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: Text('しない')),
              TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: Text('する'))
            ],
          )).then((value) {
    if (value == 'OK') {
      model.logout(context);
    }
  });
}
