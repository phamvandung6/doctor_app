import 'package:doctor_app/core/utils/constants/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

void toast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 2,
    backgroundColor: TColors.blue,
    textColor: TColors.textPrimary,
    fontSize: 16,
  );
}