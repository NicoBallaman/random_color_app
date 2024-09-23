import 'package:flutter/material.dart';
import 'package:random_color_app/application/application.dart';
import 'package:random_color_app/ioc_manager.dart';
import 'package:random_color_app/modules/home_module/home_module.dart';

void main() {
  final appModules = [
    HomeModule(),
  ];
  IoCManager.registerDependencies(modules: appModules);

  runApp(
    Application(modules: appModules),
  );
}
