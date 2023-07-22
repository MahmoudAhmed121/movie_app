import 'package:equatable/equatable.dart';

abstract class GenresEvent extends Equatable {
  const GenresEvent();

  @override
  List<Object> get props => [];
}


class GetGenresHomePageEvent extends GenresEvent{
}