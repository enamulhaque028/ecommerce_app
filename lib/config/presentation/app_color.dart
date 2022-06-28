import 'package:flutter/material.dart';

class AppColor {
  AppColor._();

  static const Gradient appBarGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[Color(0xFF1ACBFC), Color(0xFF1B90F5)],
  );

  static const Gradient buttonGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[
      Color.fromRGBO(26, 201, 253, 1),
      Color.fromRGBO(29, 105, 241, 1)
    ],
  );
}
