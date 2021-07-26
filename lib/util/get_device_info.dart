import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

void getDeviceInfo() async {
  try {
    // 输出运行设备的信息
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (kIsWeb) {
      WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
      print('Running on ${webBrowserInfo.userAgent}');
    } else {
      if (Platform.isIOS) {
        // IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
        // print('Running on ${deviceInfo.toString()}');
      }
    }
    // else {
    //   print(deviceInfo.toString());
    //   if (Platform.isIOS) {
    //     IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
    //     print('Running on ${iosDeviceInfo.systemVersion}');
    //   }
    // }
  } on PlatformException {
    throw 'Error: Failed to get platform version.';
  }
}
