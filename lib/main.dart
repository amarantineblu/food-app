// ignore_for_file: unused_import

import 'package:app_1/my_home_page.dart';
import 'package:app_1/pages/add_food_page.dart';
import 'package:app_1/pages/all_products.dart';
import 'package:app_1/pages/dashboard.dart';
import 'package:app_1/pages/forgot_password.dart';
import 'package:app_1/util/consts.dart';
import 'package:app_1/pages/login.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // inputDecorationTheme: InputDecorationTheme(

        // ),
        fontFamily: poppins,
        iconTheme: IconThemeData(size: 40, color: Colors.grey),
        scaffoldBackgroundColor: Colors.black,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: Colors.deepOrange,
            foregroundColor: Colors.white,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
      routes: {
        '/login-page': (context) => LoginScreen(),
        '/dashboard': (context) => MyDashBoard(),
        '/forgot-password': (context) => ForgotPassword(),
        '/add-food': (context) => AddFoodPage(),
        '/all-food': (context) => AllProducts(),
      },
    );
  }
}
