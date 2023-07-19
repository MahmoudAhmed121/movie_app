// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/core/utils/base_use_case.dart';
import 'package:movie_app/movies/domain/entities/movie_details.dart';
import 'package:movie_app/movies/domain/repo/base_movies_repo.dart';

class GetMovieDetailsUseCase extends BaseUseCase<MovieDetails, int> {
  BaseMovieRepo baseMovieRepo;
  GetMovieDetailsUseCase({
    required this.baseMovieRepo,
  });

  @override
  Future<Either<ServerFailure, MovieDetails>> call(int parametrs) {
    return baseMovieRepo.getMovieDetails(parametrs);
  }
}


class MovieDetailsParametrs extends Equatable {


  final int id;
  const MovieDetailsParametrs({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}
