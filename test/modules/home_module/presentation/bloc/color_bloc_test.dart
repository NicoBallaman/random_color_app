import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:random_color_app/modules/home_module/domain/entities/app_color.dart';
import 'package:random_color_app/modules/home_module/domain/use_case/generate_random_color.dart';
import 'package:random_color_app/modules/home_module/presentation/bloc/color_bloc.dart';

import 'color_bloc_test.mocks.dart';

@GenerateMocks([GenerateRandomColor])
void main() {
  group('ColorBloc tests', () {
    late MockGenerateRandomColor mockGenerateRandomcColor;
    const AppColor testColor = AppColor(value: 255);

    setUp(() {
      mockGenerateRandomcColor = MockGenerateRandomColor();
    });

    blocTest<ColorBloc, ColorState>(
      'Should emit [ColorState] with a new random color when GenerateNewColor is added',
      build: () {
        when(mockGenerateRandomcColor.call()).thenAnswer((_) async => testColor);

        return ColorBloc(generateRandomColor: mockGenerateRandomcColor);
      },
      act: (bloc) => bloc.add(const GenerateNewColor()),
      expect: () => [
        const ColorState(currentColor: testColor),
      ],
      verify: (bloc) {
        verify(mockGenerateRandomcColor.call()).called(1);
      },
    );
  });
}
