import 'package:flutter/material.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:provider/provider.dart';
import 'package:shopsmart/cart/quantity_btn_sheet.dart';
import 'package:shopsmart/models/cart_model.dart';
import 'package:shopsmart/providers/ProductProvider.dart';
import 'package:shopsmart/providers/cart_provider.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final cartModel = Provider.of<CartModel>(context);
    final carts = Provider.of<CartProvider>(context);
    final products = Provider.of<Productprovider>(context);
    final cureentProduct = products.findByProductId(cartModel.productId);
    return cureentProduct == null
        ? SizedBox.shrink()
        : FittedBox(
            child: IntrinsicWidth(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: FancyShimmerImage(
                        imageUrl: cureentProduct.productImage,
                        height: size.height * 0.2,
                        width: size.width * 0.3,
                      ),
                    ),
                    SizedBox(width: 16.0),
                    IntrinsicWidth(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: size.width * 0.6,
                                    child: Text(
                                      cureentProduct.productTitle,
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 14),
                                  Text(
                                    "${cureentProduct.productPrice} Rial",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),

                              Column(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      carts.reamoveOneItem(
                                        cureentProduct.productId,
                                      );
                                    },
                                    icon: Icon(Icons.clear, color: Colors.red),
                                  ),
                                  OutlinedButton.icon(
                                    onPressed: () async {
                                      await showModalBottomSheet(
                                        context: context,
                                        builder: (context) {
                                          return QuantityBtnSheet(
                                            cartModel: cartModel,
                                          );
                                        },
                                      );
                                    },
                                    label: Text("QTY: ${cartModel.quantity}"),
                                    icon: Icon(Icons.arrow_drop_down),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
