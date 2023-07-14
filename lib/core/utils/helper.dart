import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension MediaQuaryHelper on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height;

  double get screenWidth => MediaQuery.of(this).size.width;
}

extension NaviagtorHelper on BuildContext {
  void push(String string, [Object? extra]) {
    GoRouter.of(this).push(string, extra: extra);
  }

  void pushReplacement(String string, [Object? extra]) {
    GoRouter.of(this).pushReplacement(string, extra: extra);
  }

  void pushAndRemove(String string, [Object? extra]) {
    GoRouter.of(this).replace(string, extra: extra);
  }
}
