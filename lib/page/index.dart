import 'package:awesome_tools/page/gallery.dart';
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
                title: Row(
                  children: [
                    Icon(Icons.toys),
                    SizedBox(width: 8),
                    Text(local.randomPasswordPageTitle),
                  ],
                ),

                // tileColor: Colors.blue[50],
                shape: border,
              ),
              divider,
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.picture_in_picture),
                    SizedBox(width: 8),
                    Text(local.gallery),
                  ],
                ),
                // tileColor: Colors.blue[50],
                shape: border,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Gallery();
                  }));
                },
              ),
              divider,
              ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Setting();
                  }));
                },
                title: Row(
                  children: [
                    Icon(Icons.settings),
                    SizedBox(width: 8),
                    Text(local.settings),
                  ],
                ),
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
