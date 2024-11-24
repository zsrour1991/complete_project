import 'package:flutter/cupertino.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) =>
      Navigator.of(this).pushNamed(routeName, arguments: arguments);

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) =>
      Navigator.of(this).pushReplacementNamed(routeName, arguments: arguments);

  Future<dynamic> pushNamedAndRemoveUntil(String routeName,
          {Object? arguments, required RoutePredicate predicate}) =>
      Navigator.of(this)
          .pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);

  void pop() => Navigator.of(this).pop();
}

extension StringExtension on String? {
  bool isNullOrEmpty() => this == null || this == "";
}
extension ListExtension<T> on List<T>? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;
}
extension MapExtension<X,V> on Map<X,V>? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;
}
