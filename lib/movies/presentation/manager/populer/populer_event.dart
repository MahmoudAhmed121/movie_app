// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

abstract class PopulerEvent extends Equatable {
  const PopulerEvent();

  @override
  List<Object> get props => [];
}

class GetPopulerEvent extends PopulerEvent {
  final int id;

  const GetPopulerEvent({required this.id,});

  @override
  List<Object> get props => [id];
}



