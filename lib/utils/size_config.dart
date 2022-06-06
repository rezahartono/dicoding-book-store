// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:flutter/widgets.dart';

class SIZE_CONFIG {
  static double SCREEN_WIDTH = 0;
  static double SCREEN_HEIGHT = 0;
  static double BLOCK_HORIZONTAL = 0;
  static double BLOCK_VERTICAL = 0;
  static double DEFAULT_MARGIN = 20;
  static Orientation PORTRAIT = Orientation.portrait;
  static Orientation LANDSCAPE = Orientation.landscape;

  void init(BuildContext context) {
    SCREEN_WIDTH = MediaQuery.of(context).size.width;
    SCREEN_HEIGHT = MediaQuery.of(context).size.height;
    BLOCK_HORIZONTAL = SCREEN_WIDTH / 100;
    BLOCK_VERTICAL = SCREEN_HEIGHT / 100;
    DEFAULT_MARGIN = BLOCK_HORIZONTAL * 5;
  }
}

SIZE_CONFIG SizeConfig = SIZE_CONFIG();
