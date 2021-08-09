import 'package:awesome_tools/util/shared_preferences_util.dart';
import 'package:bloc/bloc.dart';

class ThemeCubit extends Cubit<int> {
  // 0 => light, 1 => dark, 2 => follow system
  ThemeCubit(int initialState) : super(initialState);

  void changeMode(int mode) {
    SharedPreferencesUtil.saveData<int>("themeMode", mode);
    emit(mode);
  }

  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    print(change);
  }
}
