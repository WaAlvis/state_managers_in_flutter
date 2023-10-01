import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _count = 0;

  int get countValue => _count;

  void incrementCounter() {
    _count++;
    print('Change value Counter $_count, with Provider');
    notifyListeners();
  }

  void resetCounter() {
    _count = 0;
    print('Change value Counter $_count, with Provider');
    notifyListeners();
  }
}
