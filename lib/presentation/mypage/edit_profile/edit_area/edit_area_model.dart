import 'package:flutter/material.dart';
import 'package:kr_app/domain/area.dart';
import 'package:kr_app/domain/prefecture.dart';

class EditAreaModel extends ChangeNotifier {
  Prefecture? prefecture;
  Area? area;

  int prefectureIndex = 0;
  int areaIndex = 0;

  EditAreaModel();

  init(String prefecture, String area) {
    prefectureIndex = PrefectureHelper.from(prefecture).index;
    areaIndex = AreaHelper.from(area).index;
    this.prefecture = PrefectureHelper.from(prefecture);
    this.area = AreaHelper.from(area);
  }

  void selectPrefecture(int index) {
    if (prefecture != Prefecture.values[index]) {
      prefecture = Prefecture.values[index];
      prefectureIndex = index;
      area = prefecture == Prefecture.UNSELECTED
          ? Area.UNSELECTED
          : prefecture!.areaGroup!.elementAt(0);
      areaIndex = 0;
    }
    notifyListeners();
  }

  void selectArea(int index) {
    area = prefecture!.areaGroup!.elementAt(index);
    areaIndex = index;
    notifyListeners();
  }
}
