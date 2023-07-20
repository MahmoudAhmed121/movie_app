// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

abstract class CastEvent extends Equatable {
  const CastEvent();

  @override
  List<Object> get props => [];
}

class GetCastEvent extends CastEvent {
  final int id;
  const GetCastEvent({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}
