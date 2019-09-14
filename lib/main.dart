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

  final textButtonStyle = TextStyle(
    color: Colors.deepPurple[100],
    fontSize: 40,
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
    return Expanded(
      child: Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              '0',
              style: TextStyle(
                fontSize: 80,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _input() {
    return Container(
      color: Colors.deepPurple[800],
      child: Column(
        children: <Widget>[
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: _commandButton('C'),
                ),
                Expanded(
                  flex: 1,
                  child: _operatorButton('/'),
                ),
              ],
            ),
          ),
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: _numButton('7'),
                ),
                Expanded(
                  child: _numButton('8'),
                ),
                Expanded(
                  child: _numButton('9'),
                ),
                Expanded(
                  child: _operatorButton('x'),
                ),
              ],
            ),
          ),
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: _numButton('4'),
                ),
                Expanded(
                  child: _numButton('5'),
                ),
                Expanded(
                  child: _numButton('6'),
                ),
                Expanded(
                  child: _operatorButton('-'),
                ),
              ],
            ),
          ),
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: _numButton('1'),
                ),
                Expanded(
                  child: _numButton('2'),
                ),
                Expanded(
                  child: _numButton('3'),
                ),
                Expanded(
                  child: _operatorButton('+'),
                ),
              ],
            ),
          ),
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: _numButton('0'),
                ),
                Expanded(
                  child: _numButton('.'),
                ),
                Expanded(
                  child: _operatorButton('='),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _numButton(String num) {
    return FlatButton(
      padding: EdgeInsets.all(20),
      shape: buttonBorder,
      child: Text(
        num,
        style: textButtonStyle,
      ),
      onPressed: () {},
    );
  }

  Widget _operatorButton(String opr) {
    return FlatButton(
      padding: EdgeInsets.all(20),
      shape: buttonBorder,
      child: Text(
        opr,
        style: textButtonStyle,
      ),
      onPressed: () {},
    );
  }

  Widget _commandButton(String cmd) {
    return FlatButton(
      padding: EdgeInsets.all(20),
      shape: buttonBorder,
      child: Text(
        cmd,
        style: textButtonStyle,
      ),
      onPressed: () {},
    );
  }
}
