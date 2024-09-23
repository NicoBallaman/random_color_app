import 'package:get_it/get_it.dart';
import 'package:random_color_app/core/abstractions/injector_container.dart';

class GetItInjectorContainer implements InjectorContainer {
  static final GetItInjectorContainer _singleton = GetItInjectorContainer._internal();
  final GetIt _getIt = GetIt.asNewInstance();

  factory GetItInjectorContainer() {
    return _singleton;
  }

  GetItInjectorContainer._internal();

  @override
  void registerFactory<T extends Object>(T Function() factoryFunc) {
    if (_getIt.isRegistered<T>()) {
      _getIt.unregister<T>();
    }

    _getIt.registerFactory<T>(factoryFunc);
  }

  @override
  void registerFactoryByName<T extends Object>(T Function() factoryFunc, String name) {
    if (_getIt.isRegistered<T>(instanceName: name)) {
      _getIt.unregister<T>(instanceName: name);
    }
    _getIt.registerFactory<T>(
      factoryFunc,
      instanceName: name,
    );
  }

  @override
  void registerLazySingleton<T extends Object>(T Function() factoryFunc) {
    if (_getIt.isRegistered<T>()) {
      _getIt.unregister<T>();
    }

    _getIt.registerLazySingleton(factoryFunc);
  }

  @override
  T resolve<T extends Object>() {
    return _getIt.get<T>();
  }

  @override
  T resolveByName<T extends Object>(String name) {
    return _getIt.get<T>(
      instanceName: name,
    );
  }
}
