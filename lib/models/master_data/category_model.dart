import 'package:flutter/widgets.dart';

class CategoryModel {
  String icon = '';
  String title = '';

  CategoryModel({
    required this.icon,
    required this.title,
  });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    return {
      'icon': icon,
      'title': title,
    };
  }
}
