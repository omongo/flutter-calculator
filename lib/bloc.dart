import 'package:bloc/bloc.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorBloc extends Bloc<Event, String> {
  @override
  String get initialState => '0';

  @override
  Stream<String> mapEventToState(Event event) async* {
    if (event is NumEvent) {
      yield* _onNumPressed(event.num);
    }

    if (event is OprEvent) {
      yield* _onOprPressed(event.opr);
    }

    if (event is CmdEvent) {
      yield* _onCmdPressed();
    }
  }

  Stream<String> _onNumPressed(num) async* {
    if (num == '.' && currentState.contains('.')) return;
    if (currentState == '0' && num != '.') {
      yield num;
    } else {
      yield currentState + num;
    }
  }

  Stream<String> _onOprPressed(opr) async* {
    if (opr == '=') {
      Parser p = Parser();
      Expression exp = p.parse(currentState);
      yield exp.evaluate(EvaluationType.REAL, ContextModel()).toString();
    } else {
      yield currentState + opr;
    }
  }

  Stream<String> _onCmdPressed() async* {
    yield '0';
  }
}

abstract class Event {}

class NumEvent extends Event {
  final String num;

  NumEvent({this.num});
}

class OprEvent extends Event {
  final String opr;

  OprEvent({this.opr});
}

class CmdEvent extends Event {}
