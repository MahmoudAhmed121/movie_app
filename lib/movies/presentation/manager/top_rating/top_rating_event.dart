import 'package:equatable/equatable.dart';

abstract class TopRatingEvent extends Equatable {
  const TopRatingEvent();

  @override
  List<Object> get props => [];
}


class GetTopRatingEvent extends TopRatingEvent{}