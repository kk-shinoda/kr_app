import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

// class TopModel extends ChangeNotifier {
//   int _currentIndex = 0;

//   int get currentIndex => _currentIndex;

//   set currentIndex(int index) {
//     _currentIndex = index;
//     notifyListeners();
//   }
// }

class TopModel with ChangeNotifier, DiagnosticableTreeMixin {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
