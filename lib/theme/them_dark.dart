import 'package:flutter/material.dart';

class MyThemData {
  ThemeData themeDark() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: Color.fromARGB(255, 177, 177, 177),
      primaryColorLight: Color.fromARGB(255, 255, 255, 255),
      primaryColorDark: Color.fromARGB(255, 255, 255, 255),
      canvasColor: const Color(0xfffafafa),
      scaffoldBackgroundColor: Color.fromARGB(255, 13, 13, 13),
      cardColor: const Color(0xffffffff),
      dividerColor: const Color(0x1f000000),
      highlightColor: const Color(0x66bcbcbc),
      splashColor: const Color(0x66c8c8c8),
      unselectedWidgetColor: const Color(0x8a000000),
      disabledColor: const Color(0x61000000),
      secondaryHeaderColor: const Color(0xffebe8fd),
      dialogBackgroundColor: const Color(0xffffffff),
      indicatorColor: Color.fromARGB(255, 193, 193, 193),
      hintColor: const Color(0x8a000000),
      buttonTheme: const ButtonThemeData(
        textTheme: ButtonTextTheme.accent,
        minWidth: 88,
        height: 36,
        padding: EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Color(0xff000000),
            width: 0,
            style: BorderStyle.none,
          ),
          borderRadius: BorderRadius.all(Radius.circular(2.0)),
        ),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: Color.fromARGB(137, 255, 255, 255),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        displayMedium: TextStyle(
          color: Color(0x8a000000),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        displaySmall: TextStyle(
          color: Color(0x8a000000),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        headlineMedium: TextStyle(
          color: Color(0x8a000000),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        headlineSmall: TextStyle(
          color: Color(0xdd000000),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        titleLarge: TextStyle(
          color: Color(0xdd000000),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        titleMedium: TextStyle(
          color: Color(0xdd000000),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        bodyLarge: TextStyle(
          color: Color.fromARGB(221, 255, 255, 255),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        bodyMedium: TextStyle(
          color: Color.fromARGB(221, 255, 255, 255),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        bodySmall: TextStyle(
          color: Color.fromARGB(137, 255, 255, 255),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        labelLarge: TextStyle(
          color: Color.fromARGB(221, 255, 255, 255),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        titleSmall: TextStyle(
          color: Color.fromARGB(255, 255, 255, 255),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        labelSmall: TextStyle(
          color: Color(0xff000000),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          labelStyle: new TextStyle(color: Colors.white)),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return Color.fromARGB(255, 145, 145, 145);
          }
          return null;
        }),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return const Color(0xff2f12ba);
          }
          return null;
        }),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return const Color(0xff2f12ba);
          }
          return null;
        }),
        trackColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return Color.fromARGB(255, 176, 176, 176);
          }
          return null;
        }),
      ),
    );
  }
}
