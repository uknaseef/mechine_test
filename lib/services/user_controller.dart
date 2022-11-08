import 'package:flutter/material.dart';
import 'package:mechine_test/screens/home_screen.dart';
import 'package:mechine_test/screens/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserGetService extends ChangeNotifier {
  void login(BuildContext context, String username, String password) async {
    final pref = await SharedPreferences.getInstance();
    if (username == 'test@gmail.com' && password == '12345678') {
      pref.setBool('isLogged', true);
      pref.setString('username', username);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    }
  }

  void logout(BuildContext context) async {
    final pref = await SharedPreferences.getInstance();
    pref.clear();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }
}
