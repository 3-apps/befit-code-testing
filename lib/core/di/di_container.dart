import 'package:get_it/get_it.dart';

class DIContainer {
  static final DIContainer instance = DIContainer._();
  final GetIt _getIt = GetIt.instance;
  DIContainer._();

  void registerFactory<T extends Object>(
    T Function() factoryFunc, {
    String? instanceName,
  }) {
    _getIt.registerFactory<T>(factoryFunc, instanceName: instanceName);
  }

  void registerLazySingleton<T extends Object>(
    T Function() factoryFunc, {
    String? instanceName,
  }) {
    _getIt.registerLazySingleton<T>(factoryFunc, instanceName: instanceName);
  }

  void registerSingleton<T extends Object>(T instance, {String? instanceName}) {
    _getIt.registerSingleton<T>(instance, instanceName: instanceName);
  }

  T resolve<T extends Object>({String? instanceName}) {
    return _getIt.get<T>(instanceName: instanceName);
  }
}
