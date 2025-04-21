// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CarouselItem extends StatelessWidget {
  final String carouselImage;
  final String carouselBigText;
  final String carouselParagraph;

  const CarouselItem({
    super.key,
    required this.carouselBigText,
    required this.carouselImage,
    required this.carouselParagraph,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        // backgroundBlendMode: ,
        image: DecorationImage(
          image: AssetImage('images/$carouselImage'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Text(
            carouselBigText,
            style: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.white,
            ),
          ),
          Text(
            carouselParagraph,
            style: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
