import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

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

  String _displayText = '0';

  final _buttonBorder = RoundedRectangleBorder(
    side: BorderSide(
      style: BorderStyle.solid,
      width: 1.0,
      color: Colors.deepPurple,
    ),
  );

  final _textButtonStyle = TextStyle(
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
              _displayText,
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
      shape: _buttonBorder,
      child: Text(
        num,
        style: _textButtonStyle,
      ),
      onPressed: () {
        if (_displayText.length < 9) {
          setState(() {
            if (num == '.' && _displayText.contains('.')) return;
            if (_displayText == '0' && num != '.') {
              _displayText = num;
            } else {
              _displayText += num;
            }
          });
        }
      },
    );
  }

  Widget _operatorButton(String opr) {
    return FlatButton(
      padding: EdgeInsets.all(20),
      shape: _buttonBorder,
      child: Text(
        opr,
        style: _textButtonStyle,
      ),
      onPressed: () {
        setState(() {
          if (opr == '=') {
            Parser p = Parser();
            Expression exp = p.parse(_displayText);
            _displayText = exp.evaluate(EvaluationType.REAL, ContextModel()).toString();
          } else {
            _displayText += opr;
          }
        });
      },
    );
  }

  Widget _commandButton(String cmd) {
    return FlatButton(
      padding: EdgeInsets.all(20),
      shape: _buttonBorder,
      child: Text(
        cmd,
        style: _textButtonStyle,
      ),
      onPressed: () {
        setState(() {
          _displayText = '0';
        });
      },
    );
  }
}
