import 'package:flutter/material.dart';

// class CartModel with ChangeNotifier {
//   final String cartId, productId;
//   final int quantity;
//
//   CartModel({
//     required this.cartId,
//     required this.productId,
//     required this.quantity,
//   });
// }
class CartModel with ChangeNotifier {
  final String cartId;
  final String productId;
  final int quantity;

  CartModel({
    required this.cartId,
    required this.productId,
    required this.quantity,
  });

  Map<String, dynamic> toMap() {
    return {
      'cartId': cartId,
      'productId': productId,
      'quantity': quantity,
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      cartId: map['cartId'],
      productId: map['productId'],
      quantity: map['quantity'],
    );
  }
}
