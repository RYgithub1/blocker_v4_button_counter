import 'dart:async';
import 'counter_event.dart';


class CounterBloc {
  int _counter = 0;

  final _counterStateController = StreamController<int>();
  StreamSink<int> get _inCounter => _counterStateController.sink;

  Stream<int> get counter => _counterStateController.stream;

  final _counterEventController = StreamController<CounterEvent>();

  Sink<CounterEvent> get CounterEventSink _counterEventController.sink;

  CounterBloc(){

    _counterEventController.stream.listen(_mapEventToState);
  }

  





}