
import 'package:flutter/cupertino.dart';
import 'package:shopsmart/models/UserModel.dart';

class UserProvider with ChangeNotifier {
  late final String name, email, password;

  Future<UserModel?> addUserInfo(String email, String name, String password) async {
    this.name = name;
    this.email = email;
    this.password = password;
  }
}