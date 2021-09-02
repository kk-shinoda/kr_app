import 'package:kr_app/domain/area.dart';
import 'package:kr_app/domain/prefecture.dart';
import 'package:kr_app/domain/sex.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileSettingModel extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  String? userName;
  DateTime? bymd;
  Sex? sex;
  Prefecture? prefecture;
  Area? area;
  String introduction = "";
  int sexIndex = 0;
  int prefectureIndex = 0;
  int areaIndex = 0;
  bool isCommentPublic = true;
  DateTime? latestPost;

  bool isEdittingIntroduction = false;

  final userNameController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final introductionController = TextEditingController();

  ProfileSettingModel() {
    auth = FirebaseAuth.instance;
    userName = '';
    sex = Sex.UNSELECTED;
    prefecture = Prefecture.UNSELECTED;
    area = Area.UNSELECTED;
    introduction = '';
    sexIndex = 0;
    prefectureIndex = 0;
    areaIndex = 0;
    latestPost = DateTime.now();
    latestPost = latestPost!.add(Duration(days: -1));
    notifyListeners();
  }

  Future signUp() async {
    if (userName!.isEmpty) {
      throw ('ユーザー名を入力してください。');
    }

    final String sex = this.sex!.value;
    final String prefecture = this.prefecture!.value;
    final String area = this.area!.value;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(auth.currentUser!.uid)
        .update(
      {
        'userId': auth.currentUser!.uid,
        'imageURL': "",
        'userName': userName,
        'sex': sex,
        'prefecture': prefecture,
        'area': area,
        'introduction': introduction,
        'latestPost': Timestamp.fromDate(latestPost!),
        'isCommentPublic': isCommentPublic
      },
    );
  }

  void toggleIsEdittingIntroduction(bool b) {
    isEdittingIntroduction = b;
    notifyListeners();
  }

  void selectSex(int index) {
    sex = Sex.values[index];
    sexIndex = index;
    notifyListeners();
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
