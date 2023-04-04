import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ColorsApp {
  static Color defaultBackground = const Color.fromRGBO(236, 236, 236, 1);
}

void changeSystemColor(Color color) {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: color, statusBarIconBrightness: Brightness.dark));
}
