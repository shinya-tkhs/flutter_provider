import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Counter with ChangeNotifier {
  int _count_1 = 0;
  int _count_2 = 50;
  int _count_3 = 100;

  int get count_1 => _count_1;
  int get count_2 => _count_2;
  int get count_3 => _count_3;

  void increment_1() {
    _count_1++;
    notifyListeners();
  }

  void increment_2() {
    _count_2++;
    notifyListeners();
  }

  void increment_3() {
    _count_3++;
    notifyListeners();
  }
}
