import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {dynamic arguments}) {
    if (arguments != null) {
      return Navigator.of(this).pushNamed(routeName, arguments: arguments);
    } else {
      return Navigator.of(this).pushNamed(routeName);
    }
  }

  Future<dynamic> pushReplacementNamed(String routeName, {dynamic arguments}) {
    if (arguments != null) {
      return Navigator.of(this).pushReplacementNamed(routeName, arguments: arguments);
    } else {
      return Navigator.of(this).pushReplacementNamed(routeName);
    }
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName, {dynamic arguments}) {
    if (arguments != null) {
      return Navigator.of(this).pushNamedAndRemoveUntil(
          routeName, ModalRoute.withName('/'), arguments: arguments);
    } else {
      return Navigator.of(this).pushNamedAndRemoveUntil(
          routeName, ModalRoute.withName('/'));
    }
  }

  void pop() {
    Navigator.of(this).pop();
  }
}