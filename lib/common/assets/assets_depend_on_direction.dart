import 'package:flutter/material.dart';

class AssetsDependOnDirection{

  static String getRow(BuildContext context) {
    TextDirection textDirection = Directionality.of(context);
     bool isRTL = textDirection == TextDirection.rtl;
    return isRTL?"assets/icons/miniLeft.svg":"assets/icons/miniRight.svg";
  }
}