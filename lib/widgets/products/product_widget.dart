import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopsmart/models/product.dart';
import 'package:shopsmart/providers/ProductProvider.dart';
import 'package:shopsmart/providers/cart_provider.dart';
import 'package:shopsmart/widgets/products/details.dart';

class ProductWidget extends StatefulWidget {
  final String productId;

  const ProductWidget({super.key, required this.productId});
  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Productprovider>(context);
    final cureentProduct = products.findByProductId(widget.productId);
    final carts = Provider.of<CartProvider>(context);
    // final productsModelProvider = Provider.of<ProductModel>(context);

    Size size = MediaQuery.of(context).size;
    return cureentProduct == null
        ? SizedBox.shrink()
        : Padding(
            padding: const EdgeInsets.all(3.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  Details.id,
                  arguments: cureentProduct.productId,
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: FancyShimmerImage(
                      imageUrl: cureentProduct.productImage,
                      width: double.infinity,
                      height: size.height * 0.22,
                    ),
                  ),
                  SizedBox(height: 12.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(child: Text(cureentProduct.productTitle)),
                      Material(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(28.0),
                        child: IconButton(
                          onPressed: () {
                            if (carts.isProductInCart(
                              productId: cureentProduct.productId,
                            )) {
                              return;
                            }
                            carts.addProductToCart(
                              productId: cureentProduct.productId,
                            );
                          },
                          icon: Icon(
                            carts.isProductInCart(
                                  productId: cureentProduct.productId,
                                )
                                ? Icons.check
                                : Icons.add_shopping_cart_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    " ${cureentProduct.productPrice} Rial OM",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
  }
}
