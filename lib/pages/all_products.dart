// ignore_for_file: avoid_print, unused_field, unnecessary_cast, unnecessary_this, unrelated_type_equality_checks

// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:app_1/controllers/product_controller.dart';
import 'package:app_1/util/consts.dart';
import '../util/grouped_products_list.dart';

class AllProducts extends StatefulWidget {
  const AllProducts({super.key});

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  final ProductController _productController = ProductController();
  late Future<Map<String, List<Map<String, dynamic>>>> _productDataFuture;
  List<Map<String, dynamic>>? _groupedData;
  String? _selectedCategory;
  // final Bool _displayUI;

  @override
  void initState() {
    super.initState();
    _productDataFuture = _productController.allProducts();
    _initializeDefaultCategory();
  }

  void _initializeDefaultCategory() async {
    final data = await _productDataFuture;

    if (data.isNotEmpty) {
      final firstKey = data.keys.first;
      setState(() {
        _selectedCategory = firstKey;
        _groupedData = data[firstKey];
      });
    }
  }

  void _onCategorySelected(
    String category,
    Map<String, List<Map<String, dynamic>>> data,
  ) async {
    print("Category Selected : $category");
    if (data.containsKey(category)) {
      if (this.mounted) {
        setState(() {
          _selectedCategory = category;
          _groupedData = data[category];
          print(_groupedData);
          // _displayUI = true as Bool;
          // print(_displayUI);
          //     () {
          //         }
          //         as Widget;
        });
      }
    } else {
      print("Category not found in data");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<Map<String, List<Map<String, dynamic>>>>(
          future: _productDataFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            final data = snapshot.data!;
            final categories = data.keys.toList();

            return Column(
              children: [
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      return GestureDetector(
                        onTap: () => _onCategorySelected(category, data),
                        child: Card(
                          color:
                              _selectedCategory == category
                                  ? Colors.blue.shade100
                                  : null,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              category,
                              style: TextStyle(fontSize: fontSize30 / 2),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                if (_groupedData != null && this.mounted)
                  // _displayUI,
                  Expanded(child: GroupedProductsList(items: _groupedData!)),
              ],
            );
          },
        ),
      ),
    );
  }
}
