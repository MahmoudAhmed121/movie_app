// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/core/utils/base_use_case.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';
import 'package:movie_app/movies/domain/repo/base_movies_repo.dart';

class GetPopulerUseCasMovie extends BaseUseCase<List<Movie>, PopularPrameter> {
  BaseMovieRepo baseMovieRepo;
  GetPopulerUseCasMovie({
    required this.baseMovieRepo,
  });

  @override
  Future<Either<ServerFailure, List<Movie>>> call(PopularPrameter parametrs) {
    return baseMovieRepo.getPopulerMovie(parametrs);
  }
}

class PopularPrameter extends Equatable {
  final int id;
  const PopularPrameter({
    required this.id,
  });
  @override
  List<Object?> get props => [id];
}
