// ignore_for_file: unused_local_variable, unused_import, avoid_print

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

  Future<List<dynamic>> allProducts() async {
    final url = Uri.parse(
      "http://192.168.156.248/dashboard/flutter_food_app/products/allProducts.php",
    );
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body);
        // print(data);
        return data;
      } else {
        throw Exception('failed to load data');
      }
    } catch (e) {
      print('Request Failed: $e');
    }
    throw Exception('failed to load data');
  }
}
