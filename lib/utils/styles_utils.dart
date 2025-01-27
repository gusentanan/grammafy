import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// ----------------
/// Status Bar Color
/// ----------------
void setStatusBar(
    {Brightness brightness = Brightness.dark,
    Color color = Colors.transparent}) {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarBrightness: Brightness.light,
    statusBarColor: color,
    statusBarIconBrightness: brightness,
    systemNavigationBarColor: Colors.transparent,
  ));
}

/// -----------------------------------
/// Font and size scaling screen utils
/// -----------------------------------
/// Initialize screen util and set default size
/// by device size
void setupScreenUtil(BuildContext context) {
  double defaultScreenUtilWidth = 1080;
  double defaultScreenUtilHeight = 1920;

  double designWidth = 0;
  double designHeight = 0;

  designWidth = defaultScreenUtilWidth;
  designHeight = defaultScreenUtilHeight;

  ScreenUtil.init(
    context,
    designSize: Size(designWidth, designHeight),
  );
}

/// Setting height and width
double setWidth(double width) => ScreenUtil().setWidth(width);
double setHeight(double height) => ScreenUtil().setHeight(height);
