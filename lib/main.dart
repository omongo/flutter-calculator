import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_calculator/bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => CalculatorBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
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
  CalculatorBloc bloc;

  @override
  void didChangeDependencies() {
    bloc = BlocProvider.of<CalculatorBloc>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print('Build All');

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.purple,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              BlocBuilder<CalculatorBloc, String>(
                bloc: bloc,
                builder: (context, state) {
                  return _Output(
                    displayText: state,
                  );
                },
              ),
              _Input(
                numPressed: _onNumPressed,
                oprPressed: _onOprPressed,
                cmdPressed: _onCmdPressed,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onNumPressed(num) {
    bloc.dispatch(NumEvent(num: num));
  }

  void _onOprPressed(opr) {
    bloc.dispatch(OprEvent(opr: opr));
  }

  void _onCmdPressed(cmd) {
    bloc.dispatch(CmdEvent());
  }
}

class _Input extends StatelessWidget {
  final Function(String) numPressed;
  final Function(String) oprPressed;
  final Function(String) cmdPressed;

  _Input({Key key, this.cmdPressed, this.numPressed, this.oprPressed}) : super(key: key);

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
        if (numPressed != null) {
          numPressed(num);
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
        if (oprPressed != null) {
          oprPressed(opr);
        }
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
        if (cmdPressed != null) {
          cmdPressed(cmd);
        }
      },
    );
  }
}

class _Output extends StatefulWidget {
  final displayText;

  _Output({Key key, this.displayText = '0'}) : super(key: key);

  @override
  _OutputState createState() => _OutputState();
}

class _OutputState extends State<_Output> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.white,
        child: Align(
          alignment: Alignment.centerRight,
          child: AutoSizeText(
            widget.displayText,
            style: TextStyle(
              fontSize: 80,
            ),
            maxLines: 1,
          ),
        ),
      ),
    );
  }
}
