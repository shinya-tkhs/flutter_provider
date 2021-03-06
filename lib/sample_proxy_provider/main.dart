import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/counter.dart';
import 'model/translator.dart';

// ProxyProviderは、ある Model で発生した変更を他の Model に通知する機能をもっている

class SampleProxyProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Counter(),
        ),
        ProxyProvider<Counter, Translator>(
          // 子孫で ProxyProvider を使って Counter の変更を受け取れるようにする
          update: (context, counter, translator) {
            // Counter で notifyListeners() が呼ばれるたびに update() が呼ばれる
            // counterはCounterのInstance
            // translatorは更新前のTranslatorのInstance
            return Translator(counter.count);
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
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 20),
          child: Text('Number', style: Theme.of(context).textTheme.headline6),
        ),
        Text(
          '${context.watch<Counter>().count}',
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
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 20),
          child:
              Text('Translate', style: Theme.of(context).textTheme.headline6),
        ),
        Text(
          '${context.watch<Translator>().title}',
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
          context.read<Counter>().increment();
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
        'ProxyProvider',
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
