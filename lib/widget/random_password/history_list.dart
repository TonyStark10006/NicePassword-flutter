import 'package:awesome_tools/state/gen_password_provider.dart';
import 'package:awesome_tools/util/toast.dart';
import 'package:flutter/material.dart';
import 'package:awesome_tools/util/shared_preferences_util.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class HistoryPwdList extends StatefulWidget {
  HistoryPwdList({Key? key}) : super(key: key);

  @override
  _HistoryPwdListState createState() => _HistoryPwdListState();
}

class _HistoryPwdListState extends State<HistoryPwdList> {
  List<String> _temHistoryPwdList = [];
  bool passed = false;

  @override
  void initState() {
    print(1);
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
  }

  @override
  Widget build(BuildContext buildContext) {
    String pwd = buildContext.watch<GenRandomPasswordProvider>().randomPassword;
    bool pass = buildContext.watch<GenRandomPasswordProvider>().shouldPass;
    if (pass != this.passed) {
      this.passed = pass;
      _temHistoryPwdList.add(pwd);
      SharedPreferencesUtil.saveData<List<String>>(
        "historyPwdList",
        _temHistoryPwdList,
      );
    }
    return Column(
      children: [
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
