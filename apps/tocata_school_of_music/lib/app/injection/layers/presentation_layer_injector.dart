part of '../injector.dart';

void _initializePresentationLayer() {
  getIt
    ..registerLazySingleton(
      () => AppBloc(
        authenticationRepository: getIt(),
      ),
    )
    ..registerFactory(() => LoginCubit(getIt()))
    ..registerFactory(() => SignUpCubit(getIt()));
}
