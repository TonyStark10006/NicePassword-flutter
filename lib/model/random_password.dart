import 'dart:math';

class RandomPasswordModel {
  RandomPasswordModel(this.upperCaseCondition, this.lowerCaseCondition,
      this.numberCondition, this.characterCondition,
      {this.passwordLength = 8});

  // this.upperCaseCondition = false,
  // this.lowerCaseCondition = true,
  // this.numberCondition = true,
  // this.characterCondition = false,
  // this.passwordLength = 8

  bool upperCaseCondition;
  bool lowerCaseCondition;
  bool numberCondition;
  bool characterCondition;
  int passwordLength;

  String getPassword() {
    String lowerCase = "abcdefghijklmnopqrstuvwxyz";
    String upperCase = lowerCase.toUpperCase();
    String number = "0123456789";
    String character = '!@#\$%^&*';
    late String set;
    String result = '';

    set = (lowerCaseCondition ? lowerCase : '');
    set += (upperCaseCondition ? upperCase : '');
    set += (numberCondition ? number : '');
    set += (characterCondition ? character : '');

    for (var i = 0; i < passwordLength; i++) {
      int randomPosition = Random.secure().nextInt(set.length);
      result += set[randomPosition];
    }

    return result;
  }
}
