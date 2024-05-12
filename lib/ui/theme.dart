import 'package:flutter/material.dart';

const scrollDuration = Duration(milliseconds: 500);
const scrollCurve = Curves.easeOutExpo;
const largeTextStyle = TextStyle(fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: 0, height: 1.25);
const textStyle = TextStyle(fontSize: 22, fontWeight: FontWeight.w400, letterSpacing: 0, height: 1.27);
const smallTextStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 0.15, height: 1.50);

const _appBarTheme = AppBarTheme(
  centerTitle: false,
);

final lightTheme = ThemeData(
  brightness: Brightness.light,
  appBarTheme: _appBarTheme,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.amber,
    primary: Colors.black,
    primaryContainer: Colors.amber,
    onPrimaryContainer: Colors.black,
    secondaryContainer: Colors.amber,
    onSecondaryContainer: Colors.black,
    surfaceTint: Colors.grey,
  ),
);

final darkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: Colors.amber,
  primaryContainer: Colors.amber,
  onPrimaryContainer: Colors.black,
  secondaryContainer: Colors.amber,
  onSecondaryContainer: Colors.black,
  background: Colors.black,
  surface: Colors.black,
  surfaceTint: Colors.white,
);

ThemeData darkTheme(final BuildContext context) {
  return ThemeData(
    brightness: Brightness.dark,
    appBarTheme: _appBarTheme,
    chipTheme: ChipThemeData(
      deleteIconColor: darkColorScheme.secondary,
      checkmarkColor: darkColorScheme.onSecondaryContainer,
      labelStyle: Theme.of(context).textTheme.labelLarge?.copyWith(color: MaterialStateColor.resolveWith(getFillColor)),
    ),
    colorScheme: darkColorScheme,
  );
}

Color getFillColor(final Set<MaterialState> states) {
  if (states.contains(MaterialState.selected)) {
    return darkColorScheme.onSecondaryContainer;
  }
  return darkColorScheme.onSurface;
}
