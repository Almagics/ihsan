
import 'package:flutter/material.dart';
import 'package:ihsan/persentation/Main/inventory_view.dart';
import 'package:ihsan/persentation/forget_password/forget_password_view.dart';
import 'package:ihsan/persentation/login/login_View.dart';

import 'package:ihsan/persentation/register/register_view.dart';
import 'package:ihsan/persentation/splash/splashView_view.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashView(),
      routes: {
        'login': (context) => const LoginView(),
        'forget': (context) => const ForgetPasswordView(),
        'register': (context) => const RegisterView(),

        'inventory': (context) =>  InventoryScreen(),
      },
    );
  }
}
