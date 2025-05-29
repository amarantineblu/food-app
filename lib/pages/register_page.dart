// ignore_for_file: unused_import, unnecessary_null_comparison, avoid_print, avoid_unnecessary_containers, unused_local_variable, prefer_final_fields, unnecessary_new

import 'package:app_1/pages/dashboard.dart';
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
  final _fullName = new TextEditingController();
  final _email = new TextEditingController();
  final _password = new TextEditingController();
  // String selectedOption = '';
  final _phone = new TextEditingController();

  dynamic jsonUser;

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
                        controller: _fullName,
                        decoration: InputDecoration(labelText: 'Full Name'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please input a valid name';
                          } else {
                            return null;
                          }
                        },
                        
                      ),

                      TextFormField(
                        controller: _email,
                        decoration: InputDecoration(labelText: 'Email'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please input a valid email';
                          } else {
                            return null;
                          }
                        },
                        // onSaved: (value) {
                        //   email = value!;
                        // },
                      ),
                      TextFormField(
                        controller: _phone,
                        decoration: InputDecoration(labelText: 'Phone'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please input a valid number';
                          } else {
                            return null;
                          }
                        },
                        // onSaved: (value) {
                        //   phone = value!;
                        // },
                      ),
                      TextFormField(
                        controller: _password,
                        decoration: InputDecoration(labelText: 'Password'),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please input a valid Password';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) {
                          _password.text = value!;
                        },
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            Users users = Users(
                              fullName: _fullName.text,
                              email: _email.text,
                              phone: _phone.text,
                              password: _password.text,
                            );
                            users.saveUser();
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyDashBoard(),
                              ),
                            );
                            // jsonUser = users.toJson();
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
