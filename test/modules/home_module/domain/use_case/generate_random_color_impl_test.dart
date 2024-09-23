import 'package:flutter_test/flutter_test.dart';
import 'package:random_color_app/modules/home_module/domain/entities/app_color.dart';
import 'package:random_color_app/modules/home_module/domain/use_case/generate_random_color_impl.dart';

void main() {
  group('GenerateRandomColorImpl', () {
    late GenerateRandomColorImpl generateRandomColor;

    setUp(() {
      generateRandomColor = GenerateRandomColorImpl();
    });

    test('should generate a valid AppColor with a valid color value', () async {
      final result = await generateRandomColor.call();
      expect(result, isA<AppColor>());
      expect(result.value, greaterThanOrEqualTo(0));
    });

    test('should generate different colors on consecutive calls', () async {
      final result1 = await generateRandomColor.call();
      final result2 = await generateRandomColor.call();
      expect(result1.value, isNot(equals(result2.value)));
    });
  });
}
