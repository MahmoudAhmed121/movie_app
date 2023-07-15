import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';
import 'package:movie_app/movies/domain/repo/base_movies_repo.dart';

class GetNowPlayingUseCaseMovie {
  BaseMovieRepo baseMovieRepo;
  GetNowPlayingUseCaseMovie({
    required this.baseMovieRepo,
  });

   Future<Either<ServerFailure, List<Movie>>> excute() async {
    return baseMovieRepo.getNowPlayingMovie();
  }
}

// class x{
//   Get
// }
