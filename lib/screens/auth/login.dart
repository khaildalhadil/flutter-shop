import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shopsmart/consts/validator.dart';
import 'package:shopsmart/database/db_helper.dart';
import 'package:shopsmart/providers/UserProvider.dart';
import 'package:shopsmart/root_screen.dart';
import 'package:shopsmart/screens/auth/register.dart';
import 'package:shopsmart/screens/home_screen.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  static const id = "/login";

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {


  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  late final FocusNode _emailFocuse;
  late final FocusNode _passwordFocuse;

  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();

    _emailFocuse = FocusNode();
    _passwordFocuse = FocusNode();

    super.initState();
  }

  Future<void> _loginFct() async {
    final isValid = _formkey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      try {

        final user = await DBHelper.getUser(_emailController.text, _passwordController.text);

        if (user != null) {
          Fluttertoast.showToast(
            msg:
            // "The Accounted has been added success ${user.additionalUserInfo}",
            "Welcome Back ${user["email"]}",
            textColor: Colors.white,
            fontSize: 16.0,
          );
          UserProvider.email = user["email"];
          Navigator.pushNamed(context, RootScreen.id);

        } else {
          Fluttertoast.showToast(
            msg:
            // "The Accounted has been added success ${user.additionalUserInfo}",
            "Wrong email or password!!! ",
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      } catch (err) {
        Fluttertoast.showToast(
          msg: err.toString(),
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Shop Smart",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.blueAccent,
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: AlignmentGeometry.topLeft,
                  child: Text(
                    "Welcome Back To Login Page !",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black54,
                    ),
                  ),
                ),
                SizedBox(height: 14),
                TextFormField(
                  controller: _emailController,
                  focusNode: _emailFocuse,
                  autofocus: true,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Email address",
                    prefixIcon: Icon(Icons.email_outlined),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1),
                    ),
                  ),
                  onFieldSubmitted: (value) {
                    FocusScope.of(context).requestFocus(_passwordFocuse);
                  },
                  validator: (value) {
                    return MyValidators.emailValidator(value);
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  focusNode: _passwordFocuse,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    hintText: "**********",
                    prefixIcon: Icon(Icons.password_outlined),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1),
                    ),
                  ),
                  onFieldSubmitted: (value) {
                    _loginFct();
                  },
                  validator: (value) {
                    return MyValidators.passwordValidator(value);
                  },
                ),
                SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                    ),
                    onPressed: () {
                      _loginFct();
                    },
                    icon: Icon(Icons.login, color: Colors.white, size: 22),
                    label: Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text("Don't have an account? "),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Register.id);
                        },
                        child: Text(
                          "Register ",
                          style: TextStyle(fontStyle: FontStyle.italic),
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
