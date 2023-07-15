import 'package:movie_app/movies/domain/entities/movie.dart';

abstract class BaseMovieRepo {
  Future<List<Movie>> getNowPlayingMovie();
  Future<List<Movie>> getPopulerMovie();
  Future<List<Movie>> getTopRatingMovie();
}
