import 'package:flutter/cupertino.dart';

class Translator {
  Translator({this.value_1, this.value_2});

  final int value_1;
  final int value_2;

  String get title_1 => 'Title 1: You clicked $value_1 times';
  String get title_2 => 'Title 2: You clicked $value_2 times';
}
