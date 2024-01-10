import 'package:flutter/material.dart';

extension GetArgument on BuildContext {
  T? getArgument<T>() {
    final modalRoute = ModalRoute.of(this);
    if (modalRoute != null) {
      final argument = modalRoute.settings.arguments;
      if (argument != null && argument is T) {
        return argument as T;
      }
    }
    return null;
  }
}
