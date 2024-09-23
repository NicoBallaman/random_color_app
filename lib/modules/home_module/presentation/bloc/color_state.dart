part of 'color_bloc.dart';

class ColorState extends Equatable {
  final AppColor currentColor;
  final List<AppColor> colorHistory;

  @override
  List<Object> get props => [currentColor, colorHistory];

  const ColorState({
    this.currentColor = const AppColor(value: 0),
    this.colorHistory = const [],
  });

  ColorState copyWith({
    AppColor? currentColor,
    List<AppColor>? colorHistory,
  }) {
    return ColorState(
      currentColor: currentColor ?? this.currentColor,
      colorHistory: colorHistory ?? this.colorHistory,
    );
  }
}
