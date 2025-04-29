// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          // alignment: Alignment(50, 50),
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 35,
                height: 35,
                child: Icon(Icons.chevron_left_rounded, size: 30),
              ),
            ),
            Positioned(
              bottom: 10,
              top: MediaQuery.of(context).size.height * .2,
              left: 10,
              right: 10,
              child: Column(
                children: [
                  Text(
                    'Forgot Password',
                    style: TextStyle(fontSize: 30, color: Colors.grey),
                  ),
                  Text(
                    'AppInspector: Error calling Runtime.evaluate with params {expression: .developer._extensions.keys.toList();, Cannot find context with specified id',
                  ),
                  Form(child: TextField()),
                ],
              ),
            ),
            Positioned(
              right: 10,
              bottom: 10,
              child: ElevatedButton(onPressed: () {}, child: Text(' Next ->')),
            ),
          ],
        ),
      ),
    );
  }
}
