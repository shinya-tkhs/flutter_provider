import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/counter.dart';
import 'model/translator.dart';

class SampleFutureProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        FutureProvider<CounterFuture>(
          create: (context) async {
            final counterFuture = CounterFuture();
            await counterFuture.increment();
            return counterFuture;
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            int value = 0;
            if (Provider.of<CounterFuture>(context) != null) {
              value = Provider.of<CounterFuture>(context).count;
            }
            return Translator(value);
          },
        ),
      ],
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
            Button(context),
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
    final counter = Provider.of<CounterFuture>(context);
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
    final counter = Provider.of<CounterFuture>(context);
    if (counter == null) {
      return Text('loadibg...');
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

class Button extends StatelessWidget {
  Button(this.context);
  final context;

  @override
  Widget build(context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: InkWell(
        onTap: () {
          context.read<CounterFuture>().increment();
        },
        child: SectionTitle('Increment'),
      ),
    );
  }
}

class Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'FutureProvider',
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
