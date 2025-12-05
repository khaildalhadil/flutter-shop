import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopsmart/providers/ProductProvider.dart';
import 'package:shopsmart/providers/cart_provider.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  static const id = "/details";
  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    final carts = Provider.of<CartProvider>(context);
    final products = Provider.of<Productprovider>(context);
    String? productId = ModalRoute.of(context)!.settings.arguments as String?;
    final cureentProduct = products.findByProductId(productId!);
    return cureentProduct == null
        ? SizedBox.shrink()
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white10,
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                title: Text("Shop Smart"),
              ),
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(18.0, 8.0, 18.0, 18.0),
                    child: Image.network(cureentProduct.productImage),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          cureentProduct.productTitle,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Text(
                        "${cureentProduct.productPrice} Rial OM",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(80),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.add, color: Colors.white),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 45,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blueAccent,
                                ),
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
                                child: Text(
                                  carts.isProductInCart(
                                        productId: cureentProduct.productId,
                                      )
                                      ? "Added ✅"
                                      : "Add To Cart",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "About this itme",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(cureentProduct.productCategory),
                    ],
                  ),
                  SizedBox(height: 10),
                  Flexible(child: Text(cureentProduct.productDescription)),
                ],
              ),
            ),
          );
  }
}
