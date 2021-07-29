import 'package:awesome_tools/page/random_password.dart';
import 'package:awesome_tools/state/gen_password_provider.dart';
// import 'package:awesome_tools/util/get_device_info.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  // 屏幕刷新率和显示率不一致时的优化
  GestureBinding.instance?.resamplingEnabled = true;
  // getDeviceInfo();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          // lazy: false,
          create: (_) => GenRandomPasswordProvider(),
        ),
      ],
      child: RandomPassword(),
    ),
  );
}
