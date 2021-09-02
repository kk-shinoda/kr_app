import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kr_app/common/constants.dart';
import 'package:kr_app/domain/area.dart';
import 'package:kr_app/domain/prefecture.dart';
import 'package:provider/provider.dart';

import 'edit_area_model.dart';

class EditAreaPage extends StatelessWidget {
  final String prefecture;
  final String area;
  EditAreaPage(this.prefecture, this.area);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EditAreaModel>(
      // create: (_) => EditAreaModel()..init(prefecture, area),
      create: (_) => EditAreaModel()..init(prefecture, area),
      child: Consumer<EditAreaModel>(builder: (context, model, child) {
        return Scaffold(
            appBar: commonAppBar('地域変更'),
            backgroundColor: Colors.orange.shade50,
            body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: kBackgroundDecoration,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              '都道府県',
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(
                              model.prefecture!.name,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          _prefecturePicker(context, model);
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              '地域',
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
                          if (model.prefectureIndex != 0) {
                            _areaPicker(context, model);
                          }
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextButton(
                        onPressed: () {
                          final panda = [
                            model.prefecture!.value,
                            model.area!.value
                          ];
                          Navigator.pop(context, panda);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.brown,
                              border: Border.all(color: Colors.brown),
                              borderRadius: BorderRadius.circular(5)),
                          width: 100,
                          height: 30,
                          child: Center(
                              child: Text('決定',
                                  style: TextStyle(color: Colors.white))),
                        )),
                  )
                ],
              ),
            ));
      }),
    );
  }
}

Future _prefecturePicker(BuildContext context, EditAreaModel model) {
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
Future _areaPicker(BuildContext context, EditAreaModel model) {
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
