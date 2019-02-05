import 'package:flutter/material.dart' hide State;

import 'package:flutter_blocs/src/blocs/blocs.dart'
    show State, StateTransform, AsyncStateBuilder;

class StateTransformBuilder<T, S extends State> extends StatelessWidget {
  const StateTransformBuilder({
    Key key,
    @required this.builder,
    @required this.transformBloc,
  })  : assert(builder != null),
        assert(transformBloc != null),
        super(key: key);

  final StateTransform<T, S> transformBloc;
  final AsyncStateBuilder<T> builder;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      stream: transformBloc.state,
      initialData: transformBloc.initialState,
      builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
        return builder(context, snapshot.data);
      },
    );
  }
}
