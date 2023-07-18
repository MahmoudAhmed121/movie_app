import 'package:equatable/equatable.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';

abstract class NowPlaying extends Equatable {
  const NowPlaying();
final x = 0;
  @override
  List<Object> get props => [x];
}

class NowPlayingInitial extends NowPlaying {}

class NowPlayingLoading extends NowPlaying {}

class NowPlayingSuccess extends NowPlaying {
  final List<Movie> movie;

  const NowPlayingSuccess({
    required this.movie,
  });

  @override
  List<Object> get props => [movie];
}

class NowPlayingFailure extends NowPlaying {
  final String errorMessage;

  const NowPlayingFailure({
    required this.errorMessage,
  });

  @override
  List<Object> get props => [errorMessage];
}
