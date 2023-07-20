import 'package:equatable/equatable.dart';

import '../../../domain/entities/cast.dart';

abstract class CastState extends Equatable {
  const CastState();

  @override
  List<Object> get props => [];
}

class CastInitial extends CastState {}

class CastLoading extends CastState {}

class CastSuccess extends CastState {
  final List<Cast> cast;
  const CastSuccess({
    required this.cast,
  });
    @override
  List<Object> get props => [cast];
}

class CastFailure extends CastState {

final String errorMessage;
  const CastFailure({
    required this.errorMessage,
  });


    @override
  List<Object> get props => [errorMessage];
}
