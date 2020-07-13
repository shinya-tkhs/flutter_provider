import 'package:flutter/cupertino.dart';

class Translator with ChangeNotifier {
  Translator(this._value);

  final int _value;

  String get title => 'You clicked $_value times';
}
