// ignore_for_file: unused_import

import 'package:app_1/my_home_page.dart';
import 'package:app_1/pages/dashboard.dart';
import 'package:app_1/util/consts.dart';
import 'package:app_1/pages/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: poppins,
        iconTheme: IconThemeData(size: 40, color: Colors.grey),
        scaffoldBackgroundColor: Colors.black,
        // textTheme: TextTheme(
        //   bodyMedium: TextStyle(fontSize: 40, color: Colors.grey),
        // ),

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
        '/login_page': (context) => LoginScreen(),
        '/dashboard': (context) => MyDashBoard(),
      },
    );
  }
}
