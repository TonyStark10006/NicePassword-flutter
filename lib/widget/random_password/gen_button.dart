import 'package:awesome_tools/model/random_password.dart';
import 'package:awesome_tools/widget/random_password/history_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PwdBotton extends StatefulWidget {
  PwdBotton({Key? key}) : super(key: key);

  @override
  _PwdBottonState createState() => _PwdBottonState();
}

class _PwdBottonState extends State<PwdBotton> {
// class PwdBotton extends StatelessWidget { void reload,
  // PwdBotton({Key? key}) : super(key: key);

  bool _upperCase = false;
  bool _lowerCase = true;
  bool _number = true;
  bool _character = false;
  int _passwordLength = 8;

  String getPassword() {
    return RandomPasswordModel(
      _upperCase,
      _lowerCase,
      _number,
      _character,
      _passwordLength,
    ).getPassword();
  }

  @override
  Widget build(BuildContext context) {
    // !@#$%^&* A-Z a-z 0-9
    return Column(
      children: [
        Row(children: [
          Checkbox(
              value: _upperCase,
              onChanged: (value) {
                setState(() {
                  _upperCase = !_upperCase;
                });
              }),
          Text("A-Z"),
          // Spacer(),
          Checkbox(
              value: _lowerCase,
              onChanged: (value) {
                setState(() {
                  _lowerCase = !_lowerCase;
                });
              }),
          Text("a-z"),
          Checkbox(
              value: _number,
              onChanged: (value) {
                setState(() {
                  _number = !_number;
                });
              }),
          Text("0-9"),
          Checkbox(
              value: _character,
              onChanged: (value) {
                setState(() {
                  _character = !_character;
                });
              }),
          Text('!@#\$%^&*'),
        ]),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("密码长度:    "),
            DropdownButton(
              value: _passwordLength,
              onChanged: (int? newValue) {
                setState(() {
                  _passwordLength = newValue!;
                });
              },
              items:
                  <int>[8, 10, 12, 16].map<DropdownMenuItem<int>>((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
            ),
          ],
        ),
        TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              overlayColor: MaterialStateProperty.all<Color>(Colors.lightBlue)),
          onPressed: () {
            showDialog<String>(
              context: context,
              builder: (BuildContext context) {
                var pwd = getPassword();
                // return StatefulBuilder(builder: (context, setState) {
                return AlertDialog(
                  // title: const Text('随机密码已生成'),
                  content: Text(pwd),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        print('点击了取消');
                        Navigator.pop(context, 'Cancel');
                      },
                      child: const Text('取消'),
                    ),
                    TextButton(
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: pwd));
                        eventBus.fire(pwd);
                        print('点击了复制');
                        showToast("已复制到粘贴板", 22);
                        Navigator.pop(context, 'OK');
                        print(pwd);
                      },
                      child: const Text('复制'),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() => pwd = getPassword());
                        print('点击了再来一次');
                      },
                      child: Text('再来一次'),
                    ),
                  ],
                );
                // });
              },
            );
          },
          child: const Text('濑 滋 苟'),
        )
      ],
    );
  }

  showToast(String message, double? fontSize) {
    Fluttertoast.showToast(
      msg: message,
      // gravity: ToastGravity.CENTER,
      toastLength: Toast.LENGTH_LONG,
      fontSize: fontSize ?? 16.0,
    );
  }
}

class NewPassword {
  NewPassword(
    this.newPassword,
    // this.upperCase,
    // this.lowerCase,
    // this.number,
    // this.character,
  );
  String newPassword;
  // bool upperCase;
  // bool lowerCase;
  // bool number;
  // bool character;
}
