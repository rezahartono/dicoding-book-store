class BookModel {
  int id = 0;
  String title = '';
  String author = '';
  String vendor = '';
  String category = '';
  String releasedDate = '';
  String language = '';
  int totalPage = 0;
  double weight = 0.0;
  double wide = 0.0;
  double width = 0.0;
  String description = '';
  String image = '';
  double ranting = 0.0;
  double price = 0.0;

  BookModel({
    required this.id,
    required this.title,
    required this.author,
    required this.vendor,
    required this.category,
    required this.releasedDate,
    required this.language,
    required this.totalPage,
    required this.weight,
    required this.wide,
    required this.width,
    required this.description,
    required this.image,
    required this.ranting,
    required this.price,
  });
}
