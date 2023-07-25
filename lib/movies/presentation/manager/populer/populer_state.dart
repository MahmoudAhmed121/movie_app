

import 'package:equatable/equatable.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';

class PopulerState extends Equatable{

    @override
  List<Object> get props => [];
}

class PopulerInitial extends PopulerState {
  PopulerInitial() ;
}



class PopulerSuccess extends PopulerState {

  final List<Movie> movie;
  final String errorMessage;

  @override
  List<Object> get props => [movie,errorMessage];
  PopulerSuccess({required this.movie,this.errorMessage = "",}) ;
}

class PopulerFailure extends PopulerState {
  final String errMessages;

  PopulerFailure({required this.errMessages}) ;
    @override
  List<Object> get props => [errMessages];
}
