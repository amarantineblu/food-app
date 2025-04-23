// ignore_for_file: avoid_unnecessary_containers, deprecated_member_use

import 'package:app_1/pages/login.dart';
import 'package:app_1/util/consts.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CreateAnAccountPage extends StatelessWidget {
  const CreateAnAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .7,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              // backgroundBlendMode: ,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
              ),
              image: DecorationImage(
                image: AssetImage('images/pexels-elevate-1267320.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(.7),
                  BlendMode.darken,
                ),
              ),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: FractionallySizedBox(
                    heightFactor: .3,
                    widthFactor: 1.0,
                    child: Container(
                      decoration: BoxDecoration(
                        // color: Colors.grey,
                        // gradient: LinearGradient(
                        //   colors: [Colors.grey, Colors.transparent],
                        //   begin: Alignment.topLeft,
                        //   end: Alignment.bottomRight,
                        // ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Create An Account',
                              style: TextStyle(
                                fontSize: fontSize30,
                                fontWeight: fontWeightBold700,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Lorem Ipsum l;ko lkoidofpo lkolkl;kd0oikd;lio',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              // decoration: BoxDecoration(color: Colors.black),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        maximumSize: Size(200, 50),
                      ),
                      child: Text('Register With Email'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Icon(Icons.mark_email_read_sharp),
                          ),
                        ),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Icon(Icons.apple_rounded),
                          ),
                        ),
                      ],
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
        ],
      ),
    );
  }
}
