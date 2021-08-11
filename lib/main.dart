import 'package:awesome_tools/page/index.dart';
import 'package:awesome_tools/state/gen_password_provider.dart';
import 'package:awesome_tools/state/theme_bloc.dart';
import 'package:awesome_tools/util/shared_preferences_util.dart';
// import 'package:awesome_tools/state/theme_cubit.dart';
// import 'package:awesome_tools/state/theme_provider.dart';
// import 'package:awesome_tools/util/get_device_info.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // 屏幕刷新率和显示率不一致时的优化
  GestureBinding.instance?.resamplingEnabled = true;
  // getDeviceInfo();
  SharedPreferencesUtil.getData<int>("themeMode").then((value) {
    runApp(App(value));
  }, onError: (error) {
    runApp(App(null));
  });
  // runApp(App());
}

class App extends StatelessWidget {
  int? _modeLocal;
  bool readLocalMode = false;

  App(this._modeLocal);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          // lazy: false,
          create: (_) => GenRandomPasswordProvider(),
        ),
        // ChangeNotifierProvider(
        // create: (_) => ThemeProvider(),
        // )
      ],
      builder: (BuildContext context, _) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<ThemeBloc>(
              create: (_) => ThemeBloc(),
            )
          ],
          child: BlocBuilder<ThemeBloc, ThemeModeMsg>(
              builder: (context, themeModeMsg) {
            // int mode = Provider.of<ThemeProvider>(context, listen: true).mode;
            var _mode = BlocProvider.of<ThemeBloc>(context).state.mode;
            if (_modeLocal != null && readLocalMode == false) {
              _mode = _modeLocal!;
              readLocalMode = !readLocalMode;
            }
            return MaterialApp(
              localizationsDelegates: [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: [
                Locale('zh', ''),
                Locale('en', ''),
              ],
              title: "很赞工具箱",
              //AppLocalizations.of(context)!.randomPasswordPageTitle,
              home: Index(), //RandomPassword()
              theme: _mode == 2
                  ? ThemeData(
                      primarySwatch: Colors.blue,
                      // brightness: mode == 1 ? Brightness.light : Brightness.dark,
                    )
                  : _mode == 0
                      ? ThemeData.light()
                      : ThemeData.dark(),
              darkTheme: _mode == 0 ? null : ThemeData.dark(),
            );
          }),
        );
      },
    );
  }
}
