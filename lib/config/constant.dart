
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// --------------
/// Constant Color
/// --------------
Color primaryColor = Colors.blue;
Color blackColor = Colors.black;

/// --------------
/// Credentials access
/// --------------
String apiKey = "5f00d331dfd24c32a3e34d70cae204b6";

/// ------------
/// Device Size
/// ------------
double get deviceWidth => ScreenUtil().screenWidth;
double get deviceHeight => ScreenUtil().screenHeight;

/// ----------------------------------- 
/// Font and size scaling screen utils
/// ----------------------------------- 
/// Initialize screenutil and set default size
/// by device size
void setupScreenUtil(BuildContext context) {
  double baseWidth = MediaQuery.of(context).size.width;
  double baseHeight = MediaQuery.of(context).size.height;
  double defaultScreenUtilWidth = 1080;
  double defaultScreenUtilHeight = 1920;
  double iPadPro12InchWidth = 2048;
  double iPadPro12InchHeight = 2732;
  double designWidth = 0;
  double designHeight = 0;

  /// ipad 11-inch width: 834, height: 1194
  /// ipad 9-inch width: 768, height: 1024
  if (baseWidth >= 768) {
    designWidth = iPadPro12InchWidth;
  } else {
    designWidth = defaultScreenUtilWidth;
  }

  if (baseHeight >= 1024) {
    designHeight = iPadPro12InchHeight;
  } else {
    designHeight = defaultScreenUtilHeight;
  }

  ScreenUtil.init(
    BoxConstraints(
      maxWidth: baseWidth,
      maxHeight: baseHeight
    ),
    designSize: Size(designWidth, designHeight),
    orientation: Orientation.portrait
  );
}

/// Setting height and width 
double setWidth(double width) => ScreenUtil().setWidth(width);
double setHeight(double height) => ScreenUtil().setHeight(height);

/// Setting fontsize
double setFontSize(double size) => ScreenUtil().setSp(size);

/// ----------------------------------- 
/// Constant Base Text Styling
/// ----------------------------------- 

TextStyle styleTitle = TextStyle(
  fontSize: setFontSize(36),
  color: blackColor,
  fontWeight: FontWeight.w700
);

TextStyle styleSubtitle = TextStyle(
  fontSize: setFontSize(32),
  color: blackColor
);