import 'package:flutter/material.dart';
import 'package:kr_app/common/constants.dart';

import 'package:kr_app/domain/area.dart';
import 'package:kr_app/domain/member.dart';
import 'package:kr_app/domain/prefecture.dart';
import 'package:provider/provider.dart';

import 'edit_area/edit_area_page.dart';
import 'edit_intro/edit_introduction.dart';
import 'edit_username/edit_username.dart';
import 'profile_hub_model.dart';

class ProfileHubPage extends StatelessWidget {
  final Member member;
  ProfileHubPage(this.member);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProfileHubModel>(
      create: (_) => ProfileHubModel(member),
      child: Consumer<ProfileHubModel>(builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 60,
            backgroundColor: Colors.brown.shade400,
            leadingWidth: 100,
            title: Text('プロフィール編集'),
            leading: TextButton(
              child: Text(
                'キャンセル',
                style: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            actions: [
              TextButton(
                  onPressed: () async {
                    await model.updateProfile(context);
                  },
                  child: Text(
                    '変更',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ))
            ],
          ),
          backgroundColor: Colors.orange.shade50,
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: kBackgroundDecoration,
            child: SingleChildScrollView(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: GestureDetector(
                    onTap: () async {
                      // アイコン設定
                      await model.showImagePicker();
                    },
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: ClipOval(
                              child: model.imageFile == null
                                  ? model.imageURL == ""
                                      ? Image.asset(
                                          "assets/images/placeholder.jpg",
                                          height: 100,
                                          width: 100,
                                          fit: BoxFit.cover,
                                        )
                                      : Image.network(
                                          member.imageURL!,
                                          height: 100,
                                          width: 100,
                                          fit: BoxFit.cover,
                                        )
                                  : Image.file(
                                      model.imageFile!,
                                      height: 100,
                                      width: 100,
                                      fit: BoxFit.cover,
                                    )),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: cameraIcon(),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 16, 8, 0),
                  child: Container(
                    height: 400,
                    child: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        _menuItem('ユーザー名', model.userName!, () async {
                          final name = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  EditUserNamePage(model.userName!),
                            ),
                          );
                          if (name != null) {
                            model.changeUserName(name);
                          }
                        }),
                        _menuItem(
                            '地域',
                            PrefectureHelper.from(model.prefecture!).name +
                                '  ' +
                                AreaHelper.from(model.area!).name, () async {
                          final panda = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  EditAreaPage(model.prefecture!, model.area!),
                            ),
                          );
                          print(panda);
                          if (panda != null) {
                            model.changeArea(panda);
                          }
                        }),
                        _menuItem('自己紹介', model.introduction!, () async {
                          final introduction = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  EditIntroductionPage(model.introduction!),
                            ),
                          );
                          if (introduction != null) {
                            model.changeIntroduction(introduction);
                          }
                        }),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ),
        );
      }),
    );
  }

  Widget _menuItem(String title, String present, Function func) {
    return Card(
      child: ListTile(
        trailing: Icon(Icons.keyboard_arrow_right_outlined),
        // leading: icon,
        title: Text('$title'),
        subtitle: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(present),
        ),
        // onTap: () => _launchURL(), // タップ
        onTap: () => func(),
        onLongPress: () {
          print("onLongPress called.");
        }, // 長押し
      ),
    );
  }
}

Widget cameraIcon() {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(
        width: 1,
        color: Colors.grey,
      ),
      shape: BoxShape.circle,
    ),
    child: const SizedBox(
      height: 30,
      child: CircleAvatar(
        backgroundColor: Colors.blueGrey,
        child: Icon(
          Icons.photo_camera_outlined,
          size: 16,
          color: Colors.white,
        ),
      ),
    ),
  );
}
