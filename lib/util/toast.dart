import 'package:fluttertoast/fluttertoast.dart';

showToast(String message, double? fontSize) {
  Fluttertoast.showToast(
    msg: message,
    // gravity: ToastGravity.CENTER,
    toastLength: Toast.LENGTH_LONG,
    fontSize: fontSize ?? 16.0,
  );
}
