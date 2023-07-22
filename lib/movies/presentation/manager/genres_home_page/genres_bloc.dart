import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/base_use_case.dart';
import 'package:movie_app/movies/domain/use_case/get_gener_home_page.dart';
import 'package:movie_app/movies/presentation/manager/genres_home_page/genres_event.dart';
import 'package:movie_app/movies/presentation/manager/genres_home_page/genres_state.dart';

class GenresBloc extends Bloc<GenresEvent, GenresState> {
  static GenresBloc get(context) => BlocProvider.of(context);

  GetGenersHomePageUseCase genersHomePageUseCase;
  GenresBloc(this.genersHomePageUseCase) : super(GenresInitial()) {
    on<GetGenresHomePageEvent>(_getGennerHomePage);
  }

  FutureOr<void> _getGennerHomePage(
      GetGenresHomePageEvent event, Emitter<GenresState> emit) async {
    emit(GenresLoading());
    final result = await genersHomePageUseCase(const NoParametrs());
      
    result.fold(
      (failure) => emit(GenresFailure(errorMessage: failure.errMessages)),
      (genres) => emit(
        GenresSuccess(generHomePage: genres),
      ),
    );
  }
}
