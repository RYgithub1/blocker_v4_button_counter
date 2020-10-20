import 'dart:async';
import 'counter_event.dart';



class CounterBloc {
  int _counter = 0;   /// [define valuable and initial]


  /// [EVENT: input(event)->BLoC->output(state)]
  final _counterEventController = StreamController<CounterEvent>();
  // For events, exposing only a sink which in on input.
  Sink<CounterEvent> get counterEventSink => _counterEventController.sink;


  /// [STATE: input(event)->BLoc->output(state)]
  final _counterStateController = StreamController<int>();
  StreamSink<int> get _inCounter => _counterStateController.sink;   /// [input -> sink]
  // For state, exposing only a stream which outpt data.
  Stream<int> get counter => _counterStateController.stream;   /// [output -> stream]


  CounterBloc(){  /// [CounterBloc CLASS 内で CounterBloc(){}  !!]
    // Whenever there is a new event, we want to map it to a new state.
    _counterEventController.stream.listen(_mapEventToState); /// [to listen CounterEvent's output -> mapする]
  }


  /// [sup]
  void _mapEventToState(CounterEvent event) {
    if(event is IncrementEvent){
      _counter++;
    }else{
      _counter--;
    }
    _inCounter.add(_counter);  /// [add the new counter value to SINK side, coz Bloc is 1 way.]
  }


  /// [dispose()] against Memory leak
  void dispose(){
    _counterStateController.close();
    _counterEventController.close();
  }
}