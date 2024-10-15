import 'package:flutter/material.dart';

const scrollDuration = Duration(milliseconds: 500);
const scrollCurve = Curves.easeOutExpo;
const largeTextStyle = TextStyle(fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: 0, height: 1.25);
const textStyle = TextStyle(fontSize: 22, fontWeight: FontWeight.w400, letterSpacing: 0, height: 1.27);
const smallTextStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 0.15, height: 1.50);
const kDefaultRadius = BorderRadius.all(Radius.circular(12));

const kDefaultShape = RoundedRectangleBorder(
  borderRadius: kDefaultRadius,
);

final _appBarLightTheme = AppBarTheme(
  shadowColor: lightColorScheme.shadow,
  centerTitle: false,
);

final _appBarDarkTheme = AppBarTheme(
  shadowColor: darkColorScheme.shadow,
  centerTitle: false,
);

const _cardTheme = CardTheme(
  shape: kDefaultShape,
);

const _sliderTheme = SliderThemeData(
  showValueIndicator: ShowValueIndicator.always,
);

const _listTileTheme = ListTileThemeData(
  shape: kDefaultShape,
);

const _inputDecorationTheme = InputDecorationTheme(
  border: OutlineInputBorder(),
);

final _progressIndicatorLightTheme = ProgressIndicatorThemeData(
  linearTrackColor: lightColorScheme.surfaceContainerHighest,
);

final _progressIndicatorDarkTheme = ProgressIndicatorThemeData(
  linearTrackColor: darkColorScheme.surfaceContainerHighest,
);

