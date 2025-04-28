// ignore_for_file: unnecessary_const, must_be_immutable, sized_box_for_whitespace, body_might_complete_normally_nullable

import 'package:app_1/util/my_dashboard_small_card.dart';
import 'package:flutter/material.dart';

class MyDashBoard extends StatelessWidget {
  List smallCardDetails = [
    [Icon(Icons.no_food_rounded), 'Rice'],
    [Icon(Icons.local_pizza_outlined), 'Pizza'],
    [Icon(Icons.rounded_corner), 'Burger'],
    [Icon(Icons.no_food_rounded), 'Rice'],
    [Icon(Icons.local_pizza_outlined), 'Pizza'],
    [Icon(Icons.rounded_corner), 'Burger'],
  ];
  MyDashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appetit'),
        leading: CircleAvatar(
          maxRadius: 5,
          child: Icon(Icons.supervised_user_circle_rounded),
        ),
        actions: [Icon(Icons.search_rounded)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          // physics: NeverScrollableScrollPhysics(),
          children: [
            Container(
              // color: Colors.deepPurple,
              height: MediaQuery.of(context).size.height * .4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      'What do you want to cook today?',
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.grey[300],
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),

                  Expanded(
                    child: ListView.builder(
                      itemCount: smallCardDetails.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return MyDashboardSmallCard(
                          icon: smallCardDetails[index][0],
                          text: smallCardDetails[index][1],
                        );
                      },
                    ),
                  ),
                  // MyDashboardSmallCard(
                  //   icon: Icon(Icons.no_food_rounded),
                  //   text: 'Some Text Details',
                  // ),
                ],
              ),
            ),
            Container(
              // color: Colors.deepPurple,
              height: MediaQuery.of(context).size.height * .6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Live Cooking',
                    style: TextStyle(color: Colors.white, fontSize: 15.0),
                  ),
                  Opacity(
                    opacity: .5,
                    child: Card(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Text('bla...'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * .7,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15.0),
                              ),
                              image: DecorationImage(
                                image: AssetImage(
                                  'images/pexels-yente-van-eynde-1263034-2403391.jpg',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Opacity(
                                  opacity: .5,
                                  child: Card(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: Text(
                                        'bla bla bla ...',

                                        style: TextStyle(fontSize: 15.0),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 60),
                                Text(
                                  'Delicious Food in every Bite',
                                  style: TextStyle(
                                    fontSize: 20,
                                    overflow: TextOverflow.fade,
                                    color: Colors.white,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Card(
                                      shape: Border.all(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                    ),
                                    Opacity(
                                      opacity: .5,
                                      child: Icon(Icons.add_box_rounded),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * .7,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15.0),
                              ),
                              image: DecorationImage(
                                image: AssetImage(
                                  'images/pexels-yente-van-eynde-1263034-2403391.jpg',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Opacity(
                                  opacity: .5,
                                  child: Card(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: Text(
                                        'bla bla bla ...',

                                        style: TextStyle(fontSize: 15.0),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 60),
                                Text(
                                  'Delicious Food in every Bite',
                                  style: TextStyle(
                                    fontSize: 20,
                                    overflow: TextOverflow.fade,
                                    color: Colors.white,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Card(
                                      shape: Border.all(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                    ),
                                    Opacity(
                                      opacity: .5,
                                      child: Icon(Icons.add_box_rounded),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * .7,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15.0),
                              ),
                              image: DecorationImage(
                                image: AssetImage(
                                  'images/pexels-yente-van-eynde-1263034-2403391.jpg',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Opacity(
                                  opacity: .5,
                                  child: Card(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: Text(
                                        'bla bla bla ...',

                                        style: TextStyle(fontSize: 15.0),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 60),
                                Text(
                                  'Delicious Food in every Bite',
                                  style: TextStyle(
                                    fontSize: 20,
                                    overflow: TextOverflow.fade,
                                    color: Colors.white,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Card(
                                      shape: Border.all(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                    ),
                                    Opacity(
                                      opacity: .5,
                                      child: Icon(Icons.add_box_rounded),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * .7,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15.0),
                              ),
                              image: DecorationImage(
                                image: AssetImage(
                                  'images/pexels-yente-van-eynde-1263034-2403391.jpg',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Opacity(
                                  opacity: .5,
                                  child: Card(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: Text(
                                        'bla bla bla ...',

                                        style: TextStyle(fontSize: 15.0),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 60),
                                Text(
                                  'Delicious Food in every Bite',
                                  style: TextStyle(
                                    fontSize: 20,
                                    overflow: TextOverflow.fade,
                                    color: Colors.white,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Card(
                                      shape: Border.all(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                    ),
                                    Opacity(
                                      opacity: .5,
                                      child: Icon(Icons.add_box_rounded),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * .7,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15.0),
                              ),
                              image: DecorationImage(
                                image: AssetImage(
                                  'images/pexels-yente-van-eynde-1263034-2403391.jpg',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Opacity(
                                  opacity: .5,
                                  child: Card(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: Text(
                                        'bla bla bla ...',

                                        style: TextStyle(fontSize: 15.0),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 60),
                                Text(
                                  'Delicious Food in every Bite',
                                  style: TextStyle(
                                    fontSize: 20,
                                    overflow: TextOverflow.fade,
                                    color: Colors.white,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Card(
                                      shape: Border.all(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                    ),
                                    Opacity(
                                      opacity: .5,
                                      child: Icon(Icons.add_box_rounded),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * .7,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15.0),
                              ),
                              image: DecorationImage(
                                image: AssetImage(
                                  'images/pexels-yente-van-eynde-1263034-2403391.jpg',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Opacity(
                                  opacity: .5,
                                  child: Card(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: Text(
                                        'bla bla bla ...',

                                        style: TextStyle(fontSize: 15.0),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 60),
                                Text(
                                  'Delicious Food in every Bite',
                                  style: TextStyle(
                                    fontSize: 20,
                                    overflow: TextOverflow.fade,
                                    color: Colors.white,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Card(
                                      shape: Border.all(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                    ),
                                    Opacity(
                                      opacity: .5,
                                      child: Icon(Icons.add_box_rounded),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * .7,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15.0),
                              ),
                              image: DecorationImage(
                                image: AssetImage(
                                  'images/pexels-yente-van-eynde-1263034-2403391.jpg',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Opacity(
                                  opacity: .5,
                                  child: Card(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: Text(
                                        'bla bla bla ...',

                                        style: TextStyle(fontSize: 15.0),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 60),
                                Text(
                                  'Delicious Food in every Bite',
                                  style: TextStyle(
                                    fontSize: 20,
                                    overflow: TextOverflow.fade,
                                    color: Colors.white,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Card(
                                      shape: Border.all(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                    ),
                                    Opacity(
                                      opacity: .5,
                                      child: Icon(Icons.add_box_rounded),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
