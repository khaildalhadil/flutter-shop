import 'dart:math';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopsmart/providers/ProductProvider.dart';
import 'package:shopsmart/providers/theme_provider.dart';
import 'package:shopsmart/consts/app_colors.dart';
import 'package:shopsmart/widgets/products/ctg_rounded_widget.dart';
import 'package:shopsmart/widgets/products/latest_arrival.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Productprovider>(context);
    List<String> bannerImage = [
      "assets/images/banners/banner1.png",
      "assets/images/banners/banner2.png",
      "assets/images/banners/banner1.png",
    ];
    final themeProvid = Provider.of<ThemeProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        leading: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Image.asset("assets/images/bag/shopping_cart.png"),
        ),
        title: Text("Shop "),
      ),
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.25,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return Image.asset(bannerImage[index], fit: BoxFit.fill);
              },
              itemCount: 3,
              pagination: SwiperPagination(),
              control: SwiperControl(),
            ),
          ),
          SizedBox(height: 15.0),
          Text("Latest arrival", style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(
            height: size.height * 0.2,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return ChangeNotifierProvider.value(
                  value: products.getProducts[index],
                  child: LatestArrival(),
                );
              },
            ),
          ),
          SizedBox(height: 15.0),
          Text("Categories", style: TextStyle(fontWeight: FontWeight.bold)),
          GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 5,
            children: [
              CtgRoundedWidget(
                image: "assets/images/bag/shopping_cart.png",
                name: "name",
              ),
              CtgRoundedWidget(
                image: "assets/images/bag/shopping_cart.png",
                name: "name",
              ),
              CtgRoundedWidget(
                image: "assets/images/bag/shopping_cart.png",
                name: "name",
              ),
              CtgRoundedWidget(
                image: "assets/images/bag/shopping_cart.png",
                name: "name",
              ),
              CtgRoundedWidget(
                image: "assets/images/bag/shopping_cart.png",
                name: "name",
              ),
              CtgRoundedWidget(
                image: "assets/images/bag/shopping_cart.png",
                name: "name",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
