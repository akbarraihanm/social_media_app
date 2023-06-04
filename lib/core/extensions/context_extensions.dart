import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  /// Height & Width of screen size
  double get mediaHeight => MediaQuery.of(this).size.height;
  double get mediaWidth => MediaQuery.of(this).size.width;

  /// Arguments
  dynamic args() => ModalRoute.of(this)?.settings.arguments;
}