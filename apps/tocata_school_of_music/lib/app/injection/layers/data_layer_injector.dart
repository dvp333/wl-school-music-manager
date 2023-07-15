part of '../injector.dart';

void _initializeDataLayer() {
  _api();
  _registerDataSources();
  _registerRepositories();
}

void _registerRepositories() {
  // getIt
  // ..registerFactory<ThemeRepository>(
  //   () => LocalThemeRepository(
  //     datasource: getIt(),
  //   ),
  // )
  // ..registerLazySingleton<FirebaseRemoteConfigRepository>(
  //   () => RemoteFirebaseConfigRepository(
  //     firebaseRemoteConfigDatasource: getIt(),
  //   ),
  // )
  // ;
}

void _registerDataSources() {
  getIt
    ..registerLazySingleton(() => FirebaseRemoteConfig.instance)
    ..registerLazySingleton(SharedPreferences.getInstance);
}

void _api() {
  // getIt
  // ..registerLazySingleton(
  //   () => AuthTokenFactory(
  //     sessionRepository: getIt(),
  //   ),
  // )
  // ..registerLazySingleton(GraphQLCache)
  // ..registerLazySingleton(
  //   () => GraphQLClientFactory(
  //     cache: getIt(),
  //     baseURL: getIt<EnvironmentConfig>().manaApiURL,
  //     authTokenFactory: getIt(),
  //     dio: getIt(),
  //   ),
  // )
  // ..registerLazySingleton(
  //   () => AuthTokenRefresher(
  //     sessionRemoteDatasource: getIt(),
  //     sessionRepository: getIt(),
  //     getPasscode: getIt(),
  //     userAuthRepository: getIt(),
  //     getDeviceInfo: getIt(),
  //   ),
  // );
}
