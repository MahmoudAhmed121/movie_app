import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/errors/failure.dart';

abstract class BaseUseCase<T, Parametrs> {
  Future<Either<ServerFailure, T>> call(Parametrs parametrs);
}

class NoParametrs extends Equatable {
  const NoParametrs();

  @override
  List<Object?> get props => [];
}
