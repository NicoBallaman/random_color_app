import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_color_app/modules/home_module/domain/entities/app_color.dart';
import 'package:random_color_app/modules/home_module/domain/use_case/generate_random_color.dart';

part 'color_event.dart';
part 'color_state.dart';

class ColorBloc extends Bloc<ColorEvent, ColorState> {
  final GenerateRandomColor _generateRandomColor;

  ColorBloc({
    required GenerateRandomColor generateRandomColor,
  })  : _generateRandomColor = generateRandomColor,
        super(const ColorState()) {
    on<GenerateNewColor>(_onGenerateNewColor);
  }

  Future<void> _onGenerateNewColor(_, Emitter<ColorState> emit) async {
    final newColor = await _generateRandomColor.call();
    emit(state.copyWith(currentColor: newColor));
  }
}
