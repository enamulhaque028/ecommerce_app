// To parse this JSON data, do
//
//     final productList = productListFromJson(jsonString);

import 'dart:convert';

ProductList productListFromJson(dynamic str) => ProductList.fromJson(str);

String productListToJson(ProductList data) => json.encode(data.toJson());

class ProductList {
  ProductList({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  final int? count;
  final String? next;
  final String? previous;
  final List<Result>? results;

  factory ProductList.fromJson(Map<String, dynamic> json) => ProductList(
    count: json["count"] ?? 0,
    next: json["next"] ?? 'null',
    previous: json["previous"] ?? '',
    results: json["results"] == null ? [] : List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count!,
    "next": next!,
    "previous": previous!,
    "results": List<dynamic>.from(results!.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    required this.id,
    required this.productName,
    required this.productDesc,
    required this.productPrice,
    required this.productImgSm,
    required this.productImgMd,
    required this.productImgLg,
    required this.productRating,
    required this.productQuantity,
    required this.productSales,
  });

  final int? id;
  final String? productName;
  final String? productDesc;
  final String? productPrice;
  final String? productImgSm;
  final String? productImgMd;
  final String? productImgLg;
  final int? productRating;
  final int? productQuantity;
  final String? productSales;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"] ?? 0,
    productName: json["product_name"] ?? '',
    productDesc: json["product_desc"] ?? '',
    productPrice: json["product_price"] ?? '',
    productImgSm: json["product_img_sm"] ?? '',
    productImgMd: json["product_img_md"] ?? '',
    productImgLg: json["product_img_lg"] ?? '',
    productRating: json["product_rating"] ?? 0,
    productQuantity: json["product_quantity"] ?? 0,
    productSales: json["product_sales"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "id": id!,
    "product_name": productName!,
    "product_desc": productDesc!,
    "product_price": productPrice!,
    "product_img_sm": productImgSm!,
    "product_img_md": productImgMd!,
    "product_img_lg": productImgLg!,
    "product_rating": productRating!,
    "product_quantity": productQuantity!,
    "product_sales": productSales!,
  };
}
