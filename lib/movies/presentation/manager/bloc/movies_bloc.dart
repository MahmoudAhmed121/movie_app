import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';
import 'package:movie_app/movies/domain/use_case/get_now_playing_movies.dart';
import 'package:movie_app/movies/domain/use_case/get_populer_movies.dart';
import 'package:movie_app/movies/domain/use_case/get_top_rating_movies.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  static MoviesBloc get(context) => BlocProvider.of(context);

  GetNowPlayingUseCaseMovie getNowPlayingUseCaseMovie;
  GetPopulerUseCasMovie getPopulerUseCasMovie;
  GetTopRatingUseCasMovie getTopRatingUseCasMovie;

  MoviesBloc(this.getNowPlayingUseCaseMovie, this.getPopulerUseCasMovie,
      this.getTopRatingUseCasMovie): super(MoviesInitial()) {

    on<GetNowPlayingEvent>(_getNowPlayingMovies);
    on<GetPopulerEvent>(_getPopulerMovies);
    on<GetTopRatingEvent>(_getTopRatingEvent);
    
  }

  FutureOr<void> _getNowPlayingMovies(
      GetNowPlayingEvent event, Emitter<MoviesState> emit) async {
    emit(MoviesLoading());

    final result = await getNowPlayingUseCaseMovie.excute();

    result.fold(
      (failure) => emit(MoviesFailure(errorMessage: failure.errMessages)),
      (movie) => emit(
        MoviesSuccess(movie: movie),
      ),
    );
  }

  FutureOr<void> _getPopulerMovies(
      GetPopulerEvent event, Emitter<MoviesState> emit) async {
    emit(MoviesLoading());
    final result = await getPopulerUseCasMovie.excute();
    result.fold(
      (failure) => emit(MoviesFailure(errorMessage: failure.errMessages)),
      (movie) => emit(
        MoviesSuccess(movie: movie),
      ),
    );
  }

  FutureOr<void> _getTopRatingEvent(
      GetTopRatingEvent event, Emitter<MoviesState> emit) async {
    emit(MoviesLoading());
    final result = await getTopRatingUseCasMovie.excute();
    result.fold(
      (failure) => emit(MoviesFailure(errorMessage: failure.errMessages)),
      (movie) => emit(
        MoviesSuccess(movie: movie),
      ),
    );
  }
}
