import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../src/features/car/Screen/home/home_screen.dart';
import '../src/register/login_page.dart';

class ProviderPages with ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLogin = false;

  List<String> itemList = [];

  void register_splash(BuildContext context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool? isRegister = pref.getBool('isLogin');
    if (isRegister != null && isRegister) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  }

  void registerUser(
    BuildContext context,
    String name,
    String email,
    String password,
  ) async {
    var pref = await SharedPreferences.getInstance();
    if (name.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
      pref.setString('name', name);
      pref.setString('email', email);
      pref.setString('password', password);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
      Fluttertoast.showToast(msg: 'Registation  Success');
      nameController.clear();
      emailController.clear();
      passwordController.clear();
    } else {
      Fluttertoast.showToast(msg: 'Registation Not Success');
    }
  }

  void login_functio(
    BuildContext context,
    String email,
    String password,
  ) async {
    var prefLogin = await SharedPreferences.getInstance();
    var userEmail = prefLogin.getString('email');
    var userPassword = prefLogin.getString('password');

    if (email == userEmail && password == userPassword) {
      prefLogin.setBool('isLogin', true);
      Fluttertoast.showToast(msg: 'Login Success');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      Fluttertoast.showToast(msg: 'Login not Success');
    }
  }
}
