import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shopsmart/consts/validator.dart';
import 'package:shopsmart/screens/home_screen.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late final TextEditingController _emailController;
  late final TextEditingController _userNameController;
  late final TextEditingController _passwordController;

  late final FocusNode _emailFocuse;
  late final FocusNode _userNameFocuse;
  late final FocusNode _passwordFocuse;

  bool isLoadding = false;

  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController = TextEditingController();
    _userNameController = TextEditingController();
    _passwordController = TextEditingController();

    _emailFocuse = FocusNode();
    _userNameFocuse = FocusNode();
    _passwordFocuse = FocusNode();

    super.initState();
  }

  Future<void> _registerFct() async {
    final isValid = _formkey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      try {
        setState(() {
          isLoadding = true;
        });
        Fluttertoast.showToast(
          msg: "The Accounted has been added success",
          textColor: Colors.white,
          fontSize: 16.0,
        );
      } catch (err) {
        Fluttertoast.showToast(
          msg: err.toString(),
          textColor: Colors.white,
          fontSize: 16.0,
        );
      } finally {
        setState(() {
          isLoadding = false;
        });
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
                    "Welcome Back To Register Page !",
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
                  controller: _userNameController,
                  focusNode: _userNameFocuse,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    hintText: "user123",
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1),
                    ),
                  ),
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    return MyValidators.displayNamevalidator(value);
                  },
                ),

                SizedBox(height: 14),
                TextFormField(
                  controller: _emailController,
                  focusNode: _emailFocuse,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.datetime,
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
                    _registerFct();
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
                      _registerFct();
                    },
                    icon: Icon(Icons.login, color: Colors.white, size: 22),
                    label: Text(
                      "Register",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text("You have an account? "),
                      TextButton(
                        onPressed: () {
                          // validator: (value) {
                          //   return MyValidators.passwordValidator(value);
                          // },
                          Navigator.pushNamed(context, "/login");
                        },
                        child: Text(
                          "Login",
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
