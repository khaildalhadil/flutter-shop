import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class ProductModel with ChangeNotifier {
  final String productId,
      productTitle,
      productPrice,
      productCategory,
      productImage,
      productDescription,
      productQuantity;

  ProductModel({
    required this.productId,
    required this.productTitle,
    required this.productPrice,
    required this.productCategory,
    required this.productImage,
    required this.productDescription,
    required this.productQuantity,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": productId,
      "title": productTitle,
      "price": productPrice,
      "category": productCategory,
      "description": productDescription,
      "image": productImage,
      "quantity": productQuantity,
    };
  }
}
