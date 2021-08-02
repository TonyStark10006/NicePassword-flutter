import 'package:awesome_tools/page/random_password.dart';
import 'package:awesome_tools/state/gen_password_provider.dart';
import 'package:awesome_tools/state/theme_provider.dart';
// import 'package:awesome_tools/util/get_device_info.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  // 屏幕刷新率和显示率不一致时的优化
  GestureBinding.instance?.resamplingEnabled = true;
  // getDeviceInfo();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          // lazy: false,
          create: (_) => GenRandomPasswordProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        )
      ],
      builder: (BuildContext context, _) {
        int mode = Provider.of<ThemeProvider>(context, listen: false).mode;
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
          title: "随机密码生成",
          //AppLocalizations.of(context)!.randomPasswordPageTitle,
          home: RandomPassword(),
          theme: ThemeData(
            // primarySwatch: Colors.blue,
            brightness: mode == 1 ? Brightness.light : Brightness.dark,
          ),
          darkTheme: ThemeData.dark(),
        );
      },
    );
    // throw UnimplementedError();
  }
}
