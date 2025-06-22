import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';

class AuthState extends ChangeNotifier {
  User? user;
  bool get isLoggedIn => user != null;

  Future<void> login(String email, String password) async {
    // Simulate API call
    await Future.delayed(Duration(seconds: 1));
    user = User(id: '1', name: 'Coffee Lover', email: email);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('loggedIn', true);
    notifyListeners();
  }

  Future<void> logout() async {
    user = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('loggedIn', false);
    notifyListeners();
  }

  Future<void> checkLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('loggedIn') == true) {
      user = User(id: '1', name: 'Coffee Lover', email: 'user@coffee.com');
    } else {
      user = null;
    }
    notifyListeners();
  }
}
