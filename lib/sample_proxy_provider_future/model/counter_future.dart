import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class CounterFuture with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  Future<void> increment() async {
    try {
      final String url =
          'https://api.countapi.xyz/hit/namespace/provider_sample';
      final response = await http.get(url);
      final convertedResponse = json.decode(response.body);
      _count = convertedResponse['value'];
      notifyListeners();
    } catch (e) {
      print(e);
      throw HttpException(e.toString());
    }
  }
}
