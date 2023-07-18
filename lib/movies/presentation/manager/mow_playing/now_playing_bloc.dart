
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/movies/domain/use_case/get_now_playing_movies.dart';
import 'package:movie_app/movies/presentation/manager/mow_playing/now_playing_event.dart';
import 'package:movie_app/movies/presentation/manager/mow_playing/now_playing_state.dart';


class NowPlayingBloc extends Bloc<MoviesEvent, NowPlaying> {
  static NowPlayingBloc get(context) => BlocProvider.of(context);

  GetNowPlayingUseCaseMovie getNowPlayingUseCaseMovie;
  

  NowPlayingBloc(
    this.getNowPlayingUseCaseMovie,
    
  ) : super(NowPlayingInitial()) {
   on<GetNowPlayingEvent>(_getNowPlayingMovies);
  }

  FutureOr<void> _getNowPlayingMovies(GetNowPlayingEvent event, Emitter<NowPlaying> emit) async{
     emit(NowPlayingLoading());

    final result = await getNowPlayingUseCaseMovie.excute();

    result.fold(
      (failure) => emit(NowPlayingFailure(errorMessage: failure.errMessages)),
      (getNowPlaying) => emit(NowPlayingSuccess(movie: getNowPlaying)),
    );
  }
}

