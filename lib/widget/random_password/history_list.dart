import 'dart:async';

import 'package:awesome_tools/util/toast.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:awesome_tools/util/shared_preferences_util.dart';
import 'package:flutter/services.dart';

EventBus eventBus = EventBus();

class HistoryPwdList extends StatefulWidget {
  HistoryPwdList({Key? key}) : super(key: key);

  @override
  _HistoryPwdListState createState() => _HistoryPwdListState();
}

class _HistoryPwdListState extends State<HistoryPwdList> {
  List<String> _temHistoryPwdList = [];
  late StreamSubscription subscription;

  @override
  void initState() {
    // print(1);
    super.initState();
    SharedPreferencesUtil.getData<List<String>?>("historyPwdList")
        .then((value) {
      if (value != null) {
        _temHistoryPwdList = value;
      }
      setState(() {
        _temHistoryPwdList = _temHistoryPwdList;
      });
      // ignore: invalid_return_type_for_catch_error
    }).catchError((onError) => {print(onError)});
    subscription = eventBus.on<String>().listen((event) {
      setState(() {
        _temHistoryPwdList.add(event);
      });
      SharedPreferencesUtil.saveData<List<String>>(
        "historyPwdList",
        _temHistoryPwdList,
      );
    });
  }

  @override
  void dispose() {
    //不取消则存在内存泄漏
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext buildContext) {
    return Column(
      children: [
        ListTile(
          title: Text(
            "历史生成密码",
            style: Theme.of(buildContext).textTheme.headline5,
          ),
        ),
        Expanded(
            child: ListView.builder(
                // reverse: true,
                itemCount: _temHistoryPwdList.length,
                // shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_temHistoryPwdList[index]),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextButton(
                          onPressed: () => {
                            _temHistoryPwdList.removeAt(index),
                            setState(() {
                              _temHistoryPwdList = _temHistoryPwdList;
                            }),
                            SharedPreferencesUtil.saveData<List<String>>(
                              "historyPwdList",
                              _temHistoryPwdList,
                            ),
                          },
                          child: Text("删除"),
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.all(-20),
                            ),
                          ),
                        ),
                        TextButton(
                            onPressed: () => {
                                  Clipboard.setData(ClipboardData(
                                    text: _temHistoryPwdList[index],
                                  )),
                                  showToast("已复制到粘贴板", 22),
                                },
                            child: Text("复制")),
                      ],
                    ),
                  );
                }))
      ],
    );
  }
}
