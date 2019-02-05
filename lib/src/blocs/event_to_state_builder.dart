import 'package:flutter/material.dart';

import 'package:flutter_blocs/src/blocs/blocs.dart' show Event, EventToState;

typedef Widget AsyncStateBuilder<State>(BuildContext context, State state);

class EventToStateBuilder<State> extends StatelessWidget {
  const EventToStateBuilder({
    Key key,
    @required this.builder,
    @required this.bloc,
  })  : assert(builder != null),
        assert(bloc != null),
        super(key: key);

  final EventToState<Event, State> bloc;
  final AsyncStateBuilder<State> builder;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<State>(
      stream: bloc.state,
      initialData: bloc.initialState,
      builder: (BuildContext context, AsyncSnapshot<State> snapshot) {
        return builder(context, snapshot.data);
      },
    );
  }
}
