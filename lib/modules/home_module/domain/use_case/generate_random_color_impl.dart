import 'dart:math';
import 'package:flutter/material.dart';
import 'package:random_color_app/modules/home_module/domain/entities/app_color.dart';
import 'package:random_color_app/modules/home_module/domain/use_case/generate_random_color.dart';

class GenerateRandomColorImpl implements GenerateRandomColor {
  @override
  Future<AppColor> call() async {
    final random = Random();
    final color = Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1,
    );
    final appColor = AppColor(value: color.value);
    //TODO save generated color in localStorage

    return appColor;
  }
}
