// To parse this JSON data, do
//
//     final productCategory = productCategoryFromJson(jsonString);

import 'dart:convert';

ProductCategory productCategoryFromJson(String str) => ProductCategory.fromJson(json.decode(str));

String productCategoryToJson(ProductCategory data) => json.encode(data.toJson());

class ProductCategory {
  ProductCategory({
    required this.category,
  });

  final List<Category>? category;

  factory ProductCategory.fromJson(Map<String, dynamic> json) => ProductCategory(
    category: json["category"] == null ? [] : List<Category>.from(json["category"].map((x) => Category.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "category": List<dynamic>.from(category!.map((x) => x.toJson())),
  };
}

class Category {
  Category({
    required this.id,
    required this.categoryName,
    required this.image,
  });

  final int? id;
  final String? categoryName;
  final String? image;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"] ?? 0,
    categoryName: json["category_name"] ?? '',
    image: json["image"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "id": id!,
    "category_name": categoryName!,
    "image": image!,
  };
}
