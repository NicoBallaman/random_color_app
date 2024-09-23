import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_color_app/application/localization/i18n.dart';
import 'package:random_color_app/modules/home_module/presentation/bloc/color_bloc.dart';

class HomeComponent extends StatelessWidget {
  final ColorBloc _colorBloc;
  static const _opacityText = 0.6;

  const HomeComponent({
    required ColorBloc colorBloc,
  }) : _colorBloc = colorBloc;

  @override
  Widget build(BuildContext context) {
    final i18n = I18n.of(context);

    return BlocBuilder<ColorBloc, ColorState>(
      bloc: _colorBloc,
      builder: (context, state) {
        return AnimatedContainer(
          width: double.infinity,
          duration: const Duration(milliseconds: 500),
          color: Color(state.currentColor.value),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Text(
                  i18n.translate('home.title'),
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(color: Theme.of(context).textTheme.headlineMedium?.color?.withOpacity(_opacityText)),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: ElevatedButton(
                    onPressed: () => _colorBloc.add(const GenerateNewColor()),
                    child: Text(
                      i18n.translate('home.change_color'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
