import 'package:book_store/components/cards/catalogue_item_card.dart';
import 'package:book_store/components/cards/category_card.dart';
import 'package:book_store/components/cards/popular_card.dart';
import 'package:book_store/models/master_data/book_model.dart';
import 'package:book_store/models/master_data/category_model.dart';
import 'package:book_store/pages/book_detail_page.dart';
import 'package:book_store/services/book_service.dart';
import 'package:book_store/utils/size_config.dart';
import 'package:book_store/utils/theme.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];
  List<BookModel> popularBooks = [];
  List<BookModel> books = [];
  int categoryIndexSelected = 0;
  String selectedCategory = '';
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    setData();
  }

  // set default data method
  setData() async {
    setState(() {
      isLoading = true;
    });
    // data for categories
    categories = await BookService().getCategories();
    // getCategories();
    // end data

    // set selected category
    categoryIndexSelected = 0;
    selectedCategory = categories[0].title;
    // end selected

    // data for popular books
    // getPopularBooks();
    popularBooks = await BookService().getPopularBooks();
    // end data

    // data for books
    books = await BookService().getBookByCategory(selectedCategory);
    // getBookByCategory(selectedCategory);
    // end data

    setState(() {
      isLoading = false;
    });
    // end data
  }

  // getCategories() async {
  //   categories = await BookService().getCategories();
  // }

  // getPopularBooks() async {
  //   popularBooks = await BookService().getPopularBooks();
  // }

  getBookByCategory(String cat) async {
    books = await BookService().getBookByCategory(cat);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    // header section
    Widget _headerSectionBuild() {
      return Container(
        padding: EdgeInsets.all(
          SIZE_CONFIG.DEFAULT_MARGIN,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                'assets/images/photo-profile.png',
                height: SIZE_CONFIG.BLOCK_HORIZONTAL * 10,
                width: SIZE_CONFIG.BLOCK_HORIZONTAL * 10,
              ),
            ),
            Row(
              children: [
                Center(
                  child: Image.asset(
                    'assets/icons/search.png',
                    height: SIZE_CONFIG.BLOCK_HORIZONTAL * 8,
                    width: SIZE_CONFIG.BLOCK_HORIZONTAL * 8,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/icons/cart.png',
                        height: SIZE_CONFIG.BLOCK_HORIZONTAL * 8,
                        width: SIZE_CONFIG.BLOCK_HORIZONTAL * 8,
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        constraints: BoxConstraints(
                          minWidth: 10,
                          minHeight: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    }
    // end section

    // category section
    Widget _categorySectionBuild() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding:
                EdgeInsets.symmetric(horizontal: SIZE_CONFIG.DEFAULT_MARGIN),
            width: SIZE_CONFIG.BLOCK_HORIZONTAL * 65,
            child: Text(
              'Want to Reading Book what\'s Today?',
              style: FONT_STYLE.BLACK_TEXT.copyWith(
                fontSize: 18,
                fontWeight: FONT_WEIGHT.SEMI_BOLD,
              ),
            ),
          ),
          SizedBox(
            height: SIZE_CONFIG.DEFAULT_MARGIN,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: SIZE_CONFIG.DEFAULT_MARGIN,
                ),
                Row(
                  children: categories
                      .asMap()
                      .map(
                        (idx, category) => MapEntry(
                          idx,
                          Row(
                            children: [
                              CategoryCard(
                                onTap: () {
                                  setState(() {
                                    selectedCategory = category.title;
                                    categoryIndexSelected = idx;
                                  });

                                  getBookByCategory(category.title);
                                },
                                icon: Image.asset(category.icon),
                                title: category.title,
                                shadowColor: categoryIndexSelected == idx
                                    ? COLOR_THEME.BLUE.withOpacity(0.3)
                                    : COLOR_THEME.BLACK.withOpacity(0.05),
                                titleColor: categoryIndexSelected == idx
                                    ? COLOR_THEME.BLUE
                                    : COLOR_THEME.BLACK,
                              ),
                              SizedBox(
                                width: SIZE_CONFIG.DEFAULT_MARGIN,
                              ),
                            ],
                          ),
                        ),
                      )
                      .values
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      );
    }
    // end section

    // popular section
    Widget _popularSectionBuild() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: SIZE_CONFIG.DEFAULT_MARGIN,
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: SIZE_CONFIG.DEFAULT_MARGIN),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Popular Books',
                  style: FONT_STYLE.BLACK_TEXT.copyWith(
                    fontWeight: FONT_WEIGHT.SEMI_BOLD,
                  ),
                ),
                Text(
                  'Show all',
                  style: FONT_STYLE.BLUE_TEXT.copyWith(
                    fontWeight: FONT_WEIGHT.MEDIUM,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: SIZE_CONFIG.DEFAULT_MARGIN,
                ),
                Row(
                  children: popularBooks
                      .asMap()
                      .map(
                        (idx, book) => MapEntry(
                          idx,
                          Row(
                            children: [
                              PopularCard(
                                book: book,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          BookDetailPage(book: book),
                                    ),
                                  );
                                },
                              ),
                              SizedBox(
                                width: SIZE_CONFIG.DEFAULT_MARGIN,
                              ),
                            ],
                          ),
                        ),
                      )
                      .values
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      );
    }
    // end section

    // item by category section
    Widget _itemBySectionBuild() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: SIZE_CONFIG.DEFAULT_MARGIN,
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: SIZE_CONFIG.DEFAULT_MARGIN),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedCategory,
                  style: FONT_STYLE.BLACK_TEXT.copyWith(
                    fontWeight: FONT_WEIGHT.SEMI_BOLD,
                  ),
                ),
                Text(
                  'Show all',
                  style: FONT_STYLE.BLUE_TEXT.copyWith(
                    fontWeight: FONT_WEIGHT.MEDIUM,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          books.isNotEmpty
              ? Column(
                  children: books
                      .map(
                        (book) => CatalogueItemCard(
                          book: book,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    BookDetailPage(book: book),
                              ),
                            );
                          },
                        ),
                      )
                      .toList(),
                )
              : Center(
                  child: Text('No data'),
                ),
        ],
      );
    }
    // end section

    return Scaffold(
      backgroundColor: COLOR_THEME.LIGHT_GREY,
      body: SafeArea(
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  _headerSectionBuild(),
                  Expanded(
                    child: ListView(
                      children: [
                        _categorySectionBuild(),
                        _popularSectionBuild(),
                        _itemBySectionBuild(),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
