import 'package:awesome_tools/state/gen_password_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;
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
            Text("${local.pwdLength}:    "),
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
            if (_upperCase == false &&
                _lowerCase == false &&
                _number == false &&
                _character == false) {
              showDialog<String>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                        content: Text(local.emptyCondition),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context, 'NoConditionsOK');
                            },
                            child: Text(local.ok),
                          ),
                        ]);
                  });
            } else {
              String pwd = getNewPassword();
              showDialog<String>(
                context: context,
                builder: (BuildContext context) {
                  return StatefulBuilder(builder: (context, setState) {
                    return AlertDialog(
                      // title: const Text('随机密码已生成'),
                      content: Text(pwd),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            print('点击了取消');
                            Navigator.pop(context, 'Cancel');
                          },
                          child: Text(local.cancel),
                        ),
                        TextButton(
                          onPressed: () {
                            Clipboard.setData(ClipboardData(text: pwd));
                            // eventBus.fire(pwd);
                            context.read<GenRandomPasswordProvider>().pass();
                            print('点击了复制' + pwd);
                            showToast(local.copiedToClipBoard, 22);
                            Navigator.pop(context, 'OK');
                          },
                          child: Text(local.copy),
                        ),
                        TextButton(
                          onPressed: () {
                            pwd = getNewPassword();
                            print(pwd + '点击了再来一次');
                            setState(() {
                              pwd = pwd;
                            });
                          },
                          child: Text(local.oneMoreTime),
                        ),
                      ],
                    );
                  });
                },
              );
            }
          },
          child: Text(local.genPWD),
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

  String getNewPassword() {
    return context.read<GenRandomPasswordProvider>().getRandomPassword(
        _upperCase, _lowerCase, _number, _character, _passwordLength);
  }
}
