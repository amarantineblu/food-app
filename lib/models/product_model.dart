// ignore_for_file: unused_import, no_leading_underscores_for_local_identifiers, unnecessary_overrides, empty_constructor_bodies

import 'package:app_1/tools/model.dart';
import 'package:flutter/material.dart';

class Product extends Model {
  String name;
  String image;
  String category;
  String description;

  final dynamic key;

  Product({
    this.key,
    required this.category,
    required this.description,
    required this.image,
    required this.name,
  }) : super('');
  @override
  set routingLocation(
    Future Function(dynamic routeLocation) _routingLocation,
  ) => super.routingLocation = _routingLocation;

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      image: json['image'],
      description: json['description'],
      category: json['category'],
    );
  }
}
