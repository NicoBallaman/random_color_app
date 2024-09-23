import 'package:random_color_app/application/theme_cubit.dart';
import 'package:random_color_app/core/abstractions/injector_container.dart';
import 'package:random_color_app/core/abstractions/local_storage_manager.dart';
import 'package:random_color_app/core/integrations/get_it_injector_container.dart';
import 'package:random_color_app/core/integrations/local_storage_manager_impl.dart';
import 'package:random_color_app/core/modules/app_module.dart';

abstract class IoCManager {
  static void registerDependencies({List<AppModule>? modules}) {
    final InjectorContainer injector = InjectorContainer.instance;

    injector.registerLazySingleton<InjectorContainer>(
      () => GetItInjectorContainer(),
    );

    injector.registerLazySingleton<ThemeCubit>(
      () => ThemeCubit(),
    );

    injector.registerLazySingleton<LocalStorageManager>(
      () => LocalStorageManagerImpl(),
    );

    if (modules != null) {
      for (final module in modules) {
        module.registerDependencies(injector);
      }
    }
  }
}
