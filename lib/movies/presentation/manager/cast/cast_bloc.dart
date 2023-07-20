import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/movies/domain/use_case/get_cast.dart';
import 'package:movie_app/movies/presentation/manager/cast/cast_event.dart';
import 'package:movie_app/movies/presentation/manager/cast/cast_state.dart';

class CastBloc extends Bloc<CastEvent, CastState> {
  static CastBloc get(context) => BlocProvider.of(context);
  GetCastUseCase getCastUseCase;

  CastBloc(this.getCastUseCase) : super(CastInitial()) {
    on<GetCastEvent>(_getCast);
  }

  FutureOr<void> _getCast(GetCastEvent event, Emitter<CastState> emit) async {
    final result = await getCastUseCase(CastParametrs(id: event.id));

    result.fold(
      (faliure) => emit(CastFailure(errorMessage: faliure.errMessages)),
      (cast) => emit(CastSuccess(cast: cast)),
    );
  }
}
