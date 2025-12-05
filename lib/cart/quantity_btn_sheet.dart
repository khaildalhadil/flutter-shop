import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopsmart/models/cart_model.dart';
import 'package:shopsmart/providers/cart_provider.dart';

class QuantityBtnSheet extends StatelessWidget {
  final CartModel cartModel;
  const QuantityBtnSheet({super.key, required this.cartModel});
  @override
  Widget build(BuildContext context) {
    final carts = Provider.of<CartProvider>(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 6,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: Colors.grey,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 25,
            itemBuilder: (context, index) {
              return InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Text("${index + 1}")),
                ),
                onTap: () => {
                  carts.updateQty(
                    productId: cartModel.productId,
                    qty: index + 1,
                  ),
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
