import 'package:awesome_tools/util/shared_preferences_util.dart';
import 'package:bloc/bloc.dart';

enum ThemeEvent { toLightMode, toDarkMode, toAutoMode }

class ThemeType {
  ThemeType(this.mode);
  int mode;
}

// 0 => light, 1 => dark, 2 => follow system
class ThemeBloc extends Bloc<ThemeEvent, ThemeType> {
  ThemeBloc() : super(ThemeType(0));

  ThemeType changeMode(int mode) {
    SharedPreferencesUtil.saveData<int>("themeMode", mode);
    return ThemeType(mode);
  }

  @override
  Stream<ThemeType> mapEventToState(ThemeEvent event) async* {
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