final lightTheme = ThemeData(
  brightness: Brightness.light,
  appBarTheme: _appBarLightTheme,
  cardTheme: _cardTheme,
  sliderTheme: _sliderTheme,
  listTileTheme: _listTileTheme,
  inputDecorationTheme: _inputDecorationTheme,
  progressIndicatorTheme: _progressIndicatorLightTheme,
  colorScheme: lightColorScheme,
);

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  error: Color(0xffba1a1a), // Color(0xffba1a1a)
  errorContainer: Color(0xffffdad6), // Color(0xffffdad6)
  inversePrimary: Color(0xffe9c16c), // Color(0xffe9c16c)
  inverseSurface: Color(0xff353027), // Color(0xff353027)
  onError: Color(0xffffffff), // Color(0xffffffff)
  onErrorContainer: Color(0xff410002), // Color(0xff410002)
  onInverseSurface: Color(0xfff9efe2), // Color(0xfff9efe2)
  onPrimary: Color(0xffffffff), // Color(0xffffffff)
  onPrimaryContainer: Color(0xff000000), // Color(0xff000000)
  onPrimaryFixed: Color(0xff261a00), // Color(0xff261a00)
  onPrimaryFixedVariant: Color(0xff5b4300), // Color(0xff5b4300)
  onSecondary: Color(0xffffffff), // Color(0xffffffff)
  onSecondaryContainer: Color(0xff000000), // Color(0xff000000)
  onSecondaryFixed: Color(0xff241a04), // Color(0xff241a04)
  onSecondaryFixedVariant: Color(0xff52452a), // Color(0xff52452a)
  onSurface: Color(0xff1f1b13), // Color(0xff1f1b13)
  onSurfaceVariant: Color(0xff4d4639), // Color(0xff4d4639)
  onTertiary: Color(0xffffffff), // Color(0xffffffff)
  onTertiaryContainer: Color(0xff072109), // Color(0xff072109)
  onTertiaryFixed: Color(0xff072109), // Color(0xff072109)
  onTertiaryFixedVariant: Color(0xff334d31), // Color(0xff334d31)
  outline: Color(0xff7f7667), // Color(0xff7f7667)
  outlineVariant: Color(0xffd0c5b4), // Color(0xffd0c5b4)
  primary: Color(0xff000000), // Color(0xff000000)
  primaryContainer: Color(0xffffc107), // Color(0xffffc107)
  primaryFixed: Color(0xffffdf9e), // Color(0xffffdf9e)
  primaryFixedDim: Color(0xffe9c16c), // Color(0xffe9c16c)
  secondary: Colors.black, // Color(0xff6b5d3f)
  secondaryContainer: Color(0xffffc107), // Color(0xffffc107)
  secondaryFixed: Color(0xfff5e0bb), // Color(0xfff5e0bb)
  secondaryFixedDim: Color(0xffd8c4a0), // Color(0xffd8c4a0)
  surface: Color.fromRGBO(247, 247, 247, 1), // Color(0xfffff8f2)
  surfaceBright: Color(0xfffff8f2), // Color(0xfffff8f2)
  surfaceContainer: Color.fromRGBO(245, 245, 245, 1), // Color(0xfff6ecdf)
  surfaceContainerHigh: Color(0xfff1e7d9), // Color(0xfff1e7d9)
  surfaceContainerHighest: Color(0xffebe1d4), // Color(0xffebe1d4)
  surfaceContainerLow: Colors.white, // Color(0xfffcf2e5)
  surfaceContainerLowest: Color(0xffffffff), // Color(0xffffffff)
  surfaceDim: Color(0xffe2d9cc), // Color(0xffe2d9cc)
  surfaceTint: Color(0xff9e9e9e), // Color(0xff9e9e9e)
  tertiary: Color(0xff4a6547), // Color(0xff4a6547)
  tertiaryContainer: Color(0xffccebc4), // Color(0xffccebc4)
  tertiaryFixed: Color(0xffccebc4), // Color(0xffccebc4)
  tertiaryFixedDim: Color(0xffb0cfaa), // Color(0xffb0cfaa)
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  error: Color(0xffffb4ab), // Color(0xffffb4ab)
  errorContainer: Color(0xff93000a), // Color(0xff93000a)
  inversePrimary: Color(0xff775a0b), // Color(0xff775a0b)
  inverseSurface: Color(0xffebe1d4), // Color(0xffebe1d4)
  onError: Color(0xff690005), // Color(0xff690005)
  onErrorContainer: Color(0xffffdad6), // Color(0xffffdad6)
  onInverseSurface: Color(0xff353027), // Color(0xff353027)
  onPrimary: Color(0xff3f2e00), // Color(0xff3f2e00)
  onPrimaryContainer: Colors.black, // Color(0xffffdf9e)
  onPrimaryFixed: Color(0xff261a00), // Color(0xff261a00)
  onPrimaryFixedVariant: Colors.amber, // Color(0xff5b4300)
  onSecondary: Color(0xff3a2f15), // Color(0xff3a2f15)
  onSecondaryContainer: Colors.black, // Color(0xfff5e0bb)
  onSecondaryFixed: Color(0xff241a04), // Color(0xff241a04)
  onSecondaryFixedVariant: Colors.amber, // Color(0xff52452a)
  onSurface: Color(0xffebe1d4), // Color(0xffebe1d4)
  onSurfaceVariant: Color(0xffd0c5b4), // Color(0xffd0c5b4)
  onTertiary: Color(0xff1d361c), // Color(0xff1d361c)
  onTertiaryContainer: Color(0xffccebc4), // Color(0xffccebc4)
  onTertiaryFixed: Color(0xff072109), // Color(0xff072109)
  onTertiaryFixedVariant: Color(0xff334d31), // Color(0xff334d31)
  outline: Color(0xff998f80), // Color(0xff998f80)
  outlineVariant: Color(0xff4d4639), // Color(0xff4d4639)
  primary: Colors.amber, // Color(0xffe9c16c)
  primaryContainer: Colors.amber, // Color(0xff5b4300)
  primaryFixed: Colors.black, // Color(0xffffdf9e)
  primaryFixedDim: Colors.amber, // Color(0xffe9c16c)
  secondary: Colors.white, // Color(0xffd8c4a0)
  secondaryContainer: Colors.amber, // Color(0xff52452a)
  secondaryFixed: Colors.black, // Color(0xfff5e0bb)
  secondaryFixedDim: Color(0xffd8c4a0), // Color(0xffd8c4a0)
  surface: Colors.black, // Color(0xff17130b)
  surfaceBright: Color(0xff3e382f), // Color(0xff3e382f)
  surfaceContainer: Color.fromRGBO(18, 18, 18, 1), // Color(0xff231f17)
  surfaceContainerHigh: Color(0xff2e2921), // Color(0xff2e2921)
  surfaceContainerHighest: Color(0xff39342b), // Color(0xff39342b)
  surfaceContainerLow: Color.fromRGBO(16, 16, 16, 1), // Color(0xff1f1b13)
  surfaceContainerLowest: Color(0xff110e07), // Color(0xff110e07)
  surfaceDim: Colors.black, // Color(0xff17130b)
  surfaceTint: Color.fromRGBO(171, 171, 171, 1), // Color(0xffe9c16c)
  tertiary: Color(0xffb0cfaa), // Color(0xffb0cfaa)
  tertiaryContainer: Color(0xff334d31), // Color(0xff334d31)
  tertiaryFixed: Color(0xffccebc4), // Color(0xffccebc4)
  tertiaryFixedDim: Color(0xffb0cfaa), // Color(0xffb0cfaa)
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: _appBarDarkTheme,
  cardTheme: _cardTheme,
  sliderTheme: _sliderTheme,
  listTileTheme: _listTileTheme,
  inputDecorationTheme: _inputDecorationTheme,
  progressIndicatorTheme: _progressIndicatorDarkTheme,
  chipTheme: ChipThemeData(
    checkmarkColor: darkColorScheme.onSecondaryContainer,
  ),
  colorScheme: darkColorScheme,
);
