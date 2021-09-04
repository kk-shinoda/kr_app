import 'package:kr_app/common/constants.dart';
import 'package:kr_app/domain/area.dart';
import 'package:kr_app/domain/prefecture.dart';
import 'package:kr_app/domain/sex.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kr_app/presentation/top/top_page.dart';
import 'package:provider/provider.dart';

import 'image_setting_page.dart';
import 'profile_setting_model.dart';

class ProfileSettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bottomSpace = MediaQuery.of(context).viewInsets.bottom;
    return ChangeNotifierProvider<ProfileSettingModel>(
      create: (_) => ProfileSettingModel(),
      child: Consumer<ProfileSettingModel>(builder: (context, model, child) {
        return Scaffold(
          appBar: commonAppBar('プロフィール入力'),
          backgroundColor: Colors.orange.shade50,
          resizeToAvoidBottomInset: false,
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: kBackgroundDecoration,
            child: SingleChildScrollView(
              child: Padding(
                padding: model.isEdittingIntroduction
                    ? EdgeInsets.only(bottom: bottomSpace)
                    : EdgeInsets.only(bottom: 0),
                child: GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                            child: TextField(
                              onTap: () {
                                model.toggleIsEdittingIntroduction(false);
                              },
                              textInputAction: TextInputAction.next,
                              maxLength: 8,
                              decoration: InputDecoration(
                                labelText: 'ユーザー名',
                                hintText: 'ユーザー名を入力してください(8文字以下)',
                                hintStyle: TextStyle(fontSize: 12),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              controller: model.userNameController,
                              onChanged: (text) {
                                model.userName = text;
                              },
                            ),
                          ),
                          Container(
                            height: 30,
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  width: 0.3,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 50,
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  width: 0.3,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            child: InkWell(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    '性別',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    model.sex!.name,
                                    style: const TextStyle(
                                      // color: App.primaryColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              onTap: () {
                                // キーボードのフォーカスを外す
                                FocusScope.of(context).unfocus();
                                _sexPicker(context, model);
                              },
                            ),
                          ),
                          Container(
                            height: 50,
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  width: 0.3,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            child: InkWell(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    '都道府県',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    model.prefecture!.name,
                                    style: const TextStyle(
                                      // color: App.primaryColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              onTap: () {
                                // キーボードのフォーカスを外す
                                FocusScope.of(context).unfocus();
                                _prefecturePicker(context, model);
                              },
                            ),
                          ),
                          Container(
                            height: 50,
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  width: 0.3,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            child: InkWell(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'エリア',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    model.area!.name,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              onTap: () {
                                if (model.area != Area.UNSELECTED) {
                                  _areaPicker(context, model);
                                }
                              },
                            ),
                          ),
                          Container(
                            // height: 200,
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  width: 0.3,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            child: Container(
                              padding:
                                  const EdgeInsets.only(top: 12, bottom: 18),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: const Text(
                                      '自己紹介',
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ),
                                  Container(
                                    constraints: const BoxConstraints(
                                      minHeight: 100,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextField(
                                        maxLength: 150,
                                        minLines: 1,
                                        onTap: () {
                                          model.toggleIsEdittingIntroduction(
                                              true);
                                        },
                                        decoration: InputDecoration(
                                            border: InputBorder.none),
                                        textInputAction: TextInputAction.done,
                                        keyboardType: TextInputType.multiline,
                                        maxLines: null,
                                        controller:
                                            model.introductionController,
                                        textCapitalization:
                                            TextCapitalization.sentences,
                                        onChanged: (text) {
                                          model.introduction = text;
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ElevatedButton(
                            child: const Text("次へ"),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.brown.shade400),
                            onPressed: () async {
                              try {
                                await model.signUp();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ImageSettingPage(),
                                  ),
                                );
                              } catch (e) {
                                _showDialog(context, e.toString());
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  /// Pickerの表示構成
  Widget _bottomPicker(Widget picker, BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      padding: const EdgeInsets.only(top: 6),
      color: CupertinoColors.white,
      child: DefaultTextStyle(
        style: const TextStyle(
          color: CupertinoColors.black,
          fontSize: 22,
        ),
        child: GestureDetector(
          onTap: () {},
          child: SafeArea(
            top: false,
            child: picker,
          ),
        ),
      ),
    );
  }

  /// 性別Picker
  Future _sexPicker(BuildContext context, ProfileSettingModel model) async {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        int? index = model.sexIndex;
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color(0xffffffff),
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xff999999),
                    width: 0,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// クパチーノデザインのボタン表示
                  CupertinoButton(
                    child: const Text('キャンセル'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 5,
                    ),
                  ),
                  CupertinoButton(
                    child: const Text('選択'),
                    onPressed: () {
                      model.selectSex(index!);
                      Navigator.pop(context);
                    },
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 5,
                    ),
                  ),
                ],
              ),
            ),

            /// 最下部で表示するPicker
            _bottomPicker(
              CupertinoPicker(
                scrollController:
                    FixedExtentScrollController(initialItem: model.sexIndex),
                itemExtent: 40,
                children: Sex.values.map((item) {
                  return DropdownMenuItem(
                    child: Center(child: Text(item.name)),
                  );
                }).toList(),
                onSelectedItemChanged: (value) {
                  index = value;
                },
              ),
              context,
            ),
          ],
        );
      },
    );
  }

  /// 都道府県Picker
  Future _prefecturePicker(BuildContext context, ProfileSettingModel model) {
    return showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        int index = model.prefectureIndex;
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color(0xffffffff),
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xff999999),
                    width: 0,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// クパチーノデザインのボタン表示
                  CupertinoButton(
                    child: const Text('キャンセル'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 5,
                    ),
                  ),
                  CupertinoButton(
                    child: const Text('選択'),
                    onPressed: () {
                      model.selectPrefecture(index);
                      Navigator.pop(context);
                    },
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 5,
                    ),
                  ),
                ],
              ),
            ),

            /// 最下部で表示するPicker
            _bottomPicker(
              CupertinoPicker(
                scrollController: FixedExtentScrollController(
                    initialItem: model.prefectureIndex),
                itemExtent: 40,
                children: Prefecture.values.map((item) {
                  return DropdownMenuItem(
                    child: Center(child: Text(item.name)),
                  );
                }).toList(),
                onSelectedItemChanged: (value) {
                  index = value;
                },
              ),
              context,
            ),
          ],
        );
      },
    );
  }

  /// エリアPicker
  Future _areaPicker(BuildContext context, ProfileSettingModel model) {
    return showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        int index = model.areaIndex;
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color(0xffffffff),
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xff999999),
                    width: 0,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// クパチーノデザインのボタン表示
                  CupertinoButton(
                    child: const Text('キャンセル'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 5,
                    ),
                  ),
                  CupertinoButton(
                    child: const Text('選択'),
                    onPressed: () {
                      model.selectArea(index);
                      Navigator.pop(context);
                    },
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 5,
                    ),
                  ),
                ],
              ),
            ),

            /// 最下部で表示するPicker
            _bottomPicker(
              CupertinoPicker(
                scrollController:
                    FixedExtentScrollController(initialItem: model.areaIndex),
                itemExtent: 40,
                children: model.prefecture!.areaGroup!.map((item) {
                  return DropdownMenuItem(
                    child: Center(child: Text(item.name)),
                  );
                }).toList(),
                onSelectedItemChanged: (value) {
                  index = value;
                },
              ),
              context,
            ),
          ],
        );
      },
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
