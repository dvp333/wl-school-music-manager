part of '../injector.dart';

void _initializePresentationLayer() {
  getIt.registerLazySingleton(AppBloc.new);
  //   ..registerFactory(() => LoginCubit(getIt()))
  //   ..registerFactoryParam(
  //     (FirebaseApp app, _) => SignUpCubit(getIt(param1: app)),
  //   );
}
