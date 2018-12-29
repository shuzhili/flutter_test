import 'package:flutter/material.dart';

TextStyle getCustomFontTextStyle() {
  return const TextStyle(
    color: Colors.blueAccent,
    fontFamily: 'Pacifico',
    fontWeight: FontWeight.w400,
    fontSize: 36.0,
  );
}

LinearGradient getCustomGradient() {
  // Define a Linear Gradient
  return new LinearGradient(
      colors: [Colors.pink, Colors.blueAccent],
      begin: const FractionalOffset(0.0, 0.0),
      end: const FractionalOffset(0.6, 0.0),
      stops: [0.0, 0.6],
      tileMode: TileMode.clamp);
}
