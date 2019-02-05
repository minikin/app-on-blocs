import 'package:flutter/widgets.dart';

Type _getType<B>() => B;

class Provider<B> extends InheritedWidget {
  final B bloc;

  const Provider({
    Key key,
    this.bloc,
    Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(Provider oldWidget) => false;

  static B of<B>(BuildContext context) {
    final type = _getType<Provider<B>>();
    final Provider<B> provider = context.inheritFromWidgetOfExactType(type);
    return provider.bloc;
  }
}
