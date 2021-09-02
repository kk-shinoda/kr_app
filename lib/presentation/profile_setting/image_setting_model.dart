import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kr_app/presentation/top/top_page.dart';

class ImageSettingModel extends ChangeNotifier {
  File? imageFile;
  FirebaseAuth auth = FirebaseAuth.instance;
  String? userName;
  String? prefecture;
  String? area;
  String? introduction;
  String imageURL = '';
  bool isLoading = false;

  Future showImagePicker() async {
    final picker = ImagePicker();
    final pickerFile = await picker.pickImage(source: ImageSource.gallery);
    imageFile = File(pickerFile!.path);
    notifyListeners();
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

  Future<void> updateImage(BuildContext context) async {
    startLoading();
    if (imageFile != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(auth.currentUser!.uid)
          .update(
        {'imageURL': await uploadImage()},
      );
    }

    endLoading();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => TopPage(),
      ),
    );
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
