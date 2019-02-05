import 'dart:async';

import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

import 'package:flutter_blocs/src/blocs/blocs.dart' show Disposable;

abstract class BlocEvent {}

abstract class BlocState {}

abstract class EventToState<Event, State> implements Disposable {
  PublishSubject<Event> _eventController = PublishSubject<Event>();
  BehaviorSubject<State> _stateController = BehaviorSubject<State>();

  /// To be invoked to emit an event
  Function(Event) get emitEvent => _eventController.sink.add;

  /// Current/New state
  Stream<State> get state => _stateController.stream;

  /// Last State
  State get lastState => _stateController.value;

  /// External processing of the event
  Stream<State> eventHandler(Event event, State currentState);

  final State initialState;

  EventToState({
    @required this.initialState,
  }) {
    // For each received event, we invoke the [eventHandler] and
    // emit any resulting newState
    _eventController.listen(
      (Event event) {
        State currentState = lastState ?? initialState;
        eventHandler(event, currentState).forEach(
          (State newState) {
            _stateController.sink.add(newState);
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _eventController.close();
    _stateController.close();
  }
}
