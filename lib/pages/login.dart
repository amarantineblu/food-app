// ignore_for_file: unused_import, unnecessary_null_comparison, avoid_print

import 'package:app_1/util/consts.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:app_1/pages/register_page.dart';

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
                      // DropdownButtonFormField<String>(
                      //   value: selectedOption,
                      //   items: ['+234', '+1', '+63'].map((option) {
                      //     return DropdownMenuItem(child: Text(option));
                      //   }),
                      //   onChanged: (value) {
                      //     selectedOption = value;
                      //   },
                      // ),
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
                            print({'email : $email', 'password: $password'});
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
                          text: 'Register',
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
