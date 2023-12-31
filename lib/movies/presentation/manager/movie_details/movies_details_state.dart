// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

import 'package:movie_app/movies/domain/entities/movie_details.dart';

abstract class MoviesDetailsState extends Equatable {
  const MoviesDetailsState();

  @override
  List<Object> get props => [];
}

class MoviesDetailsInitial extends MoviesDetailsState {}

class MoviesDetailsLoading extends MoviesDetailsState {}

class MoviesDetailsSuccess extends MoviesDetailsState {
  final MovieDetails movieDetails;

  const MoviesDetailsSuccess({
    required this.movieDetails,

  });

  
  @override
  List<Object> get props => [movieDetails];

 
}

class MoviesDetailsFailure extends MoviesDetailsState {
  final String errorMessage;
  const MoviesDetailsFailure({
    required this.errorMessage,
  });

  
  @override
  List<Object> get props => [errorMessage];
}
