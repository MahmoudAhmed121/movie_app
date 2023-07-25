// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/movies/data/repo/movie_repo.dart';
import 'package:movie_app/movies/domain/use_case/get_populer_movies.dart';
import 'package:movie_app/movies/presentation/manager/populer/populer_event.dart';
import 'package:movie_app/movies/presentation/manager/populer/populer_state.dart';

class PopularBloc extends Bloc<PopulerEvent, PopulerState> {
  static PopularBloc get(context) => BlocProvider.of(context);
  GetPopulerUseCasMovie getPopulerUseCasMovie;

  // String errorStateMessage ;

 
  // void sendNotification(String message) {
  //   print("1 $message");
  //   errorStateMessage = message;
  //   print(errorStateMessage);
  
  // }

  PopularBloc(this.getPopulerUseCasMovie,) : super(PopulerInitial()) {
    on<GetPopulerEvent>(_getNowPlayingMovies);
  }

  FutureOr<void> _getNowPlayingMovies(
      GetPopulerEvent event, Emitter<PopulerState> emit) async {
    final result = await getPopulerUseCasMovie(DiscoverPrameter(id: event.id));

    result.fold(
      (failure) {
     
        emit(PopulerFailure(errMessages: failure.errMessages));
      },
      (getNowPlaying) {
  
      
        emit(PopulerSuccess(
          movie: getNowPlaying,
          errorMessage: errorMessage,
        ));
      },
    );
  }
}
