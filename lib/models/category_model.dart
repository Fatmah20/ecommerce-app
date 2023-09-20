import 'dart:convert';

CategoryModel categoryModelFromJson(String str) =>
    CategoryModel.fromJson(json.decode(str));
String categoryModelToJson(CategoryModel data) => json.encode(data);

class CategoryModel {
  CategoryModel({
    required this.categories,
  });

  List<Category> categories;

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      categories: List<Category>.from(
          json["categories"]!.map((x) => Category.fromJson(x))),
    );
  }
}

class Category {
  Category({
    required this.name,
    required this.subcategory,
  });

  final String? name;
  final List<String> subcategory;

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      name: json["name"],
      subcategory: List<String>.from(json["subcategory"].map((x) => x)),
    );
  }
}
