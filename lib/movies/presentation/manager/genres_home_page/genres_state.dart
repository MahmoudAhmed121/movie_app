


import 'package:equatable/equatable.dart';
import 'package:movie_app/movies/domain/entities/gener_home_page.dart';

abstract class GenresState extends Equatable {
  const GenresState();

  @override
  List<Object> get props => [];
}

class GenresInitial extends GenresState {}

class GenresLoading extends GenresState {}

class GenresSuccess extends GenresState {
  final List<GenresHomePage> generHomePage;
  const GenresSuccess({
    required this.generHomePage,
  });
  @override
  List<Object> get props => [generHomePage];
}

class GenresFailure extends GenresState {
  final String errorMessage;
  const GenresFailure({
    required this.errorMessage,
  });

  @override
  List<Object> get props => [errorMessage];
}
