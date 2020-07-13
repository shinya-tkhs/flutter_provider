import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterbloc/sample_consumer/main.dart';
import 'sample_change_notifier_proxy_provider/main.dart';
import 'sample_future_provider/main.dart';
import 'sample_provider/main.dart';
import 'sample_proxy_provider_future/main.dart';
import 'sample_proxy_provider/main.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: MaterialApp(
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        padding: const EdgeInsets.only(left: 12, right: 12),
        color: Colors.white,
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            IntrinsicHeight(
              child: Container(
                height: 300,
                padding: EdgeInsets.all(12.0),
                child: SampleProxyProvider(),
              ),
            ),
            IntrinsicHeight(
              child: Container(
                height: 300,
                padding: EdgeInsets.all(12.0),
                child: SampleProxyProviderFuture(),
              ),
            ),
            IntrinsicHeight(
              child: Container(
                height: 300,
                padding: EdgeInsets.all(12.0),
                child: SampleChangeNotifierProxyProvider(),
              ),
            ),
            IntrinsicHeight(
              child: Container(
                height: 300,
                padding: EdgeInsets.all(12.0),
                child: SampleProvider(),
              ),
            ),
            IntrinsicHeight(
              child: Container(
                height: 300,
                padding: EdgeInsets.all(12.0),
                child: SampleFutureProvider(),
              ),
            ),
            IntrinsicHeight(
              child: Container(
                height: 300,
                padding: EdgeInsets.all(12.0),
                child: SampleConsumer(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
