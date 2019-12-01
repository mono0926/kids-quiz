import 'package:flutter/material.dart';

ThemeData buildTheme() {
  final base = ThemeData.light();
  const accentColor = Color(0xFFF07467);
  const fontFamily = 'Hiragino Maru Gothic ProN';
  final primaryTextTheme = base.primaryTextTheme.apply(
    fontFamily: fontFamily,
  );
  return ThemeData(
    primaryTextTheme: primaryTextTheme,
    accentTextTheme: base.accentTextTheme
        .copyWith(
          headline: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        )
        .apply(
          fontFamily: fontFamily,
        ),
    textTheme: base.textTheme
        .copyWith(
          display1: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        )
        .apply(
          fontFamily: fontFamily,
        ),
    primarySwatch: Colors.blue,
    accentColor: accentColor,
    scaffoldBackgroundColor: Colors.lightBlue[50],
    cardTheme: CardTheme(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.hardEdge,
    ),
    splashFactory: InkRipple.splashFactory,
    typography: base.typography.copyWith(
      englishLike: Typography.englishLike2018,
      dense: Typography.dense2018,
      tall: Typography.tall2018,
    ),
    buttonTheme: base.buttonTheme.copyWith(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      buttonColor: accentColor,
      textTheme: ButtonTextTheme.accent,
    ),
    appBarTheme: AppBarTheme(
      textTheme: primaryTextTheme.copyWith(
        title: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
    ),
  );
}
