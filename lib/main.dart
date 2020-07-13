import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(
        title: 'Flutter Demo Home Page',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
    this.title,
    this.todoList,
  }) : super(key: key);
  final String title;
  final List<Map<String, dynamic>> todoList;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<Map<String, dynamic>> _todoList = [
    {
      'title': 'ドキュメントをまとめる',
      'done': false,
    },
    {
      'title': '要件定義をする',
      'done': false,
    },
    {
      'title': 'コーディングする',
      'done': false,
    }
  ];

  void _countDoneTask(List<Map<String, dynamic>> todoList) {
    int _numOfDone = 0;
    todoList.forEach((Map<String, dynamic> item) {
      if (item['done']) {
        _numOfDone++;
      }
    });
    setState(() {
      _counter = _numOfDone;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _todoListWidgets() {
      List<Widget> todoListWidget = [];
      for (var i = 0; i < _todoList.length; i++) {
        final String title = _todoList[i]['title'];
        final bool done = _todoList[i]['done'];
        todoListWidget.add(
          new CheckboxListTile(
            activeColor: Colors.blue,
            title: Text(title),
            secondary: new Icon(
              Icons.thumb_up,
              color: done ? Colors.orange[700] : Colors.grey[500],
            ),
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: (bool val) {
              setState(() {
                _todoList[i]['done'] = val;
                _countDoneTask(_todoList);
              });
            },
            value: done,
          ),
        );
      }

      return todoListWidget;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Column(
                children: _todoListWidgets(),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Text(
                '$_counter / ${_todoList.length}',
                style: Theme.of(context).textTheme.display1,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10.0),
              child: Text(
                _counter == _todoList.length ? '今日の仕事は終わり 💪' : '仕事がんばれ 😱',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _countDoneTask(widget.todoList),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
