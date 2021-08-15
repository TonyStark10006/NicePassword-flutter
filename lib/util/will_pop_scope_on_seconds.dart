import 'package:awesome_tools/util/toast.dart';
import 'package:flutter/material.dart';

class WillPopScopeOnSeconds extends StatelessWidget {
  WillPopScopeOnSeconds({required this.childWidget});
  final Widget childWidget;
  DateTime? _lastPressedAt;

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: () async {
          if (_lastPressedAt == null ||
              DateTime.now().difference(_lastPressedAt!) >
                  Duration(seconds: 1)) {
            //两次点击间隔超过1秒则重新计时
            _lastPressedAt = DateTime.now();
            showToast("再按一次返回退出", timeInSecForIosWeb: 1, androidTime: 1);
            return false;
          } else {
            // showDialog(
            //     context: context,
            //     builder: (context) =>
            //         AlertDialog(title: Text('你确定要退出吗？'), actions: <Widget>[
            //           TextButton(
            //               child: Text('退出'),
            //               onPressed: () => Navigator.of(context).pop(true)),
            //           TextButton(
            //               child: Text('取消'),
            //               onPressed: () => Navigator.of(context).pop(false)),
            //         ]));
            return true;
          }
        },
        child: this.childWidget);
  }
}
