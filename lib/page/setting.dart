import 'package:awesome_tools/state/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Setting extends StatelessElement {
  Setting(StatelessWidget widget) : super(widget);

  @override
  Widget build() {
    return StatefulBuilder(builder: (context, _) {
      var local = AppLocalizations.of(context)!;
      ThemeProvider provider = context.watch<ThemeProvider>();
      return ListView(
        children: [
          ListTile(
            title: Text(local.lightMode),
            onTap: () => provider.setMode(1),
          ),
          ListTile(
            title: Text(local.darkMode),
            onTap: () => provider.setMode(2),
          ),
          ListTile(
            title: Text(local.followSysAppearance),
            onTap: () => provider.setMode(3),
          ),
        ],
      );
    });
  }
}
