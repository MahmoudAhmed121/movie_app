part of 'app_theme_cubit.dart';

abstract class AppThemeState extends Equatable {
  const AppThemeState();

  @override
  List<Object> get props => [];
}

class AppThemeInitial extends AppThemeState {}

class AppDarkTheme extends AppThemeState {}

class AppLightTheme extends AppThemeState {}


