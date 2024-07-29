import 'package:flutter/widgets.dart';

class Spacers {
  static const em = 4.0;

  static const xxs = 1 * em;
  static const xs = 2 * em;
  static const s = 3 * em;
  static const m = 4 * em;
  static const l = 6 * em;
  static const xl = 8 * em;
  static const x2l = 12 * em;
  static const x3l = 16 * em;
  static const x4l = 24 * em;
  static const x5l = 32 * em;
  static const x6l = 64 * em;
}

Widget vSpace(double height) => SizedBox(height: height);
Widget hSpace(double width) => SizedBox(width: width);

double screenAspectRatio(BuildContext context) =>
    screenWidth(context) / screenHeight(context);
double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

double screenHeightFraction(BuildContext context,
    {double dividedBy = 1, double offsetBy = 0}) =>
    (screenHeight(context) - offsetBy) / dividedBy;

double screenWidthFraction(BuildContext context,
    {double dividedBy = 1, double offsetBy = 0}) =>
    (screenWidth(context) - offsetBy) / dividedBy;
