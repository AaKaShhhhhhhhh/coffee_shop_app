import 'package:flutter/material.dart';
import 'screens/login.dart';
import 'screens/home.dart';
import 'screens/product_details.dart';
import 'screens/cart.dart';
import 'theme/app_theme.dart';
import 'states/app_state.dart';
import 'states/auth_state.dart';
import 'states/cart_state.dart';
import 'states/theme_state.dart';

void main() {
  runApp(CoffeeShopApp());
}

class CoffeeShopApp extends StatelessWidget {
  CoffeeShopApp({super.key});

  final AppState appState = AppState(
    authState: AuthState(),
    cartState: CartState(),
    themeState: ThemeState(),
  );

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: appState.themeState,
      builder: (context, _) {
        return MaterialApp(
          title: 'Coffee Shop',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: appState.themeState.isDarkMode
              ? ThemeMode.dark
              : ThemeMode.light,
          initialRoute: '/login',
          routes: {
            '/login': (context) => LoginScreen(),
            '/home': (context) => HomeScreen(appState: appState),
            '/cart': (context) => CartScreen(appState: appState),
          },
          onGenerateRoute: (settings) {
            if (settings.name == '/product') {
              final args = settings.arguments;
              if (args is Map && args['product'] != null) {
                return MaterialPageRoute(
                  builder: (context) => ProductDetailsScreen(
                    appState: appState,
                    product: args['product'],
                  ),
                );
              }
            }
            return null;
          },
        );
      },
    );
  }
}
