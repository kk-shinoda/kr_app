import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kr_app/logic/has_posted_areas.dart';

class PostModel with ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  var _selectedDate = DateTime.now().toString();
  var _canComment = false;
  final TextEditingController amountController = TextEditingController();
  final TextEditingController commentController = TextEditingController();

  int amount = 0;
  int? postDate;
  String comment = '';
  String userId = '';

  /// 他の処理方法も追加の可能性
  String type = "キエーロ";

  DocumentSnapshot? postUser;

  PostModel() {
    auth = FirebaseAuth.instance;
    userId = auth.currentUser!.uid;
    _init();
  }

  Future _init() async {
    postDate = dateToNumbers(_selectedDate);
    postUser =
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
      postDate = dateToNumbers(_selectedDate);
      notifyListeners();
    }
  }

  void toggleComment() {
    _canComment = !_canComment;
    notifyListeners();
  }

  Future submit() async {
    if (amount == 0) {
      throw ('投入量を記入してください');
    }

    String postArea = postUser!['area'];
    if (!alreadyPostArea!.contains(postArea)) {
      await FirebaseFirestore.instance
          .collection('areas')
          .add({'area': postArea, 'prefecture': postUser!['prefecture']});
    }

    await FirebaseFirestore.instance.collection('posts').add(
      {
        'userId': userId,
        'amount': amount,
        'prefecture': postUser!['prefecture'],
        'area': postUser!['area'],
        'post_date': postDate,
        'type': type
      },
    );

    await FirebaseFirestore.instance
        .collection('users')
        .doc(auth.currentUser!.uid)
        .update(
      {
        'latestPost': Timestamp.now(),
      },
    );

    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('myposts')
        .add(
      {
        'amount': amount,
        'post_date': postDate,
        'comment': comment,
        'type': type
      },
    );
    amount = 0;
    comment = "";
    amountController.clear();
    commentController.clear();
    _selectedDate = DateTime.now().toString();
    notifyListeners();
  }

  int dateToNumbers(String strDate) {
    String tmp = strDate.substring(0, 4) +
        strDate.substring(5, 7) +
        strDate.substring(8, 10);
    return int.parse(tmp);
  }
}
