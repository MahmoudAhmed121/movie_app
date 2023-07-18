// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';

abstract class PopulerState extends Equatable {
  const PopulerState();
  
  @override
  List<Object> get props => [];
}

class PopulerInitial extends PopulerState {}


class PopulerLoading extends PopulerState {}

class PopulerSuccess extends PopulerState {
  final List<Movie> movie;
 const PopulerSuccess({
    required this.movie,
  });
    @override
  List<Object> get props => [movie];
}
class PopulerFailure extends PopulerState {

final String errMessages;
const  PopulerFailure({
    required this.errMessages,
  });
    @override
  List<Object> get props => [errMessages];
}
