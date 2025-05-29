// ignore_for_file: unused_import, unused_local_variable, unnecessary_brace_in_string_interps, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Model {
  String? routeLocation;
  Map<String, dynamic>? requestBody;

  Model(String s, {this.routeLocation, this.requestBody});
  
  Future Function(dynamic routeLocation) routingLocation = (
    routeLocation,
  ) async {
    return routeLocation;
  };

  Future<void> save() async {
    try {
      final url = Uri.parse(
        "http://192.168.188.76/dashboard/flutter_food_app/products/addProduct.php",
      );
      final response = await http.post(
        url,
        headers: {"Content-Type": 'application/json'},
        body: jsonEncode(requestBody),
      );
    } catch (e) {
      print('Request Failed: $e');
    }
    print(
      ' the product details are Category: ${requestBody!['category']}, Name: ${requestBody!['name']}, Image: ${requestBody!['image']}, Description: ${requestBody!['description']}',
    );
  }
}
