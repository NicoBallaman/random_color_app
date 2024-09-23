import 'dart:async';

import 'package:flutter/material.dart';
import 'package:random_color_app/core/abstractions/injector_container.dart';
import 'package:random_color_app/core/modules/app_module.dart';
import 'package:random_color_app/modules/home_module/domain/use_case/generate_random_color_impl.dart';
import 'package:random_color_app/modules/home_module/presentation/bloc/color_bloc.dart';
import 'package:random_color_app/modules/home_module/presentation/pages/home_page.dart';

class HomeModule extends AppModule {
  static const String _rootPath = '';

  static Future<Object?> navigateToHome<T>(BuildContext context) {
    return Navigator.of(context).pushReplacementNamed(_rootPath);
  }

  @override
  void registerDependencies(InjectorContainer injector) {
    injector.registerFactory<ColorBloc>(
      () => ColorBloc(
        generateRandomColor: GenerateRandomColorImpl(),
      ),
    );
  }

  @override
  Map<String, WidgetBuilder> generateRoutes() {
    return {
      _rootPath: (context) => const HomePage(),
    };
  }
}
