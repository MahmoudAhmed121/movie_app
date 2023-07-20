import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/movies/domain/use_case/get_movie_recommendations.dart';
import 'package:movie_app/movies/presentation/manager/recommendation/recommendation_event.dart';
import 'package:movie_app/movies/presentation/manager/recommendation/recommendation_state.dart';

class RecommendationBloc
    extends Bloc<RecommendationEvent, RecommendationState> {
  static RecommendationBloc get(context) => BlocProvider.of(context);

  GetRecommendationsUseCase getRecommendationsUseCase;

  RecommendationBloc(this.getRecommendationsUseCase)
      : super(RecommendationInitial()) {
    on<GetRecommendationsEvent>(_getRecommendation);
  }

  FutureOr<void> _getRecommendation(
      GetRecommendationsEvent event, Emitter<RecommendationState> emit) async {
    emit(RecommendationLoading());
    final result =
        await getRecommendationsUseCase(RecommendationsParametr(id: event.id));

    result.fold(
        (failure) =>
            emit(RecommendationFailure(errorMessage: failure.errMessages)),
        (recommendation) =>
            emit(RecommendationSuccess(recommendationModel: recommendation)));
  }
}
