import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
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

  BankBookModel() {
    auth = FirebaseAuth.instance;
    userId = FirebaseAuth.instance.currentUser!.uid;
    totalInfo = '';
    // member = null;
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
