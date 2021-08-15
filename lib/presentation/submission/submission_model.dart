import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SubmissionModel with ChangeNotifier {
  var _selectedDate = DateTime.now().toString();
  var _canComment = false;
  final TextEditingController amountController = TextEditingController();
  final TextEditingController commentController = TextEditingController();

  int amount = 0;
  String? postDate;
  String comment = '';
  String userId = '';

  /// 他の処理方法も追加の可能性
  String type = "キエーロ";

  DocumentSnapshot? member;

  SubmissionModel() {
    userId = FirebaseAuth.instance.currentUser!.uid;
    _init();
  }

  Future _init() async {
    postDate = _selectedDate.substring(0, 10);
    member =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();
  }

  String get selectDate => _selectedDate;
  bool get canComment => _canComment;

  Future<void> setSelectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );
    if (selected != null) {
      _selectedDate = selected.toString();
      postDate = _selectedDate.substring(0, 10);
      notifyListeners();
    }
  }

  void toggleComment() {
    _canComment = !_canComment;
    notifyListeners();
  }

  Future submit() async {
    final String postYear = _selectedDate.substring(0, 4);
    final String postMonth = _selectedDate.substring(5, 7);

    if (amount == 0) {
      throw ('投入量を記入してください');
    }

    await FirebaseFirestore.instance
        .collection('posts')
        .doc(postYear)
        .collection(postMonth)
        .add(
      {
        'userId': userId,
        'createdAt': Timestamp.now(),
        'amount': amount,
        'prefecture': member!['prefecture'],
        'area': member!['area'],
        'post_date': postDate,
        'type': type
      },
    );

    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('posts')
        .doc(postYear)
        .collection(postMonth)
        .add(
      {
        'amount': amount,
        'post_date': postDate,
        'comment': comment,
        'type': type
      },
    );
    amount = 0;
    amountController.clear();
    commentController.clear();
    _selectedDate = DateTime.now().toString();
    notifyListeners();
  }
}
