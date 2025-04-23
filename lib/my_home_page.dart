// import 'dart:convert';

// ignore_for_file: unused_import, avoid_print, use_build_context_synchronously

import 'package:app_1/pages/login.dart';
import 'package:app_1/util/carousel_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:app_1/util/consts.dart';
import 'package:app_1/pages/register_page.dart';
import 'package:app_1/pages/create_an_account_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;

  final List<Map<String, String>> carouselDetails = [
    {
      'carouselImage': 'pexels-cottonbro-3298637.jpg',
      'carouselBigText': 'Share Your Recipes',
      'carouselParagraph': ' Lorem Ipsum d ul liu kodioikodi kmnoiolkolio ',
    },

    {
      'carouselImage': 'pexels-yente-van-eynde-1263034-2403391.jpg',
      'carouselBigText': 'Learn To Cook',
      'carouselParagraph': ' Lorem Ipsum d ul liu kodioikodi kmnoiolkolio ',
    },

    {
      'carouselImage': 'pexels-juanpphotoandvideo-1587830.jpg',
      'carouselBigText': 'Become a Master Chef',
      'carouselParagraph': ' Lorem Ipsum d ul liu kodioikodi kmnoiolkolio ',
    },
  ];

  late Future<List> getCarousel;

  @override
  void initState() {
    super.initState();
    getCarousel = Future.delayed(Duration(seconds: 5), () => carouselDetails);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List>(
        future: getCarousel,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                // backgroundBlendMode: ,
                image: DecorationImage(
                  image: AssetImage('images/background_1.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Center(
                child: Text(
                  'Appetit',
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.white,
                    fontFamily: poppins,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            );
          }

          final carouselItems = snapshot.data!;
          return CarouselSlider.builder(
            itemCount: carouselItems.length,
            itemBuilder: (context, index, realIndex) {
              // if (index > carouselItems.length - 1) {
              //
              //   print('hello World');
              // }
              return CarouselItem(
                carouselBigText: carouselItems[index]['carouselBigText'],
                carouselImage: carouselItems[index]['carouselImage'],
                carouselParagraph: carouselItems[index]['carouselParagraph'],
              );
            },
            options: CarouselOptions(
              viewportFraction: 1.0,
              enableInfiniteScroll: false,
              autoPlay: true,
              enlargeCenterPage: false,
              height: MediaQuery.of(context).size.height,
              onPageChanged:
                  (index, reason) => {
                    setState(() {
                      currentIndex = index;
                      currentIndex == carouselItems.length - 1
                          ? Future.delayed(
                            Duration(seconds: 2),
                            () => {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CreateAnAccountPage(),
                                ),
                              ),
                            },
                          )
                          : true;
                    }),

                    // print(cr)
                  },
            ),
          );
        },
      ),
    );
  }
}
