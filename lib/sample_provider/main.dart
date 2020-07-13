import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/counter.dart';
import 'model/translator.dart';

class SampleProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<Counter>(
      create: (context) => Counter(),
      child: CounterWidget(),
    );
  }
}

class CounterWidget extends StatelessWidget {
  const CounterWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 20),
        height: 270,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Title(),
            Number(),
            Translate(),
          ],
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
      ),
    );
  }
}

class Number extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);
    if (counter == null) {
      return Text('loading...');
    }
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 20),
          child: Text('Number', style: Theme.of(context).textTheme.headline6),
        ),
        Text(
          '${counter.count}',
          style: TextStyle(
            color: Color(0xffBF0000),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class Translate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);
    if (counter == null) {
      return Text('loading...');
    }
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 20),
          child:
              Text('Translate', style: Theme.of(context).textTheme.headline6),
        ),
        Text(
          Translator(counter.count).title,
          style: TextStyle(
            color: Color(0xffBF0000),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Provider',
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  SectionTitle(this.title);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        padding: const EdgeInsets.only(
          top: 4,
          bottom: 4,
        ),
        color: Colors.grey[300],
        width: 100,
        height: 40,
        child: Center(
          child: Text(title),
        ),
      ),
    );
  }
}
