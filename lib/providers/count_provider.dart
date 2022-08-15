import 'package:flutter/cupertino.dart';

class CountNotifier with ChangeNotifier {
  int tempCount  = 10;
  // int  = 0;
  // int  = 0;
  get addCount => tempCount;
  get reduceCount => tempCount;
  countIncrement(int count) {
    tempCount = count++;
    notifyListeners();
  }
  countDecrement(int count) {
    tempCount = count++;
    notifyListeners();
  }
}
