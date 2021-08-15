import 'dart:io';

import 'package:kr_app/domain/area.dart';
import 'package:kr_app/domain/prefecture.dart';
import 'package:kr_app/domain/sex.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

class ProfileSettingModel extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  // File? imageFile;
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

  bool isEdittingIntroduction = false;

  final userNameController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final introductionController = TextEditingController();

  ProfileSettingModel() {
    auth = FirebaseAuth.instance;
    // imageFile = null;
    userName = '';
    sex = Sex.UNSELECTED;
    prefecture = Prefecture.UNSELECTED;
    area = Area.UNSELECTED;
    introduction = '';
    sexIndex = 0;
    prefectureIndex = 0;
    areaIndex = 0;
    notifyListeners();
  }

  // Future showImagePicker() async {
  //   final picker = ImagePicker();
  //   final pickerFile = await picker.getImage(source: ImageSource.gallery);
  //   imageFile = File(pickerFile.path);
  //   notifyListeners();
  // }

  // Future<String> _uploadImage() async {
  //   final String uid = auth.currentUser!.uid;
  //   final storage = FirebaseStorage.instance;
  //   final TaskSnapshot snapshot = await storage
  //       .ref()
  //       .child("beauticians/$uid/ProfileIcon")
  //       .putFile(imageFile);
  //   final String downloadUrl = await snapshot.ref.getDownloadURL();
  //   return downloadUrl;
  // }

  Future signUp() async {
    if (userName!.isEmpty) {
      throw ('ユーザーネームを入力してください。');
    }

    // String iconImageURL = '';
    // if (imageFile != null) {
    //   iconImageURL = await _uploadImage();
    // }
    final String sex = this.sex!.value;
    final String prefecture = this.prefecture!.value;
    final String area = this.area!.value;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(auth.currentUser!.uid)
        .set(
      {
        'userId': auth.currentUser!.uid,
        // 'iconImageURL': iconImageURL,
        'userName': userName,
        'sex': sex,
        'prefecture': prefecture,
        'area': area,
        'introduction': introduction,
        'latestPost': Timestamp.now(),
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
