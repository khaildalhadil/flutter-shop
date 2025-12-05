import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopsmart/cart/cart_screen.dart';
import 'package:shopsmart/providers/cart_provider.dart';
import 'package:shopsmart/screens/home_screen.dart';
import 'package:shopsmart/screens/profile_screen.dart';
import 'package:shopsmart/screens/search_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  late List<Widget> screen;
  late int currentScreen = 0;
  late PageController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    screen = [HomeScreen(), SearchScreen(), CartScreen(), ProfileScrren()];
    controller = PageController(initialPage: currentScreen);
  }

  @override
  Widget build(BuildContext context) {
    final carts = Provider.of<CartProvider>(context);
    return Scaffold(
      body: PageView(controller: controller, children: screen),

      bottomNavigationBar: NavigationBar(
        selectedIndex: currentScreen,
        // color here
        backgroundColor: Colors.white10,
        onDestinationSelected: (index) => {
          setState(() {
            currentScreen = index;
          }),
          controller.jumpToPage(currentScreen),
        },
        destinations: [
          NavigationDestination(
            selectedIcon: Icon(Icons.home_filled),
            icon: Icon(Icons.home),
            label: "Home",
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.search),
            icon: Icon(Icons.search),
            label: "search",
          ),
          NavigationDestination(
            // selectedIcon: Icon(Icons.card_giftcard),
            icon: Badge(
              child: Icon(Icons.card_giftcard),
              label: Text("${carts.getCartItems.length}"),
            ),
            label: "Cart",
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person_2_outlined),
            icon: Icon(Icons.person),
            label: "person",
          ),
        ],
      ),
    );
  }
}
