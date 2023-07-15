import 'package:movie_app/movies/domain/entities/movie.dart';
import 'package:movie_app/movies/domain/repo/base_movies_repo.dart';

class GetNowPlayingMovie {
  BaseMovieRepo baseMovieRepo;
  GetNowPlayingMovie({
    required this.baseMovieRepo,
  });

  Future<List<Movie>> excute() async {
    return baseMovieRepo.getNowPlayingMovie();
  }
}
