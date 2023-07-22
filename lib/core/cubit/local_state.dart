// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:equatable/equatable.dart';

abstract class LocalState extends Equatable {
  const LocalState();

  @override
  List<Object> get props => [];
}

class AppThemeInitial extends LocalState {}

class AppDarkTheme extends LocalState {
  final Locale? locale;

  const AppDarkTheme({
     this.locale,
  });

 

  AppDarkTheme copyWith({
    Locale? locale,
  }) {
    return AppDarkTheme(
      locale: locale ?? this.locale,
    );
  }
}

class AppLightTheme extends LocalState {
  final Locale? locale;

  const AppLightTheme({
     this.locale,
  });

  
}
