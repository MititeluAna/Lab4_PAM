import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'custom_colors.dart';
import 'fonts.dart';

class TextStyles {
  static TextStyle textStyleSignika18({Color? color}) =>
      TextStyle(fontSize: 18, color: color ?? CustomColors.mineShaft, fontFamily: Fonts.signikaRegular);

  static TextStyle textStyleSignika25({Color? color}) =>
      TextStyle(fontSize: 25, color: color ?? CustomColors.mineShaft, fontFamily: Fonts.signikaRegular);

  static TextStyle textStylePoppins18({Color? color}) =>
      TextStyle(fontSize: 18, color: color ?? Colors.black, fontFamily: Fonts.poppinsSemiBold);

  static TextStyle textStylePoppins14({Color? color}) =>
      TextStyle(fontSize: 14, color: color ?? CustomColors.easternBlue, fontFamily: Fonts.poppinsSemiBold);

  static TextStyle textStylePoppins14M({Color? color}) =>
      TextStyle(fontSize: 14, color: color ?? CustomColors.easternBlue, fontFamily: Fonts.poppinsMedium);

  static TextStyle textStylePoppins24({Color? color}) =>
      TextStyle(fontSize: 24, color: color ?? Colors.black, fontFamily: Fonts.poppinsSemiBold);

  static TextStyle textStylePoppins16({Color? color}) =>
      TextStyle(fontSize: 16, color: color ?? Colors.black, fontFamily: Fonts.poppinsSemiBold);
}