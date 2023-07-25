import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/movies/domain/use_case/get_movies_details.dart';
import 'package:movie_app/movies/presentation/manager/movie_details/movies_details_event.dart';
import 'package:movie_app/movies/presentation/manager/movie_details/movies_details_state.dart';

class MoviesDetailsBloc extends Bloc<MoviesDetailsEvent, MoviesDetailsState> {
  static MoviesDetailsBloc get(context) => BlocProvider.of(context);

  GetMovieDetailsUseCase getMovieDetailsUseCase;

  MoviesDetailsBloc(this.getMovieDetailsUseCase)
      : super(MoviesDetailsInitial()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
  }

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MoviesDetailsState> emit) async {
    emit(MoviesDetailsLoading());

    final result =
        await getMovieDetailsUseCase(MovieDetailsParametrs(id: event.id));

    result.fold(
      (failure) =>
          emit(MoviesDetailsFailure(errorMessage: failure.errMessages)),
      (movieDetails) => emit(
        MoviesDetailsSuccess(movieDetails: movieDetails),
      ),
    );
  }
}
