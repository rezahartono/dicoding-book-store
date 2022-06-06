import 'package:flutter/material.dart';

import 'package:book_store/utils/size_config.dart';
import 'package:book_store/utils/theme.dart';

class CategoryCard extends StatelessWidget {
  final Widget icon;
  final Function onTap;
  final String title;
  final Color shadowColor;
  final Color titleColor;

  const CategoryCard({
    Key? key,
    required this.icon,
    required this.onTap,
    required this.title,
    required this.shadowColor,
    required this.titleColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        width: SIZE_CONFIG.BLOCK_HORIZONTAL * 35,
        height: SIZE_CONFIG.BLOCK_VERTICAL * 20,
        padding: const EdgeInsets.symmetric(vertical: 10),
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: COLOR_THEME.WHITE,
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              color: shadowColor,
              offset: const Offset(-2, -2),
            ),
            BoxShadow(
              blurRadius: 4,
              color: shadowColor,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: SIZE_CONFIG.BLOCK_HORIZONTAL * 20,
              height: SIZE_CONFIG.BLOCK_HORIZONTAL * 20,
              padding: EdgeInsets.all(SIZE_CONFIG.BLOCK_HORIZONTAL * 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: COLOR_THEME.LIGHT_BLUE,
              ),
              child: icon,
            ),
            SizedBox(
              height: SIZE_CONFIG.DEFAULT_MARGIN,
            ),
            Text(
              title,
              style: FONT_STYLE.BLACK_TEXT.copyWith(
                fontSize: 16,
                fontWeight: FONT_WEIGHT.SEMI_BOLD,
                color: titleColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
