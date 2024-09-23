import 'dart:async';
import 'package:flutter/material.dart';
import 'package:random_color_app/core/abstractions/injector_container.dart';

abstract class AppModule {
  Map<String, WidgetBuilder> generateRoutes();
  FutureOr<void> registerDependencies(InjectorContainer injector);
}
