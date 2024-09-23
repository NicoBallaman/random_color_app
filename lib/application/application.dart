import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:random_color_app/application/app_theme.dart';
import 'package:random_color_app/application/localization/i18n.dart';
import 'package:random_color_app/application/theme_cubit.dart';
import 'package:random_color_app/core/abstractions/injector_container.dart';
import 'package:random_color_app/core/modules/app_module.dart';

class Application extends StatelessWidget {
  final List<AppModule> _modules;

  const Application({
    super.key,
    required List<AppModule> modules,
  }) : _modules = modules;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => InjectorContainer.instance.resolve<ThemeCubit>(),
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            title: '',
            routes: _generateRoutes(),
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeMode,
            localizationsDelegates: const [
              AppLocalizationsDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: I18n.supportedLocales,
            initialRoute: '',
          );
        },
      ),
    );
  }

  Map<String, WidgetBuilder> _generateRoutes() {
    return _modules.map((element) => element.generateRoutes()).fold(
      {},
      (a, b) => {...a, ...b},
    );
  }
}
