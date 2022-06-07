import 'package:book_store/utils/string_utils.dart';
import 'package:flutter/material.dart';

import 'package:book_store/models/master_data/book_model.dart';
import 'package:book_store/utils/size_config.dart';
import 'package:book_store/utils/theme.dart';

class PopularCard extends StatelessWidget {
  final BookModel book;
  final Function onTap;

  const PopularCard({
    Key? key,
    required this.book,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        width: SIZE_CONFIG.BLOCK_HORIZONTAL * 75,
        height: SIZE_CONFIG.BLOCK_VERTICAL * 20,
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: COLOR_THEME.WHITE,
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              color: COLOR_THEME.BLACK.withOpacity(0.05),
              offset: const Offset(-2, -2),
            ),
            BoxShadow(
              blurRadius: 4,
              color: COLOR_THEME.BLACK.withOpacity(0.05),
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(10),
              ),
              child: Image.asset(
                book.image,
                height: SIZE_CONFIG.BLOCK_VERTICAL * 20,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(SIZE_CONFIG.BLOCK_HORIZONTAL * 2.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              book.title,
                              style: FONT_STYLE.BLACK_TEXT.copyWith(
                                fontWeight: FONT_WEIGHT.SEMI_BOLD,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: SIZE_CONFIG.BLOCK_VERTICAL * 0.2),
                            Text(
                              book.author,
                              style: FONT_STYLE.BLUE_TEXT.copyWith(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: SIZE_CONFIG.BLOCK_HORIZONTAL * 10,
                          height: SIZE_CONFIG.BLOCK_HORIZONTAL * 10,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: COLOR_THEME.RED.withOpacity(0.2),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.favorite,
                              color: COLOR_THEME.RED,
                              size: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: COLOR_THEME.GOLD,
                              size: 20,
                            ),
                            SizedBox(width: SIZE_CONFIG.BLOCK_HORIZONTAL * 0.5),
                            Text(
                              '${book.ranting}',
                              style: FONT_STYLE.BLACK_TEXT.copyWith(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          STRING_UTILS.PRICE_FORMAT(book.price),
                          style: FONT_STYLE.GREEN_TEXT.copyWith(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
