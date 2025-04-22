// ignore_for_file: must_be_immutable, avoid_unnecessary_containers, sized_box_for_whitespace

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
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            // backgroundBlendMode: ,
            image: DecorationImage(
              image: AssetImage('images/$carouselImage'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 10.0,
          width: 300.0,
          height: 50.0,
          child: Container(
            height: 50.0,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 2.0),
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
          ),
        ),
      ],
    );
  }
}
