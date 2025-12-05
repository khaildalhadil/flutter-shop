import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopsmart/cart/bottom_checkout.dart';
import 'package:shopsmart/cart/cart_widget.dart';
import 'package:shopsmart/providers/ProductProvider.dart';
import 'package:shopsmart/providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Productprovider>(context);
    final carts = Provider.of<CartProvider>(context);
    Size size = MediaQuery.of(context).size;
    final bool isEmpty = false;
    return carts.getCartItems.isEmpty
        ? Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/bag/shopping_basket.png",
                  width: double.infinity,
                  height: size.height * 0.35,
                ),
                Text(
                  "Whoops",
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Your cart is empty!",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: 14),
                Text(
                  "Looks like your cart is empty add something and make me happy",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: 18),
                ElevatedButton(
                  onPressed: () => {},
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.green,
                  ),
                  child: Text(
                    "Shop Now",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          )
        : Scaffold(
            bottomSheet: BottomCheckout(),
            appBar: AppBar(
              backgroundColor: Colors.white10,
              leading: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Image.asset("assets/images/bag/shopping_cart.png"),
              ),
              title: Text("Cart (${carts.getCartItems.length})"),
              actions: [
                IconButton(
                  onPressed: () {
                    carts.clearLocalCart();
                  },
                  icon: Icon(Icons.delete, color: Colors.red),
                ),
              ],
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: carts.getCartItems.length,
                    itemBuilder: (context, index) {
                      return ChangeNotifierProvider.value(
                        value: carts.getCartItems.values.toList()[index],
                        child: CartWidget(),
                      );
                    },
                  ),
                ),
                SizedBox(height: 100),
              ],
            ),
          );
  }
}
