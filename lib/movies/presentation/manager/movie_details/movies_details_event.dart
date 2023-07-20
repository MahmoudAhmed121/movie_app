// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:equatable/equatable.dart';

abstract class MoviesDetailsEvent extends Equatable {
  const MoviesDetailsEvent();

  @override
  List<Object> get props => [];
}


class GetMovieDetailsEvent extends MoviesDetailsEvent {
  final int id;
  const GetMovieDetailsEvent({
    required this.id,
  });
  
  @override
  List<Object> get props => [id];
}

