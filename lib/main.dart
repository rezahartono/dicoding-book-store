import 'package:book_store/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BookStore());
}

class BookStore extends StatelessWidget {
  const BookStore({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Store',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
