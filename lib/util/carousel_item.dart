// ignore_for_file: must_be_immutable, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:app_1/util/consts.dart';
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
          bottom: 0,
          left: 10.0,
          width: 300.0,
          // height: 50.0,
          child: Container(
            // height: 50.0,
            decoration: BoxDecoration(
              backgroundBlendMode: BlendMode.multiply,
              // backgroundBlendMode:
              // border: Border.all(color: Colors.grey, width: 2.0),
              color: Colors.black,

              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    carouselBigText,
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: fontWeightBold700,
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
        ),
      ],
    );
  }
}
