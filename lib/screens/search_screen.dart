import 'package:flutter/material.dart';
import 'package:dynamic_height_list_view/dynamic_height_view.dart';
import 'package:provider/provider.dart';
import 'package:shopsmart/models/product.dart';
import 'package:shopsmart/providers/ProductProvider.dart';
import 'package:shopsmart/widgets/products/product_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Productprovider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        leading: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Image.asset("assets/images/bag/shopping_cart.png"),
        ),
        title: Text(
          "Search Products",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.black12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.black26),
                ),
              ),
            ),
            SizedBox(height: 14.0),
            Expanded(
              child: DynamicHeightGridView(
                itemCount: products.products.length,
                crossAxisCount: 2,
                builder: (context, index) {
                  return Center(
                    child: ProductWidget(
                      productId: products.getProducts[index].productId,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
