// Mocks generated by Mockito 5.4.3 from annotations
// in random_color_app/test/modules/home_module/presentation/bloc/color_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:random_color_app/modules/home_module/domain/entities/app_color.dart'
    as _i2;
import 'package:random_color_app/modules/home_module/domain/use_case/generate_random_color.dart'
    as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeAppColor_0 extends _i1.SmartFake implements _i2.AppColor {
  _FakeAppColor_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [GenerateRandomColor].
///
/// See the documentation for Mockito's code generation for more information.
class MockGenerateRandomColor extends _i1.Mock
    implements _i3.GenerateRandomColor {
  MockGenerateRandomColor() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.AppColor> call() => (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
        ),
        returnValue: _i4.Future<_i2.AppColor>.value(_FakeAppColor_0(
          this,
          Invocation.method(
            #call,
            [],
          ),
        )),
      ) as _i4.Future<_i2.AppColor>);
}
