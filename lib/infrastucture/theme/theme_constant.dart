import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeConstant {
  static lightTheme(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.apply();
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: context.white,
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      iconTheme: IconThemeData(color: context.black),
      appBarTheme: AppBarTheme(
        backgroundColor: context.designColor,
        elevation: 1,
        titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,color: context.white
            ),
      ),
      cardColor: context.white,
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          iconColor: MaterialStateProperty.all(context.black),
        ),
      ),
      colorScheme: ColorScheme.light(secondary: context.designColorLight),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.all(context.white),
        trackColor: MaterialStateProperty.all(context.designColor),
      ),

      listTileTheme: ListTileThemeData(
        iconColor: context.black,
        titleTextStyle: Theme.of(context).textTheme.titleMedium?.copyWith(color: context.black),
        subtitleTextStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
          fontSize: 7,
          color: context.black,
        ),
        // tileColor: context.white,
      ),


      floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: context.designColor),
      textTheme: GoogleFonts.kufamTextTheme(textTheme).copyWith(
        headlineMedium: GoogleFonts.kufam(textStyle: textTheme.headlineMedium, color: context.black),
        headlineLarge: GoogleFonts.kufam(textStyle: textTheme.headlineLarge, color: context.black),
        headlineSmall: GoogleFonts.kufam(textStyle: textTheme.headlineSmall, color: context.black),
        titleLarge: GoogleFonts.kufam(textStyle: textTheme.titleLarge, color: context.black),
        titleMedium: GoogleFonts.kufam(textStyle: textTheme.titleMedium, color: context.black),
        titleSmall: GoogleFonts.kufam(textStyle: textTheme.titleSmall, color: context.black),
        bodyLarge: GoogleFonts.kufam(textStyle: textTheme.bodyLarge, color: context.black),
        bodyMedium: GoogleFonts.kufam(textStyle: textTheme.bodyMedium, color: context.black),
        bodySmall: GoogleFonts.kufam(textStyle: textTheme.bodySmall, color: context.black),
        labelLarge: GoogleFonts.kufam(textStyle: textTheme.labelLarge, color: context.black),
        labelSmall: GoogleFonts.kufam(textStyle: textTheme.labelSmall, color: context.black),
        labelMedium: GoogleFonts.kufam(textStyle: textTheme.labelMedium, color: context.black),
        displayLarge: GoogleFonts.kufam(textStyle: textTheme.displayLarge, color: context.black),
        displayMedium: GoogleFonts.kufam(textStyle: textTheme.displayMedium, color: context.black),
        displaySmall: GoogleFonts.kufam(textStyle: textTheme.displaySmall, color: context.black),
      ),
    );
  }

  static darkTheme(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.apply();
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.black45,
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      iconTheme: const IconThemeData(color: Colors.white),
      appBarTheme: AppBarTheme(
        backgroundColor: context.grey850,
        elevation: 1,
        titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.w600,color: context.white
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: context.grey850),
      cardColor: context.grey850,
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          iconColor: MaterialStateProperty.all(Colors.white),
        ),
      ),
      colorScheme: ColorScheme.dark(secondary: context.grey850),
      listTileTheme: ListTileThemeData(
        iconColor: context.white,
        titleTextStyle: Theme.of(context).textTheme.titleMedium?.copyWith(color: context.white),
        subtitleTextStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: 7,
              color: context.white,
            ),
        // tileColor: context.white,
      ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.all(context.white),
        trackColor: MaterialStateProperty.all(context.designColor),
      ),
      textTheme: GoogleFonts.kufamTextTheme(textTheme).copyWith(
        headlineMedium: GoogleFonts.kufam(textStyle: textTheme.headlineMedium, color: context.white),
        headlineLarge: GoogleFonts.kufam(textStyle: textTheme.headlineLarge, color: context.white),
        headlineSmall: GoogleFonts.kufam(textStyle: textTheme.headlineSmall, color: context.white),
        titleLarge: GoogleFonts.kufam(textStyle: textTheme.titleLarge, color: context.white),
        titleMedium: GoogleFonts.kufam(textStyle: textTheme.titleMedium, color: context.white),
        titleSmall: GoogleFonts.kufam(textStyle: textTheme.titleSmall, color: context.white),
        bodyLarge: GoogleFonts.kufam(textStyle: textTheme.bodyLarge, color: context.white),
        bodyMedium: GoogleFonts.kufam(textStyle: textTheme.bodyMedium, color: context.white),
        bodySmall: GoogleFonts.kufam(textStyle: textTheme.bodySmall, color: context.white),
        labelLarge: GoogleFonts.kufam(textStyle: textTheme.labelLarge, color: context.white),
        labelSmall: GoogleFonts.kufam(textStyle: textTheme.labelSmall, color: context.white),
        labelMedium: GoogleFonts.kufam(textStyle: textTheme.labelMedium, color: context.white),
        displayLarge: GoogleFonts.kufam(textStyle: textTheme.displayLarge, color: context.white),
        displayMedium: GoogleFonts.kufam(textStyle: textTheme.displayMedium, color: context.white),
        displaySmall: GoogleFonts.kufam(textStyle: textTheme.displaySmall, color: context.white),
      ),
    );
  }
}

extension TextThemeExt on BuildContext {
  TextStyle? get headlineLarge => Theme.of(this).textTheme.headlineLarge;

  TextStyle? get headlineMedium => Theme.of(this).textTheme.headlineMedium;

  TextStyle? get headlineSmall => Theme.of(this).textTheme.headlineSmall;

  TextStyle? get titleLarge => Theme.of(this).textTheme.titleLarge;

  TextStyle? get titleMedium => Theme.of(this).textTheme.titleMedium;

  TextStyle? get titleSmall => Theme.of(this).textTheme.titleSmall;

  TextStyle? get bodyLarge => Theme.of(this).textTheme.bodyLarge;

  TextStyle? get bodyMedium => Theme.of(this).textTheme.bodyMedium;

  TextStyle? get bodySmall => Theme.of(this).textTheme.bodySmall;

  TextStyle? get labelLarge => Theme.of(this).textTheme.labelLarge;

  TextStyle? get labelSmall => Theme.of(this).textTheme.labelSmall;

  TextStyle? get labelMedium => Theme.of(this).textTheme.labelMedium;

  TextStyle? get displayLarge => Theme.of(this).textTheme.displayLarge;

  TextStyle? get displayMedium => Theme.of(this).textTheme.displayMedium;

  TextStyle? get displaySmall => Theme.of(this).textTheme.displaySmall;

  Color get grey => Colors.grey;

  Color get white => Colors.white;

  Color get grey850 => Colors.grey[850]!;

  Color get black => Colors.black;

  Color get designColor => Colors.teal[300]!;

  Color get designColorLight => Colors.teal[100]!;
}
