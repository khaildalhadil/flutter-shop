import 'package:flutter/material.dart';
import 'package:shopsmart/models/cart_model.dart';
import 'package:shopsmart/providers/ProductProvider.dart';
import 'package:uuid/uuid.dart';

class CartProvider with ChangeNotifier {
  final Map<String, CartModel> _cartItmes = {};

  Map<String, CartModel> get getCartItems {
    return _cartItmes;
  }


  // add cart to sqlite

  // Future<void> addToCartSqlite(String productId, int qty) {
  //   try{
  //
  //   }catch(err) {
  //     print("")
  //   }
  // }

  void addProductToCart({required String productId}) {
    _cartItmes.putIfAbsent(
      productId,
      () => CartModel(
        cartId: const Uuid().v4(),
        productId: productId,
        quantity: 1,
      ),
    );
    notifyListeners();
  }

  bool isProductInCart({required String productId}) {
    return _cartItmes.containsKey(productId);
  }

  String getTotal({required Productprovider productsProvider}) {
    double total = 0.0;
    _cartItmes.forEach((key, value) {
      final getCureentProduct = productsProvider.findByProductId(
        value.productId,
      );
      if (getCureentProduct == null) {
        total += 0;
      } else {
        total += double.parse(getCureentProduct.productPrice) * value.quantity;
      }
    });
    return total.toStringAsFixed(3);
  }

  int getQty() {
    int total = 0;
    _cartItmes.forEach((key, value) {
      total += value.quantity;
    });
    return total;
  }

  void updateQty({required String productId, required int qty}) {
    _cartItmes.update(
      productId,
      (cartItm) => CartModel(
        cartId: cartItm.cartId,
        productId: productId,
        quantity: qty,
      ),
    );
    notifyListeners();
  }

  void clearLocalCart() {
    _cartItmes.clear();
    notifyListeners();
  }

  void reamoveOneItem(String id) {
    _cartItmes.remove(id);
    notifyListeners();
  }
}
