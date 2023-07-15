part of '../injector.dart';

void _registerSingletonsAsync() {
  getIt.registerSingletonAsync(SharedPreferences.getInstance);
}
