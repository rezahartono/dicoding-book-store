import 'package:book_store/utils/size_config.dart';
import 'package:book_store/utils/string_utils.dart';
import 'package:book_store/utils/theme.dart';
import 'package:flutter/material.dart';

import 'package:book_store/models/master_data/book_model.dart';

class BookDetailPage extends StatelessWidget {
  final BookModel book;

  const BookDetailPage({
    Key? key,
    required this.book,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // header section
    Widget _headerSectionBuild() {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: SIZE_CONFIG.DEFAULT_MARGIN,
          vertical: SIZE_CONFIG.DEFAULT_MARGIN / 2,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(
                Icons.chevron_left,
                color: COLOR_THEME.BLACK,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            Text(
              'Book Detail',
              style: FONT_STYLE.BLACK_TEXT.copyWith(
                fontWeight: FONT_WEIGHT.SEMI_BOLD,
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.share,
                color: COLOR_THEME.BLACK,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    }
    // end section

    // cover image section
    Widget _coverImageSectionBuild() {
      return Stack(
        children: [
          Container(
            height: SIZE_CONFIG.BLOCK_VERTICAL * 40,
            decoration: BoxDecoration(
              color: COLOR_THEME.WHITE,
              border: Border(
                bottom: BorderSide(
                  color: COLOR_THEME.GREY,
                ),
              ),
            ),
            child: Center(
              child: Image.asset(
                book.image,
                height: SIZE_CONFIG.BLOCK_VERTICAL * 40,
              ),
            ),
          ),
          Positioned(
            bottom: SIZE_CONFIG.BLOCK_HORIZONTAL * 3,
            right: SIZE_CONFIG.BLOCK_HORIZONTAL * 3,
            child: Container(
              height: SIZE_CONFIG.BLOCK_HORIZONTAL * 15,
              width: SIZE_CONFIG.BLOCK_HORIZONTAL * 15,
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
          ),
        ],
      );
    }
    // end section

    // title section
    Widget _titleSectionBuild() {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: SIZE_CONFIG.DEFAULT_MARGIN,
          vertical: SIZE_CONFIG.DEFAULT_MARGIN / 2,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              book.title,
              style: FONT_STYLE.BLACK_TEXT.copyWith(
                fontWeight: FONT_WEIGHT.SEMI_BOLD,
                fontSize: 18,
              ),
            ),
          ],
        ),
      );
    }
    // end section

    // description section
    Widget _descriptionSectionBuild() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: SIZE_CONFIG.DEFAULT_MARGIN),
        child: Column(
          children: [],
        ),
      );
    }
    // end section

    // body section
    Widget _bodySectionBuild() {
      return Expanded(
        child: ListView(
          children: [
            _coverImageSectionBuild(),
            _titleSectionBuild(),
            _descriptionSectionBuild(),
          ],
        ),
      );
    }
    // end section

    // action section
    Widget _actionSectionBuild() {
      return Positioned(
        bottom: 0,
        width: SIZE_CONFIG.SCREEN_WIDTH,
        child: Container(
          height: SIZE_CONFIG.BLOCK_VERTICAL * 8,
          decoration: BoxDecoration(
            color: COLOR_THEME.WHITE,
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                color: COLOR_THEME.BLACK.withOpacity(0.05),
                offset: const Offset(-2, -2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: SIZE_CONFIG.DEFAULT_MARGIN),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Price',
                      style: FONT_STYLE.GREY_TEXT.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      STRING_UTILS.PRICE_FORMAT(book.price),
                      style: FONT_STYLE.GREEN_TEXT.copyWith(
                        fontSize: 16,
                        fontWeight: FONT_WEIGHT.SEMI_BOLD,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: SIZE_CONFIG.BLOCK_HORIZONTAL * 60,
                height: SIZE_CONFIG.BLOCK_VERTICAL * 8,
                decoration: BoxDecoration(
                  color: COLOR_THEME.BLUE,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(SIZE_CONFIG.DEFAULT_MARGIN * 2),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(SIZE_CONFIG.DEFAULT_MARGIN * 2),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.resolveWith(
                        (states) => COLOR_THEME.BLACK.withOpacity(0.1),
                      ),
                    ),
                    child: Text(
                      'Buy now',
                      style: FONT_STYLE.WHITE_TEXT.copyWith(
                        fontWeight: FONT_WEIGHT.SEMI_BOLD,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
    // end section

    return Scaffold(
      backgroundColor: COLOR_THEME.LIGHT_GREY,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                _headerSectionBuild(),
                _bodySectionBuild(),
              ],
            ),
            _actionSectionBuild(),
          ],
        ),
      ),
    );
  }
}
