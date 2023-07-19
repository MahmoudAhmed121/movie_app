import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/base_use_case.dart';
import 'package:movie_app/movies/domain/use_case/get_populer_movies.dart';
import 'package:movie_app/movies/presentation/manager/populer/populer_event.dart';
import 'package:movie_app/movies/presentation/manager/populer/populer_state.dart';

class PopularBloc extends Bloc<PopulerEvent, PopulerState> {
  static PopularBloc get(context) => BlocProvider.of(context);

  GetPopulerUseCasMovie getPopulerUseCasMovie;

  PopularBloc(
    this.getPopulerUseCasMovie,
  ) : super(PopulerInitial()) {
    on<GetPopulerEvent>(_getNowPlayingMovies);
  }

  FutureOr<void> _getNowPlayingMovies(
      GetPopulerEvent event, Emitter<PopulerState> emit) async {
    emit(PopulerLoading());

    final result = await getPopulerUseCasMovie(const NowParametrs());

    result.fold(
      (failure) => emit(PopulerFailure(errMessages: failure.errMessages)),
      (getNowPlaying) => emit(PopulerSuccess(movie: getNowPlaying)),
    );
  }
}
