import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/core/utils/base_use_case.dart';
import 'package:movie_app/movies/domain/entities/cast.dart';
import 'package:movie_app/movies/domain/repo/base_movies_repo.dart';

class GetCastUseCase extends BaseUseCase<List<Cast>, CastParametrs> {
  BaseMovieRepo baseMovieRepo;
  GetCastUseCase({
    required this.baseMovieRepo,
  });
  @override
  Future<Either<ServerFailure, List<Cast>>> call(CastParametrs parametrs) {
    return baseMovieRepo.getCast(parametrs);
  }
}

class CastParametrs extends Equatable {
  final int id;
  const CastParametrs({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}
