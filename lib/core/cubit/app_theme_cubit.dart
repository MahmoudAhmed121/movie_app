import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/theme/enum_theme.dart';
import 'package:movie_app/core/utils/cache_helber.dart';
import 'package:movie_app/core/utils/constant.dart';

part 'app_theme_state.dart';

class AppThemeCubit extends Cubit<AppThemeState> {
  AppThemeCubit() : super(AppThemeInitial());

  static AppThemeCubit get(context) => BlocProvider.of(context);
  dynamic primaryColor = kPrimaryyColor;
  bool isChanged = false;
  bool changed = true;
  bool changedButtom = false;
  changeTheme(ThemeState themeState) async {
    print(themeState);
    switch (themeState) {
      case ThemeState.initial:
        if (await CacheHelber.getData(key: "theme") != null) {
          if (await CacheHelber.getData(key: "theme") == "d") {
            emit(AppDarkTheme());
          } else {
            emit(AppLightTheme());
          }
        }
        break;
      case ThemeState.dark:
        await CacheHelber.saveData(key: "theme", value: "d");
        isChanged = !isChanged;
        changed = !changed;
        changedButtom = !changedButtom;
        emit(AppDarkTheme());
        break;
      case ThemeState.light:
        await CacheHelber.saveData(key: "theme", value: "l");
        isChanged = !isChanged;
        changed = !changed;
        changedButtom = !changedButtom;
        emit(AppLightTheme());
        break;
      default:
    }
  }
}
