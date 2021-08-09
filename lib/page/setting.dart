import 'package:awesome_tools/state/theme_bloc.dart';
// import 'package:awesome_tools/state/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Setting extends StatelessWidget {
  Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return StatefulBuilder(builder: (context, _) {
    var local = AppLocalizations.of(context)!;
    // ThemeProvider provider = context.watch<ThemeProvider>();
    ThemeBloc blocProvider = context.read<ThemeBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text(local.settings),
      ),
      body: ListView(
        children: ListTile.divideTiles(context: context, tiles: [
          ListTile(
            title: Text(local.lightMode),
            onTap: () =>
                blocProvider.add(ThemeEvent.toLightMode), //provider.setMode(0),
          ),
          ListTile(
            title: Text(local.darkMode),
            onTap: () =>
                blocProvider.add(ThemeEvent.toDarkMode), //provider.setMode(1),
          ),
          ListTile(
            title: Text(local.followSysAppearance),
            onTap: () =>
                blocProvider.add(ThemeEvent.toAutoMode), //provider.setMode(2),
          ),
        ]).toList(),
      ),
    );
    //;
    // });
  }
}
