part of 'movies_bloc.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent();

  @override
  List<Object> get props => [];
}

class GetNowPlayingEvent extends MoviesEvent {}

class GetPopulerEvent extends MoviesEvent {}

class GetTopRatingEvent extends MoviesEvent {}
