import 'package:flutter/widgets.dart';

import 'package:flutter_blocs/src/blocs/blocs.dart' show Provider;

class BlocProvider<B> extends StatefulWidget {
  final B Function(BuildContext context, B bloc) builder;
  final void Function(BuildContext context, B bloc) onDispose;
  final Widget child;

  BlocProvider({
    Key key,
    @required this.child,
    @required this.builder,
    @required this.onDispose,
  }) : super(key: key);

  @override
  _BlocProviderState<B> createState() => _BlocProviderState<B>();
}

class _BlocProviderState<B> extends State<BlocProvider<B>> {
  B bloc;

  @override
  void initState() {
    super.initState();
    if (widget.builder != null) {
      bloc = widget.builder(context, bloc);
    }
  }

  @override
  void dispose() {
    if (widget.onDispose != null) {
      widget.onDispose(context, bloc);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Provider(
      bloc: bloc,
      child: widget.child,
    );
  }
}
