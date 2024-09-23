import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_color_app/application/localization/i18n.dart';
import 'package:random_color_app/application/theme_cubit.dart';
import 'package:random_color_app/core/abstractions/injector_container.dart';
import 'package:random_color_app/modules/home_module/presentation/bloc/color_bloc.dart';
import 'package:random_color_app/modules/home_module/presentation/components/home_component.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final injector = InjectorContainer.instance;
    final i18n = I18n.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          i18n.translate('core.app_title'),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () => context.read<ThemeCubit>().toggleTheme(),
          ),
        ],
      ),
      body: HomeComponent(
        colorBloc: injector.resolve<ColorBloc>(),
      ),
    );
  }
}
