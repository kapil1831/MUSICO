import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//const splashclr=Color.fromARGB(0, 15, 57, 91);
const Color kPrimaryColor = Color.fromARGB(255, 213, 59, 252);
const MaterialColor myDarkColor = const MaterialColor(
  0xff140214, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
  const <int, Color>{
    50: const Color(0xff3c053b), //10%
    100: const Color(0xff360434), //20%
    200: const Color(0xff2f042e), //30%
    300: const Color(0xff280327), //40%
    400: const Color(0xff220321), //50%
    500: const Color(0xff1b021a), //60%
    600: const Color(0xff140214), //70%
    700: const Color(0xff0d010d), //80%
    800: const Color(0xff070006), //90%
    900: const Color(0xff000000), //100%
  },
);
const Color myBtnColor = Color.fromARGB(255, 115, 117, 212);
const Color txtColor = Colors.white;
const Color txtColor2 = Colors.white70;
double myPaddingValue = 8.0;
const Color myGreyColor = Color.fromARGB(255, 47, 42, 48);
const Color playBtnColor = Color.fromARGB(255, 127, 122, 219);
