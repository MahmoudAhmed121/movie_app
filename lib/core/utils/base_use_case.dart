import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failure.dart';

abstract class BaseUseCase<T> {
  Future<Either<ServerFailure, T>> call();
}
