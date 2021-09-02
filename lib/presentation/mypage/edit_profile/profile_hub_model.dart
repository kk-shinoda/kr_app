import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kr_app/domain/member.dart';

class ProfileHubModel extends ChangeNotifier {
  final Member member;
  File? imageFile;
  FirebaseAuth auth = FirebaseAuth.instance;
  String? userName;
  String? prefecture;
  String? area;
  String? introduction;
  String imageURL = '';
  bool isLoading = false;

  ProfileHubModel(this.member) {
    userName = member.userName;
    prefecture = member.prefecture;
    area = member.area;
    introduction = member.introduction;
    imageURL = member.imageURL!;
  }

  Future showImagePicker() async {
    final picker = ImagePicker();
    final pickerFile = await picker.pickImage(source: ImageSource.gallery);
    imageFile = File(pickerFile!.path);
    notifyListeners();
  }

  void changeArea(List<String> panda) {
    if (prefecture != panda[0] || area != panda[1]) {
      prefecture = panda[0];
      area = panda[1];
      notifyListeners();
    }
  }

  void changeUserName(String name) {
    if (userName != name) {
      userName = name;
      notifyListeners();
    }
  }

  Future<String> uploadImage() async {
    final String uid = auth.currentUser!.uid;
    final storage = FirebaseStorage.instance;
    final TaskSnapshot snapshot =
        await storage.ref().child("users/$uid/ProfileIcon").putFile(imageFile!);
    final String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  void changeIntroduction(String introduction) {
    if (this.introduction != introduction) {
      this.introduction = introduction;
      notifyListeners();
    }
  }

  Future<void> updateProfile(BuildContext context) async {
    startLoading();
    if (imageFile == null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(auth.currentUser!.uid)
          .update({
        'userName': userName,
        'prefecture': prefecture,
        'area': area,
        'introduction': introduction,
      });
    } else {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(auth.currentUser!.uid)
          .update(
        {
          'userName': userName,
          'prefecture': prefecture,
          'area': area,
          'introduction': introduction,
          'imageURL': await uploadImage()
        },
      );
    }

    endLoading();
    Navigator.pop(context, true);
  }

  void startLoading() {
    isLoading = true;
    notifyListeners();
  }

  void endLoading() {
    isLoading = false;
    notifyListeners();
  }
}
