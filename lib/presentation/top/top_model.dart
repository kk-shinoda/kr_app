import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:kr_app/logic/has_posted_areas.dart';

class TopModel with ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  TopModel() {
    _init();
  }

  Future _init() async {
    fetchExistAreas();
  }

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
