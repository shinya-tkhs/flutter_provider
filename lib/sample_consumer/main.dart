import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/counter.dart';

class SampleConsumer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Counter(),
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
            Row(
              children: [
                Number_1(),
                Spacer(),
                Button_1(context),
              ],
            ),
            Row(
              children: [
                Number_2(),
                Spacer(),
                Button_2(context),
              ],
            ),
            Row(
              children: [
                Number_3(),
                Spacer(),
                Button_3(context),
              ],
            ),
          ],
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
      ),
    );
  }
}

class Number_1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Selector<Counter, int>(
      selector: (context, state) => state.count_1,
      builder: (_, counter, __) {
        print('Number_1 was rebuild');
        return Text(
          '${counter}',
          style: TextStyle(
            color: Color(0xffBF0000),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        );
      },
    );
  }
}

class Button_1 extends StatelessWidget {
  Button_1(this.context);
  final context;

  @override
  Widget build(context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: InkWell(
        onTap: () {
          context.read<Counter>().increment_1();
        },
        child: SectionTitle('Build w/ Selector 1'),
      ),
    );
  }
}

class Number_2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Selector<Counter, int>(
      selector: (context, state) => state.count_2,
      builder: (_, counter, __) {
        print('Number_2 was rebuild');
        return Text(
          '${counter}',
          style: TextStyle(
            color: Color(0xffBF0000),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        );
      },
    );
  }
}

class Button_2 extends StatelessWidget {
  Button_2(this.context);
  final context;
  @override
  Widget build(context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: InkWell(
        onTap: () {
          context.read<Counter>().increment_2();
        },
        child: SectionTitle('Build w/ Selector 2'),
      ),
    );
  }
}

class Number_3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Counter>(
      builder: (_, counter, __) {
        print('Number_3 was rebuild');
        return Text(
          '${counter.count_3}',
          style: TextStyle(
            color: Color(0xffBF0000),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        );
      },
    );
  }
}

class Button_3 extends StatelessWidget {
  Button_3(this.context);
  final context;

  @override
  Widget build(context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: InkWell(
        onTap: () {
          context.read<Counter>().increment_3();
        },
        child: SectionTitle('Build w/ Consumer'),
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
        'Consumer',
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
        width: 150,
        height: 40,
        child: Center(
          child: Text(title),
        ),
      ),
    );
  }
}
