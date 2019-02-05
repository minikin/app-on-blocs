import 'package:flutter/material.dart';

import 'package:flutter_blocs/src/blocs/blocs.dart'
    show BlocEvent, EventToState;

typedef Widget AsyncStateBuilder<BlocState>(
    BuildContext context, BlocState state);

class EventToStateBuilder<BlocState> extends StatelessWidget {
  const EventToStateBuilder({
    Key key,
    @required this.builder,
    @required this.bloc,
  })  : assert(builder != null),
        assert(bloc != null),
        super(key: key);

  final EventToState<BlocEvent, BlocState> bloc;
  final AsyncStateBuilder<BlocState> builder;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<BlocState>(
      stream: bloc.state,
      initialData: bloc.initialState,
      builder: (BuildContext context, AsyncSnapshot<BlocState> snapshot) {
        return builder(context, snapshot.data);
      },
    );
  }
}
