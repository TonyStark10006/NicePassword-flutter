import 'package:flutter/material.dart';
import 'package:awesome_tools/widget/random_password/history_list.dart';
import 'package:awesome_tools/widget/random_password/gen_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RandomPassword extends StatefulWidget {
  RandomPassword({Key? key}) : super(key: key);

  @override
  _RandomPasswordState createState() => _RandomPasswordState();
}

class _RandomPasswordState extends State<RandomPassword> {
  // const RandomPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(Localizations.localeOf(context));
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.randomPasswordPageTitle),
        // backgroundColor: Colors.deepPurple[400],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: UnderlineTabIndicator(
                borderSide: BorderSide(
                  color: Colors.blue,
                  width: 3.0,
                ),
              ),
              height: 400,
              margin: EdgeInsets.only(top: 20, left: 5, right: 5),
              child: HistoryPwdList(),
            ),
            PwdBotton(),
          ],
        ),
      ),
    );
  }
}
