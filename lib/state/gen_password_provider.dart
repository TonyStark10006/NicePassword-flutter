import 'package:awesome_tools/model/random_password.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class GenRandomPasswordProvider with ChangeNotifier, DiagnosticableTreeMixin {
  String _randomPassword = '';
  bool _pass = false;

  String get randomPassword => _randomPassword;

  bool get shouldPass => _pass;

  String getRandomPassword(bool upperCaseCondition, bool lowerCaseCondition,
      bool numberCondition, bool characterCondition, int passwordLength) {
    _randomPassword = RandomPasswordModel(
      upperCaseCondition,
      lowerCaseCondition,
      numberCondition,
      characterCondition,
      passwordLength: passwordLength,
    ).getPassword();
    notifyListeners();
    return _randomPassword;
  }

  void pass() {
    this._pass = !this._pass;
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty("randomPassword", randomPassword));
    properties.add(StringProperty("pass", shouldPass.toString()));
  }
}
