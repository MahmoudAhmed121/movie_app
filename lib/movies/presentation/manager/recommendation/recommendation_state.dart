
import 'package:equatable/equatable.dart';
import 'package:movie_app/movies/domain/entities/recommendations.dart';

abstract class RecommendationState extends Equatable {
  const RecommendationState();
  
  @override
  List<Object> get props => [];
}

class RecommendationInitial extends RecommendationState {}

class RecommendationLoading extends RecommendationState {}

class RecommendationSuccess extends RecommendationState {

  final List<Recommendations> recommendationModel;
  const RecommendationSuccess({
    required this.recommendationModel,
  });
 @override
  List<Object> get props => [recommendationModel];
  
}

class RecommendationFailure extends RecommendationState {

  final String errorMessage; 
 const RecommendationFailure({
    required this.errorMessage,
  });
@override
  List<Object> get props => [errorMessage];


  
}
