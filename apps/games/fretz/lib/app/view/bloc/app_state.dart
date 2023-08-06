part of 'app_bloc.dart';

enum AppStatus {
  initialized,
}

final class AppState extends Equatable {
  const AppState._({
    required this.status,
    // this.user = User.empty,
  });

  const AppState.initialized() : this._(status: AppStatus.initialized);

  // const AppState.unauthenticated() : this._(status: AppStatus.unauthenticated);

  // const AppState.unauthorized() : this._(status: AppStatus.unauthorized);

  final AppStatus status;
  // final User user;

  @override
  List<Object> get props => [status /*, user*/];
}
