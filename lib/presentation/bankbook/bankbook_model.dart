import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kr_app/logic/query_posts.dart';
import 'package:kr_app/domain/my_post.dart';

class BankBookModel extends ChangeNotifier {
  FirebaseAuth? auth;
  String userId = '';
  List<List<MyPost>>? posts;
  bool isLoading = true;
  String totalInfo = '';
  List<int>? amounts;
  int currentIndex = 5;

  BankBookModel(BuildContext context) {
    auth = FirebaseAuth.instance;
    userId = FirebaseAuth.instance.currentUser!.uid;
    totalInfo = '';

    _init();
    notifyListeners();
  }

  void turnThePage(int index) {
    currentIndex = index;
    startLoading();
    totalInfo = totalInfo = _formatTotal(amounts!);
    endLoading();
  }

  Future<void> fetchData() async {
    List<List<Object>> myPosts = await queryFromUserId(userId);
    posts = myPosts[0] as List<List<MyPost>>;
    amounts = myPosts[1] as List<int>;
    totalInfo = _formatTotal(amounts!);
    notifyListeners();
  }

  Future<void> deletePost(String postId) async {
    FirebaseFirestore.instance.collection('posts').doc(postId).delete();
    FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('myposts')
        .doc(postId)
        .delete();
    fetchData();
  }

  Future<void> _init() async {
    startLoading();
    fetchData();
    endLoading();
  }

  void startLoading() {
    isLoading = true;
    notifyListeners();
  }

  void endLoading() {
    isLoading = false;
    notifyListeners();
  }

  String _formatTotal(List<int> amount) {
    final formatter = NumberFormat("#,###");
    return "合計： " +
        formatter.format(amounts![currentIndex]).toString() +
        "グラム " +
        (amounts![currentIndex] * 0.03).toStringAsFixed(1) +
        "円";
  }
}
