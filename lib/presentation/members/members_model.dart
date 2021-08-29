import 'package:flutter/material.dart';
import 'package:kr_app/domain/member.dart';

import 'package:kr_app/logic/fetch_members.dart';

class MembersModel extends ChangeNotifier {
  bool isLoading = true;
  List<Member>? members;
  int targetMembersLength = 0;
  MembersModel() {
    startLoading();
    _init();
    // print('members' + members![0].area!);
    endLoading();
  }

  Future _init() async {
    members = await fetchMembersList();
    targetMembersLength = members!.length;
    print(members![0].area);
    notifyListeners();
    // await fetchMembersList();
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
