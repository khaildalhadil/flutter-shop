import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopsmart/cart/quantity_btn_sheet.dart';
import 'package:shopsmart/providers/ProductProvider.dart';
import 'package:shopsmart/providers/cart_provider.dart';
import 'package:shopsmart/screens/Payment.dart';

class BottomCheckout extends StatelessWidget {
  const BottomCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Productprovider>(context);
    final carts = Provider.of<CartProvider>(context);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white70,
        border: Border(top: BorderSide(width: 1, color: Colors.black12)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          height: kBottomNavigationBarHeight + 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total (${carts.getCartItems.length} products/ ${carts.getQty()}items)",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "${carts.getTotal(productsProvider: products)} Rial OM",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green.shade400,
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () => {
                  Navigator.pushNamed(context, SimplePaymentWidget.id)
                },
                child: Text("Pay", style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
