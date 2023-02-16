import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:ui';

import './utils/constants.dart';
import './screens/landing_screen.dart';
import './providers/housing.dart';
import './screens/housing_more_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    double screenWidth = window.physicalSize.width;
    return ChangeNotifierProvider.value(
      value: Housing(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: COLOR_WHITE,
            onPrimary: COLOR_GREY,
            secondary: COLOR_DARK_BLUE,
            onSecondary: COLOR_BLACK,
            surface: Colors.purpleAccent,
            background: customSurfaceWhite,
            error: customMagenta900,
            onSurface: customMagenta300,
            onBackground: customMagenta100,
            onError: Colors.redAccent,
          ),
          textTheme: screenWidth < 500 ? TEXT_THEME_SMALL : TEXT_THEME_DEFAULT,
          fontFamily: 'Montserrat',
        ),
        home: const LandingScreen(),
        routes: {
          HousingMoreDetail.routeName:(context) => HousingMoreDetail(),
        },
      ),
    );
  }
}
