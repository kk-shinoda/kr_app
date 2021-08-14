import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SubmissionModel with ChangeNotifier {
  var _selectedDate = DateTime.now().toString();
  var _canComment = false;

  String get selectDate => _selectedDate;
  bool get canComment => _canComment;

  Future<void> setSelectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      // Low initialDateの設定
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );
    if (selected != null) {
      _selectedDate = selected.toString();
      notifyListeners();
    }
  }

  void printID() {
    print(FirebaseAuth.instance.currentUser!.uid);
  }

  void toggleComment() {
    _canComment = !_canComment;
    notifyListeners();
  }
}
