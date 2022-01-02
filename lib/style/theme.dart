import 'package:flutter/material.dart';

class MyThemes {
  final BuildContext context;
  MyThemes(this.context);
  

  ThemeData get defaultTheme {

    final theme = Theme.of(context);

    return  ThemeData(
      primarySwatch: Colors.blue,
      fontFamily: 'Poppins',
      colorScheme: theme.colorScheme.copyWith(
        background: Colors.white,
        primary: const Color.fromRGBO(29, 21, 105, 1),
        onPrimary: const Color.fromRGBO(255, 255, 255, 1),
        primaryVariant: const Color.fromRGBO(18, 17, 97, 1),
        secondary: const Color.fromRGBO(221, 223, 254, 1),
        onSecondary: const Color.fromRGBO(2, 53, 134, 1)
      ),
      textTheme: const TextTheme(
        headline2: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        headline3: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        headline4: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        headline5: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        subtitle1: TextStyle(fontSize: 18),
        button: TextStyle(fontSize: 20),
      )
    );

  }

}