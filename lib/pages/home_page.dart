import 'package:book_store/components/cards/catalogue_item_card.dart';
import 'package:book_store/components/cards/category_card.dart';
import 'package:book_store/components/cards/popular_card.dart';
import 'package:book_store/models/master_data/book_model.dart';
import 'package:book_store/models/master_data/category_model.dart';
import 'package:book_store/pages/book_detail_page.dart';
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

  @override
  void initState() {
    super.initState();
    setData();
  }

  // set default data method
  setData() {
    // data for categories
    categories.addAll([
      CategoryModel(
        icon: Image.asset('assets/icons/business.png'),
        title: 'Business',
      ),
      CategoryModel(
        icon: Image.asset('assets/icons/drama.png'),
        title: 'Story',
      ),
      CategoryModel(
        icon: Image.asset('assets/icons/romance.png'),
        title: 'Romance',
      ),
      CategoryModel(
        icon: Image.asset('assets/icons/design.png'),
        title: 'Design',
      ),
      CategoryModel(
        icon: Image.asset('assets/icons/art.png'),
        title: 'Art',
      ),
      CategoryModel(
        icon: Image.asset('assets/icons/soft_skill.png'),
        title: 'Soft Skill',
      ),
      CategoryModel(
        icon: Image.asset('assets/icons/hard_skill.png'),
        title: 'Hard Skill',
      ),
    ]);
    // end data

    // set selected category
    categoryIndexSelected = 0;
    selectedCategory = categories[0].title;
    // end selected

    // data for popular books
    popularBooks.addAll([
      BookModel(
        id: 9786020324784,
        title: 'Hujan',
        author: 'Tere Liye',
        vendor: 'Gramedia Pustaka Utama',
        category: 'Story',
        releasedDate: '16 Apr 2018',
        language: 'Indonesia',
        totalPage: 320,
        weight: 0.4,
        wide: 14.0,
        width: 21.0,
        description:
            'Novel HUJAN berkisah tentang persahabatan, tentang cinta, tentang perpisahan, tentang melupakan, dan tentang hujan',
        image: 'assets/images/hujan.jpg',
        ranting: 4.5,
        price: 75000,
      ),
      BookModel(
        id: 9786020332956,
        title: 'Bumi',
        author: 'Tere Liye',
        vendor: 'Gramedia Pustaka Utama',
        category: 'Story',
        releasedDate: '9 Agt 2016',
        language: 'Indonesia',
        totalPage: 440,
        weight: 0.45,
        wide: 14.0,
        width: 21.0,
        description:
            'Bumi, merupakan rangkaian awal dari kisah sekelompok anak remaja berkemampuan istimewa.',
        image: 'assets/images/bumi.jpg',
        ranting: 4.8,
        price: 85000,
      ),
      BookModel(
        id: 9786239726201,
        title: 'Janji',
        author: 'Tere Liye',
        vendor: 'Penerbit Sabak Grip',
        category: 'Story',
        releasedDate: '28 Jul 2021',
        language: 'Indonesia',
        totalPage: 250,
        weight: 0.4,
        wide: 14.0,
        width: 21.0,
        description: 'Kita semua adalah pengembara di dunia ini.',
        image: 'assets/images/janji.jpg',
        ranting: 4.8,
        price: 75000,
      ),
      BookModel(
        id: 9786020523316,
        title: 'Melangkah',
        author: 'Js. Khairen',
        vendor: 'Gramedia Widiasarana Indonesia',
        category: 'Story',
        releasedDate: '23 Mar 2020',
        language: 'Indonesia',
        totalPage: 368,
        weight: 0.4,
        wide: 13.5,
        width: 20.0,
        description:
            'Listrik padam di seluruh Jawa dan Bali secara misterius! Ancaman nyata kekuatan baru yang hendak menaklukkan Nusantara',
        image: 'assets/images/melangkah.jpg',
        ranting: 4.8,
        price: 65000,
      ),
    ]);
    // end data

    // data for books
    books.addAll([
      BookModel(
        id: 9786020324784,
        title: 'Hujan',
        author: 'Tere Liye',
        vendor: 'Gramedia Pustaka Utama',
        category: 'Story',
        releasedDate: '16 Apr 2018',
        language: 'Indonesia',
        totalPage: 320,
        weight: 0.4,
        wide: 14.0,
        width: 21.0,
        description:
            'Novel HUJAN berkisah tentang persahabatan, tentang cinta, tentang perpisahan, tentang melupakan, dan tentang hujan',
        image: 'assets/images/hujan.jpg',
        ranting: 4.5,
        price: 75000,
      ),
      BookModel(
        id: 9786020332956,
        title: 'Bumi',
        author: 'Tere Liye',
        vendor: 'Gramedia Pustaka Utama',
        category: 'Story',
        releasedDate: '9 Agt 2016',
        language: 'Indonesia',
        totalPage: 440,
        weight: 0.45,
        wide: 14.0,
        width: 21.0,
        description:
            'Bumi, merupakan rangkaian awal dari kisah sekelompok anak remaja berkemampuan istimewa.',
        image: 'assets/images/bumi.jpg',
        ranting: 4.8,
        price: 85000,
      ),
      BookModel(
        id: 9786239726201,
        title: 'Janji',
        author: 'Tere Liye',
        vendor: 'Penerbit Sabak Grip',
        category: 'Story',
        releasedDate: '28 Jul 2021',
        language: 'Indonesia',
        totalPage: 250,
        weight: 0.4,
        wide: 14.0,
        width: 21.0,
        description: 'Kita semua adalah pengembara di dunia ini.',
        image: 'assets/images/janji.jpg',
        ranting: 4.8,
        price: 75000,
      ),
      BookModel(
        id: 9786020523316,
        title: 'Melangkah',
        author: 'Js. Khairen',
        vendor: 'Gramedia Widiasarana Indonesia',
        category: 'Story',
        releasedDate: '23 Mar 2020',
        language: 'Indonesia',
        totalPage: 368,
        weight: 0.4,
        wide: 13.5,
        width: 20.0,
        description:
            'Listrik padam di seluruh Jawa dan Bali secara misterius! Ancaman nyata kekuatan baru yang hendak menaklukkan Nusantara',
        image: 'assets/images/melangkah.jpg',
        ranting: 4.8,
        price: 65000,
      ),
    ]);
    // end data
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
                                },
                                icon: category.icon,
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
          Column(
            children: books
                .map(
                  (book) => CatalogueItemCard(
                    book: book,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookDetailPage(book: book),
                        ),
                      );
                    },
                  ),
                )
                .toList(),
          ),
        ],
      );
    }
    // end section

    return Scaffold(
      backgroundColor: COLOR_THEME.LIGHT_GREY,
      body: SafeArea(
        child: Column(
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
