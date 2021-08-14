import 'package:kr_app/domain/area.dart';
import 'package:kr_app/domain/prefecture.dart';
import 'package:kr_app/domain/sex.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kr_app/presentation/top/top_page.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart' as DateFormat;

import 'profile_setting_model.dart';

class ProfileSettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bottomSpace = MediaQuery.of(context).viewInsets.bottom;
    final size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<ProfileSettingModel>(
      create: (_) => ProfileSettingModel(),
      child: Consumer<ProfileSettingModel>(builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('プロフィール入力'),
            backgroundColor: Colors.brown.shade400,
          ),
          backgroundColor: Colors.orange.shade50,
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            reverse: true,
            child: Padding(
              padding: model.isEdittingIntroduction
                  ? EdgeInsets.only(bottom: bottomSpace)
                  : EdgeInsets.only(bottom: 0),
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Scrollbar(
                  child: SingleChildScrollView(
                    child: SafeArea(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              // ↓次の遷移画面でプロフィール画像を追加。
                              // GestureDetector(
                              //   onTap: () async {
                              //     // アイコン設定
                              //     // await model.showImagePicker();
                              //   },
                              //   child: Stack(
                              //     children: [
                              //       ClipOval(
                              //         child: Container(
                              //           color: Colors.white,
                              //           child: model.imageFile != null
                              //               ? Image.file(
                              //                   model.imageFile,
                              //                   height: 140,
                              //                   width: 140,
                              //                   fit: BoxFit.cover,
                              //                 )
                              //               : const Icon(
                              //                   Icons.account_circle,
                              //                   size: 140,
                              //                   color: Colors.grey,
                              //                 ),
                              //         ),
                              //       ),
                              //       Positioned(
                              //         right: 0,
                              //         bottom: 0,
                              //         child: cameraIcon(),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              const SizedBox(
                                height: 40,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(30, 0, 30, 0),
                                child: TextField(
                                  onTap: () {
                                    model.toggleIsEdittingIntroduction(false);
                                  },
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    labelText: 'ユーザーネーム',
                                    hintText: 'ユーザーネームを入力してください',
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
                              const SizedBox(
                                height: 20,
                              ),

                              Container(
                                height: 50,
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
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
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
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
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
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
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
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
                                          // color: App.primaryColor,
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
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      width: 0.3,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      top: 12, bottom: 18),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Container(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: const Text(
                                          '自己紹介',
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                      ),
                                      Container(
                                        constraints: const BoxConstraints(
                                          minHeight: 150,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextField(
                                            maxLength: 150,
                                            onTap: () {
                                              model
                                                  .toggleIsEdittingIntroduction(
                                                      true);
                                            },
                                            decoration: InputDecoration(
                                                border: InputBorder.none),
                                            textInputAction:
                                                TextInputAction.done,
                                            keyboardType:
                                                TextInputType.multiline,
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
                              const SizedBox(
                                height: 20,
                              ),
                              ElevatedButton(
                                child: const Text("登録"),
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.brown.shade400),
                                onPressed: () async {
                                  await model.signUp();
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => TopPage(),
                                    ),
                                  );
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
            ),
          ),
        );
      }),
    );
  }

  /// カメラアイコン
  Widget cameraIcon() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          // color: App.primaryColor,
        ),
        shape: BoxShape.circle,
      ),
      child: const SizedBox(
        height: 30,
        child: CircleAvatar(
          // backgroundColor: App.primaryColor,
          child: Icon(
            Icons.photo_camera_outlined,
            size: 16,
            color: Colors.white,
          ),
        ),
      ),
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
