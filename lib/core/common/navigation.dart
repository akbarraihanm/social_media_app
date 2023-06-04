import 'package:flutter/material.dart';

class AppNav {

  static Future push({
    required BuildContext context,
    required String routeName,
    dynamic arguments,
  }) {
    return Navigator.pushNamed(context, routeName, arguments: arguments);
  }

  static Future replace({
    required BuildContext context,
    required String routeName,
    dynamic arguments,
  }) {
    return Navigator.pushReplacementNamed(context, routeName, arguments: arguments);
  }

  static pushAndRemoveAll(BuildContext context, String routeName) {
    Navigator.pushNamedAndRemoveUntil(context,
      routeName,
          (Route<dynamic> route) => false,
    );
  }

  static popUntil(BuildContext context, String routeName) {
    Navigator.popUntil(context, ModalRoute.withName(routeName));
  }

}