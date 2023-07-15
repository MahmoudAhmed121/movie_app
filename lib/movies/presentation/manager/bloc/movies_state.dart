// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'movies_bloc.dart';

abstract class MoviesState extends Equatable {
  const MoviesState();

  @override
  List<Object> get props => [];
}

class MoviesInitial extends MoviesState {}

class MoviesLoading extends MoviesState {}

class MoviesSuccess extends MoviesState {
  final List<Movie> movie;
 const MoviesSuccess({
    required this.movie,
  });
  
}

class MoviesFailure extends MoviesState {
  final String errorMessage;
 const MoviesFailure({
    required this.errorMessage,
  });
}
