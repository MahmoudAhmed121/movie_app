
import 'package:equatable/equatable.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';
abstract class TopRatingState extends Equatable {
  const TopRatingState();
  
  @override
  List<Object> get props => [];
}

class TopratingInitial extends TopRatingState {}


class TopratingLoading extends TopRatingState {}
class TopratingSuccess extends TopRatingState {

final List<Movie> movie;
 const TopratingSuccess({
    required this.movie,
  });
  @override
  List<Object> get props => [movie];
}
class TopratingFailure extends TopRatingState {
final String errorMessage;
 const TopratingFailure({
    required this.errorMessage,
  });

  @override
  List<Object> get props => [errorMessage];
}
