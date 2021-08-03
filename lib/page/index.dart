import 'package:awesome_tools/page/random_password.dart';
import 'package:awesome_tools/page/setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Index extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;
    var border = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
      side: BorderSide(
        width: 2,
        color: Colors.blue,
        style: BorderStyle.solid,
      ),
    );
    var divider = Divider(
      color: Colors.transparent,
    );
    return Scaffold(
        appBar: AppBar(
          title: Text(local.appName),
        ),
        body: Container(
          child: ListView(
            padding: EdgeInsets.all(8.0),
            children: [
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RandomPassword()));
                },
                title: Text(local.randomPasswordPageTitle),
                // tileColor: Colors.blue[50],
                shape: border,
              ),
              divider,
              ListTile(
                title: Text(local.gallery),
                // tileColor: Colors.blue[50],
                shape: border,
              ),
              divider,
              ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Setting();
                  }));
                },
                title: Text(local.settings),
                // tileColor: Colors.blue[50],
                shape: border,
              ),
              divider,
            ],
          ),
        ));
    // throw UnimplementedError();
  }
}
