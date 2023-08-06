// import 'package:firebase_crashlytics/firebase_crashlytics.dart';

// import 'package:financial/layers/domain/usecase/session/handle_could_not_refresh_session.dart';

abstract class Failure {
  const Failure();
}

class DefaultFailuresHandler {
  // const DefaultFailuresHandler({
  //   required FirebaseCrashlytics crashlytics,
  //   required InvalidRefreshTokenHandler invalidRefreshTokenHandler,
  // })  : _crashlytics = crashlytics,
  //       _invalidRefreshTokenHandler = invalidRefreshTokenHandler;

  // final FirebaseCrashlytics _crashlytics;
  // final InvalidRefreshTokenHandler _invalidRefreshTokenHandler;

  Future<Failure> handle(dynamic e, StackTrace stackTrace) async {
    if (e is NetworkFailure) {
      return e;
    }

    if (e is InvalidRefreshTokenFailure) {
      // await _invalidRefreshTokenHandler.clearSessionAndNavigateOut();
      return e;
    }

    // report unexpected errors
    // _crashlytics.recordError(e, stackTrace);
    return GenericFailure(e);
  }

  static String? getMessage(Failure failure) {
    if (failure is NetworkFailure) {
      return failure.message;
    }
    if (failure is InvalidRefreshTokenFailure) {
      return failure.message;
    }
    if (failure is GenericFailure) {
      return failure.message;
    }

    return null;
  }
}

// -----------------------------------------------------------------------------
// NetworkFailure
// -----------------------------------------------------------------------------
class NetworkFailure extends Failure {
  const NetworkFailure([this.message = 'No internet connection.']);
  final String message;
}

// -----------------------------------------------------------------------------
// InvalidRefreshTokenFailure
// -----------------------------------------------------------------------------
class InvalidRefreshTokenFailure extends Failure {
  const InvalidRefreshTokenFailure([this.message = 'Session expired']);
  final String message;
}

// -----------------------------------------------------------------------------
// GenericFailure
// -----------------------------------------------------------------------------
class GenericFailure extends Failure {
  const GenericFailure(
    this.exception,
    // ignore: unused_element
    [
    this.message = 'Oops, something went wrong. Please, try again later.',
  ]);
  final String message;
  final dynamic exception;
}

// -----------------------------------------------------------------------------
// Gateway Timeout (504)
// -----------------------------------------------------------------------------
class TimeoutFailure extends Failure {
  const TimeoutFailure([
    this.message = 'Connection timeout. Please, try again later.',
  ]);
  final String message;
}

// -----------------------------------------------------------------------------
// OperationalFailure
// -----------------------------------------------------------------------------
class OperationalFailure extends Failure {
  const OperationalFailure();
}
