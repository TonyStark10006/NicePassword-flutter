import 'package:awesome_tools/state/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Setting extends StatelessElement {
  Setting(StatelessWidget widget) : super(widget);

  @override
  Widget build() {
    return StatefulBuilder(builder: (context, _) {
      ThemeProvider provider = context.watch<ThemeProvider>();
      return ListView(
        children: [
          ListTile(
            title: Text("浅色模式"),
            onTap: () => provider.setMode(1),
          ),
          ListTile(
            title: Text("深色模式"),
            onTap: () => provider.setMode(2),
          ),
          ListTile(
            title: Text("跟随系统"),
            onTap: () => provider.setMode(3),
          ),
        ],
      );
    });
  }
}
