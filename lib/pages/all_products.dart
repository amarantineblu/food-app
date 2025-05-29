// ignore_for_file: sized_box_for_whitespace, must_be_immutable, annotate_overrides, avoid_unnecessary_containers, avoid_print, prefer_interpolation_to_compose_strings, prefer_typing_uninitialized_variables, prefer_function_declarations_over_variables, unused_local_variable

import 'package:app_1/controllers/product_controller.dart';
import 'package:app_1/util/consts.dart';
import 'package:app_1/util/animated_container.dart';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class AllProducts extends StatefulWidget {
  const AllProducts({super.key});

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  final ProductController _productController = ProductController();
  String? indexImage;
  late Future<List<dynamic>> _productData;

  @override
  void initState() {
    super.initState();
    _productData = _productController.allProducts();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: foodCategories.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        foodCategories[index],
                        style: TextStyle(fontSize: fontSize30 / 2),
                      ),
                    ),
                  );
                },
              ),
            ),

            FutureBuilder<List<dynamic>>(
              future: _productData,
              builder: (context, ss) {
                if (ss.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                final items = ss.data;
                return Expanded(
                  child: MasonryGridView.builder(
                    gridDelegate:
                        SliverSimpleGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                    mainAxisSpacing: 2.0,
                    crossAxisSpacing: 2.0,
                    itemCount: items?.length,
                    itemBuilder: (context, index) {
                      final itemDetails = items![index];
                      // print(itemDetails);
                      return HoverDetailBox(details: itemDetails);
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
