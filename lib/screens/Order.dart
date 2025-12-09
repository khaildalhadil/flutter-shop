import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopsmart/models/cart_model.dart';
import 'package:shopsmart/providers/cart_provider.dart';
import 'package:shopsmart/root_screen.dart';

import '../database/db_helper.dart';

class ThankYouScreen extends StatelessWidget {
  const ThankYouScreen({super.key});
  static String id = "/thank";
  @override
  Widget build(BuildContext context) {
    final carts = Provider.of<CartProvider>(context);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Thank You!",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                "Your order has been added successfully.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    Navigator.pushNamed(context, RootScreen.id);

                    for (var item in carts.getCartItems.values) {
                      await DBHelper.insertCart(item);
                    }
                    carts.clearLocalCart();
                  },
                  child: const Text("Back To Shop"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
