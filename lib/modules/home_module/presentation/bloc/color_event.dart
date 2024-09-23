part of 'color_bloc.dart';

abstract class ColorEvent extends Equatable {
  @override
  List<Object> get props => [];

  const ColorEvent();
}

class GenerateNewColor extends ColorEvent {
  const GenerateNewColor();
}
