import 'package:awesome_tools/util/shared_preferences_util.dart';
import 'package:bloc/bloc.dart';

enum ThemeEvent { toLightMode, toDarkMode, toAutoMode }

class ThemeModeMsg {
  ThemeModeMsg(this.mode);
  int mode;
}

// 0 => light, 1 => dark, 2 => follow system
class ThemeBloc extends Bloc<ThemeEvent, ThemeModeMsg> {
  ThemeBloc() : super(ThemeModeMsg(2));

  ThemeModeMsg changeMode(int mode) {
    SharedPreferencesUtil.saveData<int>("themeMode", mode);
    return ThemeModeMsg(mode);
  }

  @override
  Stream<ThemeModeMsg> mapEventToState(ThemeEvent event) async* {
    switch (event) {
      case ThemeEvent.toLightMode:
        yield changeMode(0);
        break;
      case ThemeEvent.toDarkMode:
        yield changeMode(1);
        break;
      case ThemeEvent.toAutoMode:
        yield changeMode(2);
        break;
    }
  }

  // @override
  // void onChange(Change<ThemeType> change) {
  //   super.onChange(change);
  //   print(change.currentState.mode);
  // }
}
