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
    textTheme: TextTheme(
      bodyText2: TextStyle(
        fontSize: 16.9,
        color: Colors.white,
      )
    )
  );
}

TextTheme _appTextTheme(TextTheme base) {
  return base.copyWith(
    headline1: base.headline1?.copyWith(
      fontWeight: FontWeight.w500,
    ),
    titleLarge: base.titleLarge?.copyWith(
      fontSize: 18.0
    )

  );
}

void main() => runApp(new MaterialApp(
  theme: _appTheme,
  home: QuizApp(),
));