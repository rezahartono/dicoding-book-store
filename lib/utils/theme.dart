// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorTheme {
  Color WHITE = const Color(0xFFFFFFFF);
  Color BLACK = const Color(0xFF000000);
  Color BLUE = const Color(0xFF006EEE);
  Color LIGHT_BLUE = const Color(0xFFD1E2FD);
  Color GREEN = const Color(0xFF22B07D);
  Color GREY = const Color(0xFFA2ADB1);
  Color GOLD = const Color(0xFFFFBC58);
  Color RED = const Color(0xFFFF7A7A);
  Color LIGHT_GREY = const Color(0xFFF9F9F9);
}

class FontStyleTheme {
  TextStyle BLACK_TEXT = GoogleFonts.poppins(
    color: COLOR_THEME.BLACK,
    fontSize: 14,
  );

  TextStyle GREY_TEXT = GoogleFonts.poppins(
    color: COLOR_THEME.GREY,
    fontSize: 14,
  );

  TextStyle BLUE_TEXT = GoogleFonts.poppins(
    color: COLOR_THEME.BLUE,
    fontSize: 14,
  );

  TextStyle GREEN_TEXT = GoogleFonts.poppins(
    color: COLOR_THEME.GREEN,
    fontSize: 14,
  );

  TextStyle WHITE_TEXT = GoogleFonts.poppins(
    color: COLOR_THEME.WHITE,
    fontSize: 14,
  );
}

class FontWeightStyle {
  final FontWeight LIGHT = FontWeight.w300;
  final FontWeight REGULAR = FontWeight.w400;
  final FontWeight MEDIUM = FontWeight.w500;
  final FontWeight SEMI_BOLD = FontWeight.w600;
  final FontWeight BOLD = FontWeight.w700;
}

class TextStyleTheme {
  final FontStyle ITALIC = FontStyle.italic;
  final FontStyle NORMAL = FontStyle.normal;
}

ColorTheme COLOR_THEME = ColorTheme();
FontStyleTheme FONT_STYLE = FontStyleTheme();
FontWeightStyle FONT_WEIGHT = FontWeightStyle();
TextStyleTheme TEXT_STYLE = TextStyleTheme();
