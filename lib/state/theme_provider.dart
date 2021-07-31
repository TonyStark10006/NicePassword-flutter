import 'package:awesome_tools/util/shared_preferences_util.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  int _mode = 1;

  int get mode => _mode;

  void setMode(int mode) {
    _mode = mode;
    SharedPreferencesUtil.saveData<int>("themeMode", _mode);

    notifyListeners();
  }
}
