import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final buttonBorder = RoundedRectangleBorder(
    side: BorderSide(
      style: BorderStyle.solid,
      width: 1.0,
      color: Colors.deepPurple,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.purple,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _output(),
              _input(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _output() {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            '0',
            style: TextStyle(
              fontSize: 100,
            ),
          ),
        ],
      ),
    );
  }

  Widget _input() {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: FlatButton(
                shape: buttonBorder,
                child: Text('C'),
                onPressed: () {},
              ),
            ),
            Expanded(
              flex: 1,
              child: FlatButton(
                shape: buttonBorder,
                child: Text('/'),
                onPressed: () {},
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
                child: FlatButton(
                  shape: buttonBorder,
                  child: Text('7'),
                  onPressed: () {},
                )),
            Expanded(
                child: FlatButton(
                  shape: buttonBorder,
                  child: Text('8'),
                  onPressed: () {},
                )),
            Expanded(
                child: FlatButton(
                  shape: buttonBorder,
                  child: Text('9'),
                  onPressed: () {},
                )),
            Expanded(
                child: FlatButton(
                  shape: buttonBorder,
                  child: Text('x'),
                  onPressed: () {},
                )),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
                child: FlatButton(
                  shape: buttonBorder,
                  child: Text('4'),
                  onPressed: () {},
                )),
            Expanded(
                child: FlatButton(
                  shape: buttonBorder,
                  child: Text('5'),
                  onPressed: () {},
                )),
            Expanded(
                child: FlatButton(
                  shape: buttonBorder,
                  child: Text('6'),
                  onPressed: () {},
                )),
            Expanded(
                child: FlatButton(
                  shape: buttonBorder,
                  child: Text('-'),
                  onPressed: () {},
                )),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
                child: FlatButton(
                  shape: buttonBorder,
                  child: Text('1'),
                  onPressed: () {},
                )),
            Expanded(
                child: FlatButton(
                  shape: buttonBorder,
                  child: Text('2'),
                  onPressed: () {},
                )),
            Expanded(
                child: FlatButton(
                  shape: buttonBorder,
                  child: Text('3'),
                  onPressed: () {},
                )),
            Expanded(
                child: FlatButton(
                  shape: buttonBorder,
                  child: Text('+'),
                  onPressed: () {},
                )),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
                flex: 2,
                child: FlatButton(
                  shape: buttonBorder,
                  child: Text('0'),
                  onPressed: () {},
                )),
            Expanded(
                child: FlatButton(
                  shape: buttonBorder,
                  child: Text('.'),
                  onPressed: () {},
                )),
            Expanded(
                child: FlatButton(
                  shape: buttonBorder,
                  child: Text('='),
                  onPressed: () {},
                )),
          ],
        ),
      ],
    );
  }
}
