import 'package:flutter/material.dart';
import 'auth_state.dart';
import 'cart_state.dart';
import 'theme_state.dart';

/// Simple Notifier base class for custom state management
class Notifier<T> extends ChangeNotifier {
  T value;
  Notifier(this.value);
  void update(T newValue) {
    value = newValue;
    notifyListeners();
  }
}

/// AppState holds all global app states
class AppState extends ChangeNotifier {
  final AuthState authState;
  final CartState cartState;
  final ThemeState themeState;

  AppState({
    required this.authState,
    required this.cartState,
    required this.themeState,
  });
}
