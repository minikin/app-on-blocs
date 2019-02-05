import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

import 'package:flutter_blocs/src/blocs/blocs.dart';

/// Based class used for the transformation of a states
abstract class StateTransform<T, S extends BlocState> implements Disposable {
  /// Initial State
  final T initialState;

  /// Transformed States
  BehaviorSubject<T> _stateController = BehaviorSubject<T>();
  Stream<T> get state => _stateController;

  /// [Must Override] state handler
  Stream<T> stateHandler({T currentState, S newState});

  /// Constructor
  StateTransform({
    @required this.initialState,
    @required EventToState<BlocEvent, BlocState> blocIn,
  }) {
    assert(blocIn != null);
    assert(blocIn is StateTransform<BlocEvent, BlocState>);

    blocIn.state.listen((BlocState stateIn) {
      T currentState = _stateController.value ?? initialState;

      stateHandler(currentState: currentState, newState: stateIn)
          .forEach((T newState) {
        _stateController.sink.add(newState);
      });
    });
  }

  @override
  void dispose() {
    _stateController?.close();
  }
}
