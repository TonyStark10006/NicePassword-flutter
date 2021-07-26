import 'package:awesome_tools/widget/random_password/history_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:random_string/random_string.dart';
import 'package:fluttertoast/fluttertoast.dart';

// class PwdBotton extends StatefulWidget {
//   PwdBotton(void reload, {Key? key}) : super(key: key);

//   @override
//   _PwdBottonState createState() => _PwdBottonState();
// }

// class _PwdBottonState extends State<PwdBotton> {void Function() this.reload,
class PwdBotton extends StatelessWidget {
  PwdBotton({Key? key}) : super(key: key);

  // Function reload;
  String generateRandomString(int length) {
    return randomString(length);
  }

  // StreamController<int> s1 = StreamController<int>();

  // StreamSink<int> get StreamSink => s1.sink;
  // static var i = 0;
  // Stream<int> counter() {
  //   print("counter");
  //   print(i);
  //   s1.add(i);
  //   return Stream.value(++i);
  //   // return Stream.
  // }

  @override
  Widget build(BuildContext context) {
    // List<String> _historyPwdList = [];
    // List<String> _temHistoryPwdList = [];
    print("button");
    return TextButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          overlayColor: MaterialStateProperty.all<Color>(Colors.lightBlue)),
      onPressed: () {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) {
            var pwd = generateRandomString(16);
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
                    child: const Text('取消'),
                  ),
                  TextButton(
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: pwd));
                      eventBus.fire(pwd);
                      print('点击了复制');
                      showToast("已复制到粘贴板", 22);
                      Navigator.pop(context, 'OK');
                    },
                    child: const Text('复制'),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() => pwd = generateRandomString(16));
                      print('点击了再来一次');
                    },
                    child: Text('再来一次'),
                  ),
                ],
              );
            });
          },
        );
      },
      child: const Text('濑 滋 苟'),
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

class NewPasswod {
  NewPasswod(this.newPassword);
  String newPassword;
}
