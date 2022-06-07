import 'dart:convert';

import 'package:book_store/models/master_data/book_model.dart';
import 'package:book_store/models/master_data/category_model.dart';
import 'package:flutter/services.dart';

class BookService {
  Future<List<CategoryModel>> getCategories() async {
    String response = await rootBundle.loadString('assets/data/books.json');
    var data = jsonDecode(response)['categories'];
    List<CategoryModel> categories = [];

    for (var item in data) {
      categories.add(CategoryModel.fromJson(item));
    }

    return categories;
  }

  Future<List<BookModel>> getPopularBooks() async {
    String response = await rootBundle.loadString('assets/data/books.json');
    var data = jsonDecode(response)['popular_books'];
    List<BookModel> books = [];

    for (var item in data) {
      books.add(BookModel.fromJson(item));
    }

    return books;
  }

  Future<List<BookModel>> getBookByCategory(String category) async {
    String response = await rootBundle.loadString('assets/data/books.json');
    var data = jsonDecode(response)[category];
    List<BookModel> books = [];

    for (var item in data) {
      books.add(BookModel.fromJson(item));
    }

    return books;
  }
}
