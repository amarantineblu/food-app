// ignore_for_file: unused_import, unnecessary_null_comparison, avoid_print, avoid_unnecessary_containers, unused_local_variable

import 'package:app_1/pages/login.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:app_1/util/consts.dart';
import 'package:app_1/models/users_model.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  String fullName = '';
  String email = '';
  String password = '';
  // String selectedOption = '';
  String phone = '';

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
                  'Register',
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
                        decoration: InputDecoration(labelText: 'Full Name'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please input a valid name';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          fullName = value!;
                        },
                      ),

                      TextFormField(
                        decoration: InputDecoration(labelText: 'Email'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please input a valid email';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          email = value!;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Phone'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please input a valid number';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          phone = value!;
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
                            var users = Users(
                              fullName: fullName,
                              email: email,
                              phone: phone,
                              password: password,
                            );
                            print(users);
                          }
                        },
                        child: Text('Register'),
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
                          text: 'Login',
                          style: TextStyle(color: Colors.white),
                          recognizer:
                              TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginScreen(),
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
