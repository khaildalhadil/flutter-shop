import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopsmart/consts/theme_data.dart';
import 'package:shopsmart/database/db_helper.dart';
import 'package:shopsmart/providers/ProductProvider.dart';
import 'package:shopsmart/providers/UserProvider.dart';
import 'package:shopsmart/providers/cart_provider.dart';
import 'package:shopsmart/providers/theme_provider.dart';
import 'package:shopsmart/root_screen.dart';
import 'package:shopsmart/screens/Order.dart';
import 'package:shopsmart/screens/Payment.dart';
import 'package:shopsmart/screens/Rating.dart';
import 'package:shopsmart/screens/auth/login.dart';
import 'package:shopsmart/screens/auth/register.dart';
import 'package:shopsmart/screens/home_screen.dart';
import 'package:shopsmart/widgets/products/details.dart';

void main() async {

  runApp(const MyApp());
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            return ThemeProvider();
          },
        ),
        ChangeNotifierProvider(
          create: (_) {
            return Productprovider();
          },
        ),
        ChangeNotifierProvider(
          create: (_) {
            return CartProvider();
          },
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: "ShopAC",
            debugShowCheckedModeBanner: false,
            theme: Style.themeData(
              isDarkTheme: themeProvider.getIsDarkTheme,
              context: context,
            ),
            home: RootScreen(),
            // home: Login(),
            // home: Register(),
            routes: {
              RootScreen.id: (context)=> RootScreen(),
              Details.id: (context) => Details(),
              Register.id: (context) => Register(),
              Login.id: (context) => Login(),
              RatingWithButton.id: (context) => RatingWithButton(),
              SimplePaymentWidget.id: (context) => SimplePaymentWidget(),
              ThankYouScreen.id: (context) => ThankYouScreen()
            },
          );
        },
      ),
    );
  }
}
