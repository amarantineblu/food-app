// ignore_for_file: unused_import, unnecessary_null_comparison, avoid_print, avoid_unnecessary_containers, unused_local_variable, use_build_context_synchronously
// ignore_for_file: depend_on_referenced_packages

import 'package:app_1/pages/dashboard.dart';
import 'package:app_1/util/consts.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:app_1/pages/register_page.dart';

import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            heightFactor: 1.0,
            child: Column(
              children: [
                Text(
                  'Login',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: fontSize30,
                    fontWeight: fontWeightBold700,
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Email'),
                        validator: (value) {
                          if (!value!.contains('@') ||
                              value == null ||
                              value.isEmpty) {
                            return 'Please input a valid email';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          email = value!;
                        },
                      ),

                      TextFormField(
                        decoration: InputDecoration(labelText: 'Password'),
                        obscureText: true,
                        onSaved: (value) {
                          password = value!;
                        },
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            // print({'email : $email', 'password: $password'});
                            loginUser(email, password, context);
                          }
                        },
                        child: Text('Login'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () {},
                              child: Icon(Icons.mark_email_read_sharp),
                            ),
                          ),
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () {},
                              child: Icon(Icons.apple_rounded),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Already have an account?',
                          style: TextStyle(color: Colors.grey),
                        ),
                        TextSpan(
                          text: ' Register',
                          style: TextStyle(color: Colors.white),
                          recognizer:
                              TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RegisterPage(),
                                    ),
                                  );
                                },
                        ),
                      ],
                    ),
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

loginUser(String email, String password, BuildContext context) async {
  try {
    // 192.168.142.57
    final url = Uri.parse(
      "http://192.168.188.76/dashboard/flutter_food_app/getData.php",
    );
    final response = await http.post(
      url,
      headers: {"Content-Type": 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    // print(response.statusCode);
    response.statusCode == 200
        ? Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MyDashBoard()),
        )
        : null;
  } catch (e) {
    print('Request Failed: $e');
  }
}
