import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import 'package:kr_app/domain/member.dart';

class BankBookModel extends ChangeNotifier {
  final Stream<QuerySnapshot> _postsStream =
      FirebaseFirestore.instance.collection('posts').snapshots();

  FirebaseAuth? auth;
  Member? member;

  // BankBookModel() {
  //   auth = FirebaseAuth.instance;
  //   // member = null;
  //   _init();
  //   notifyListeners();
  // }

  // Future _init() async {
  //   final doc = await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(auth!.currentUser!.uid)
  //       .get();
  //   if (member != null){
  //     member = Member(member);
  //   }

  // }

  // Future<void> fetchPostList() async {
  //   try {
  //     final docs = await FirebaseFirestore.instance.collection('users').collection('posts').orderBy('createdAt', descending: true).get();
  //     final posts = docs.docs.map((docs) => Post(docs)).toList();
  //     this.posts = posts;
  //   } on Exception catch (e) {
  //     print(e);
  //   }
  //   notifyListeners();
  // }

}
