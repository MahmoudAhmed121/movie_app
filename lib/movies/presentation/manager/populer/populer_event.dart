
import 'package:equatable/equatable.dart';
abstract class PopulerEvent extends Equatable {
  const PopulerEvent();

  @override
  List<Object> get props => [];
}

class GetPopulerEvent extends PopulerEvent{}