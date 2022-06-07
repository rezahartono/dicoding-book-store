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

  BookModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    author = json['author'];
    vendor = json['vendor'];
    category = json['category'];
    releasedDate = json['releasedDate'];
    language = json['language'];
    totalPage = json['totalPage'];
    weight = json['weight'];
    wide = json['wide'];
    width = json['width'];
    description = json['description'];
    image = json['image'];
    ranting = json['ranting'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'vendor': vendor,
      'category': category,
      'releasedDate': releasedDate,
      'language': language,
      'totalPage': totalPage,
      'weight': weight,
      'wide': wide,
      'width': width,
      'description': description,
      'image': image,
      'ranting': ranting,
      'price': price,
    };
  }
}
