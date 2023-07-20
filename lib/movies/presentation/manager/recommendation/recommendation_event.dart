// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

class RecommendationEvent extends Equatable {
  const RecommendationEvent();

  @override
  List<Object> get props => [];
}

class GetRecommendationsEvent extends RecommendationEvent {
  final int id;
  const GetRecommendationsEvent({
    required this.id,
  });
  @override
  List<Object> get props => [id];
}
