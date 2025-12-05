import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopsmart/models/cart_model.dart';
import 'package:shopsmart/models/product.dart';
import 'package:shopsmart/providers/ProductProvider.dart';
import 'package:shopsmart/providers/cart_provider.dart';
import 'package:shopsmart/widgets/products/details.dart';

class LatestArrival extends StatelessWidget {
  const LatestArrival({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final product = Provider.of<ProductModel>(context);
    // final carts = Provider.of<CartProvider>(context);
    final carts = Provider.of<CartProvider>(context);
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Details.id, arguments: product.productId);
      },
      child: SizedBox(
        width: size.width * 0.52,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Flexible(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: FancyShimmerImage(
                    imageUrl: product.productImage,
                    width: size.width * 0.28,
                    height: size.height * 0.28,
                  ),
                ),
                SizedBox(width: 5),
                Flexible(
                  child: Column(
                    children: [
                      Text(
                        product.productTitle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      IconButton(
                        onPressed: () {
                          if (carts.isProductInCart(
                            productId: product.productId,
                          )) {
                            return;
                          }
                          carts.addProductToCart(productId: product.productId);
                        },
                        icon: Icon(
                          carts.isProductInCart(productId: product.productId)
                              ? Icons.check
                              : Icons.add_shopping_cart_outlined,
                        ),
                      ),
                      Flexible(
                        child: Text(
                          "${product.productPrice} Rial OM",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
