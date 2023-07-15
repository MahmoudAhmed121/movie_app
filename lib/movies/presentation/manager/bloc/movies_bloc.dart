import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';
import 'package:movie_app/movies/domain/use_case/get_now_playing_movies.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  static MoviesBloc get(context) => BlocProvider.of(context);

  GetNowPlayingUseCaseMovie getNowPlayingUseCaseMovie;

  MoviesBloc(this.getNowPlayingUseCaseMovie) : super(MoviesInitial()) {
    on<GetNowPlayingEvent>(
      (event, emit) async {
        emit(MoviesLoading());

        final result = await getNowPlayingUseCaseMovie.excute();

        result.fold(
          (failure) => emit(MoviesFailure(errorMessage: failure.errMessages)),
          (movie) => emit(
            MoviesSuccess(movie: movie),
          ),
        );
      },
    );
    on<GetPopulerEvent>((event, emit) {});
    on<GetTopRatingEvent>((event, emit) {});
  }
}
