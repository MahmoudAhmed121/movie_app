import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/movies/domain/use_case/get_top_rating_movies.dart';
import 'package:movie_app/movies/presentation/manager/top_rating/top_rating_event.dart';
import 'package:movie_app/movies/presentation/manager/top_rating/top_rating_state.dart';

class TopRatingBloc extends Bloc<TopRatingEvent, TopRatingState> {
  static TopRatingBloc get(context) => BlocProvider.of(context);

  GetTopRatingUseCasMovie getTopRatingUseCasMovie;

  TopRatingBloc(
    this.getTopRatingUseCasMovie,
  ) : super(TopratingInitial()) {
    on<GetTopRatingEvent>(_getTopRatingMovies);
  }

  FutureOr<void> _getTopRatingMovies(
      GetTopRatingEvent event, Emitter<TopRatingState> emit) async {
    emit(TopratingLoading());

    final result = await getTopRatingUseCasMovie.excute();

    result.fold(
      (failure) => emit(TopratingFailure(errorMessage: failure.errMessages)),
      (getNowPlaying) => emit(TopratingSuccess(movie: getNowPlaying)),
    );
  }
}
