import 'package:flutter/material.dart';
import 'ui/home.dart';

final ThemeData _appTheme = _buildAppTheme();

ThemeData _buildAppTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    brightness: Brightness.dark,
    colorScheme: base.colorScheme.copyWith( //doesn't work :(
      primary: Colors.green,
      secondary: Colors.amber
    ),
    scaffoldBackgroundColor: Colors.red,
    backgroundColor: Colors.amber,
    textTheme: _appTextTheme(base.textTheme)
  );
}

TextTheme _appTextTheme(TextTheme base) {
  return base.copyWith(
    headline1: base.headline1?.copyWith(
      fontWeight: FontWeight.w500,
    ),
    titleLarge: base.titleLarge?.copyWith(
      fontSize: 18.0
    ),
    caption: base.caption?.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14
    ),
    bodyText1: base.bodyText2?.copyWith(
      fontSize: 16.9,
      color: Colors.white,
    ),
    bodyText2: base.bodyText2?.copyWith(
      fontSize: 16.9,
      color: Colors.white,
      fontFamily: "Lobster"
    ).apply(
      fontFamily: "Lobster",
    )
  );
}

void main() => runApp(new MaterialApp(
  //theme: _appTheme, //when applied app goes dark, doesn't work for now
  home: QuizApp(),
));