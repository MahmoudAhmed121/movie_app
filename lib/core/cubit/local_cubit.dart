
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/cubit/local_state.dart';
import 'package:movie_app/core/theme/enum_theme.dart';
import 'package:movie_app/core/utils/cache_helber.dart';

class LocalCubit extends Cubit<LocalState> {
  LocalCubit() : super(AppThemeInitial());

  static LocalCubit get(context) => BlocProvider.of(context);
  bool changed = true;
String lang = "en";
  changeTheme(ThemeState themeState) async {
    switch (themeState) {
      case ThemeState.initial:
        if (await CacheHelber.getData(key: "theme") != null) {
          if (await CacheHelber.getData(key: "theme") == "d") {
            emit(const AppDarkTheme());
          } else {
            emit(const AppLightTheme());
          }
        }
        break;
      case ThemeState.dark:
        await CacheHelber.saveData(key: "theme", value: "d");

        changed = !changed;
        emit(const AppDarkTheme());
        break;
      case ThemeState.light:
        await CacheHelber.saveData(key: "theme", value: "l");
changed = !changed;
        emit(const AppLightTheme());
        break;
      default:
    }
  }

  
 
}
