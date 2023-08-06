import 'package:dartz/dartz.dart';
import 'package:guitar_games/src/layers/domain/usecases/base/failure.dart';

abstract class UseCase<T, Param> {
  UseCase({
    DefaultFailuresHandler? failuresHandler,
  }) : _failuresHandler = failuresHandler ?? DefaultFailuresHandler();

  final DefaultFailuresHandler _failuresHandler;

  Future<Either<Failure, T>> run([Param? p]);

  Future<Either<Failure, T>> call([Param? p]) async {
    try {
      return await run(p);
    } catch (e) {
      // final failure = await _failuresHandler.handle(e, st);
      return left(GenericFailure(e));
    }
  }
}

// Use this class when your usecase has no inputs.
class NoParams {}
