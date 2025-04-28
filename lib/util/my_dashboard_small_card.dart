// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';

class MyDashboardSmallCard extends StatelessWidget {
  final Icon icon;
  final String text;
  const MyDashboardSmallCard({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      // color: Colors.white,
      child: Row(
        children: [
          icon,
          Text(text, style: TextStyle(fontSize: 15, color: Colors.grey)),
        ],
      ),
    );
  }
}
