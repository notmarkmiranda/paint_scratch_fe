import 'package:flutter/foundation.dart';

class Counter with ChangeNotifier {
  Map<String, int> counterVariables = {
    'numberOfInnings': 5,
    'outsPerInning': 3,
    'foulsStrikesPerOut': 4,
    'ballsPerWalk': 4,
  };
  int numberOfInnings = 5;

  void increment(String key) {
    counterVariables[key]++;
    notifyListeners();
  }

  void decrement(String key) {
    if (counterVariables[key] > 1) { counterVariables[key]--; }
    notifyListeners();
  }
}