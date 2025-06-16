// ignore_for_file: unused_local_variable, unused_import, avoid_print, unnecessary_null_comparison

import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/product_model.dart';

import 'package:http/http.dart' as http;

class ProductController {
  Future<void> saveProduct(request) async {
    final requestDetails = {
      'category': request['category'],
      'description': request['description'],
      'image': request['image'],
      'name': request['name'],
    };
    final product = Product(
      category: requestDetails['category'],
      description: requestDetails['description'],
      image: requestDetails['image'],
      name: requestDetails['name'],
    );
    product.routeLocation = 'products/addProduct.php';
    product.requestBody = requestDetails;
    product.save();
  }

  Future<Map<String, List<Map<String, dynamic>>>> allProducts() async {
    final url = Uri.parse(
      "http://localhost/dashboard/flutter_food_app/products/allProducts.php",
    );
    try {
      final response = await http.get(url);
      List<dynamic> responseData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Map<String, List<Map<String, dynamic>>> grouped = {};
        for (var product in responseData) {
          if (product is! Map<String, dynamic>) {
            // print('Skipping non-map item: $product');
            continue;
          }
          String category = product['category'];
          if (category == null) {
            print('Product missing category : $product');
            continue;
          }
          grouped.putIfAbsent(category, () => []);
          grouped[category]!.add(Map<String, dynamic>.from(product));
        }
        // grouped.forEach((category, products) {
        //   print('Category : $category');
        //   for (var p in products) {
        //     print(' - ${p['name']}');
        //   }
        // });

        return grouped;
      } else {
        throw Exception('failed to load data : ${response.statusCode}');
      }
    } catch (e) {
      print('Request Failed: $e');
      throw Exception('failed to load data');
    }
  }
}
