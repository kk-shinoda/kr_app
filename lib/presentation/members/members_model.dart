import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kr_app/domain/member.dart';

import 'package:kr_app/logic/fetch_members.dart';

class MembersModel extends ChangeNotifier {
  bool isLoading = true;
  List<Member>? members;
  int targetMembersLength = 0;
  int todayMembers = 0;
  String? loginMemberID;

  MembersModel() {
    _fetchData();
    loginMemberID = FirebaseAuth.instance.currentUser!.uid;
  }

  Future<void> _fetchData() async {
    startLoading();
    members = await fetchMembersList();
    targetMembersLength = members!.length;
    todayMembers = postTodayMembers(members!);
    endLoading();
  }

  void reload() {
    endLoading();
    _fetchData();
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

  int postTodayMembers(List<Member> members) {
    int count = 0;
    members.forEach((element) {
      final postDay = element.latestPost!.toDate();
      final now = DateTime.now();
      if (postDay.year == now.year &&
          postDay.month == now.month &&
          postDay.day == now.day) {
        count += 1;
      }
    });
    return count;
  }
}
