import 'package:random_color_app/modules/home_module/domain/entities/app_color.dart';

abstract class GenerateRandomColor {
  Future<AppColor> call();
}
