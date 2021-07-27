import 'package:flutter/material.dart';
import 'package:awesome_tools/widget/random_password/history_list.dart';
import 'package:awesome_tools/widget/random_password/gen_button.dart';

class RandomPassword extends StatefulWidget {
  RandomPassword({Key? key}) : super(key: key);

  @override
  _RandomPasswordState createState() => _RandomPasswordState();
}

class _RandomPasswordState extends State<RandomPassword> {
  // const RandomPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print("randompassword");
    return MaterialApp(
      title: "随机密码生成",
      home: Scaffold(
        appBar: AppBar(
          title: Text("随机密码生成"),
          // backgroundColor: Colors.deepPurple[400],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 400,
              child: HistoryPwdList(),
            ),
            PwdBotton(),
          ],
        ),
      ),
    );
  }
}
