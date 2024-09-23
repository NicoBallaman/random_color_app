import 'package:random_color_app/core/integrations/get_it_injector_container.dart';

typedef FactoryFunc<T> = T Function();

abstract class InjectorContainer {
  static final InjectorContainer _instance = GetItInjectorContainer();

  static InjectorContainer get instance => _instance;

  void registerFactory<T extends Object>(FactoryFunc<T> factoryFunc);

  void registerFactoryByName<T extends Object>(FactoryFunc<T> factoryFunc, String name);

  void registerLazySingleton<T extends Object>(FactoryFunc<T> factoryFunc);

  T resolve<T extends Object>();

  T resolveByName<T extends Object>(String name);
}
