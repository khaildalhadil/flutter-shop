import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopsmart/providers/UserProvider.dart';
import 'package:shopsmart/providers/theme_provider.dart';
import 'package:shopsmart/screens/auth/login.dart';
import 'package:shopsmart/services/alert.dart';

class ProfileScrren extends StatelessWidget {
  const ProfileScrren({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvid = Provider.of<ThemeProvider>(context);
    final userInfo = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        leading: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Image.asset(
            "assets/images/bag/shopping_cart.png",
            
          ),
        ),
        title: Text("Profile Screen"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 11),
            Visibility(
              // visible: false,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_v2gfNKNuwBsh3JWekaI07zxHPQhuA0Xwx1og52tObuw_5wIwXfJsp-nNdP-I6aFI3QM&usqp=CAU",
                        width: 50,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Khalid Alhadi",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                          Text(
                            "khalid@gmail.com",
                            style: TextStyle(fontSize: 14.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(flex: 1, child: Icon(Icons.edit)),
                ],
              ),
            ),
            SizedBox(height: 30),
            Column(
              children: [
                Text("General"),
                Row(
                  spacing: 10.0,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset("assets/images/bag/order_svg.png"),
                      ),
                    ),
                    Expanded(flex: 5, child: Text("All Order")),
                    Expanded(flex: 1, child: Icon(Icons.arrow_right_outlined)),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  spacing: 10.0,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          "assets/images/bag/wishlist_svg.png",
                        ),
                      ),
                    ),
                    Expanded(flex: 5, child: Text("Wishlist")),
                    Expanded(flex: 1, child: Icon(Icons.arrow_right_outlined)),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  spacing: 10.0,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset("assets/images/profile/theme.png"),
                      ),
                    ),
                    Expanded(flex: 6, child: Text("Dark/Light")),
                    // SwitchListTile(
                    //   value: themeProvid.getIsDarkTheme,
                    //   onChanged: (value) {
                    //     themeProvid.setDarkTheme(value);
                    //   },
                    // ),
                  ],
                ),
              ],
            ),
            ElevatedButton.icon(
              icon: Icon(Icons.login),

              label: Text(userInfo == null ? "Logout": "Login"),
              onPressed: () async {
                Alert.showErrorOrWarning(
                  context: context,
                  fct: () {
                    Navigator.pushNamed(context, Login.id);
                  },
                  mst: "Are you sure you want to signout",
                  isError: false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
