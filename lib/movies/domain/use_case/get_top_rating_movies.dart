import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/core/utils/base_use_case.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';
import 'package:movie_app/movies/domain/repo/base_movies_repo.dart';

class GetTopRatingUseCasMovie extends BaseUseCase<List<Movie>,NoParametrs> {
  BaseMovieRepo baseMovieRepo;
  GetTopRatingUseCasMovie({
    required this.baseMovieRepo,
  });

  @override
  Future<Either<ServerFailure, List<Movie>>> call(NoParametrs parametrs) async {
    return await baseMovieRepo.getTopRatingMovie();
  }
}
