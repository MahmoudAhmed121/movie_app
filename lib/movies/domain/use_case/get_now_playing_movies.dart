import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/core/utils/base_use_case.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';
import 'package:movie_app/movies/domain/repo/base_movies_repo.dart';

class GetNowPlayingUseCaseMovie extends BaseUseCase<List<Movie>,NowParametrs> {
  BaseMovieRepo baseMovieRepo;
  GetNowPlayingUseCaseMovie({
    required this.baseMovieRepo,
  });

  @override
  Future<Either<ServerFailure, List<Movie>>> call(NowParametrs pratemetrs) async {
    return await baseMovieRepo.getNowPlayingMovie();
  }
}
