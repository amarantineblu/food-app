// ignore_for_file: unused_import, unused_local_variable, depend_on_referenced_packages, avoid_print

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

// import 'package:json_annotation/json_annotation.dart';
// part 'users.g.dart';

// @JsonSerializable()

class Users {
  String fullName;
  String email;
  String phone;
  String password;

  Users({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.password,
  });

  // factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => {
    'name': fullName,
    'email': email,
    'phone': phone,
    'password': password,
  };

  saveUser() async {
    try {
      final url = Uri.parse(
        "http://192.168.188.76/dashboard/flutter_food_app/auth/register.php",
      );
      final response = await http.post(
        url,
        headers: {"Content-Type": 'application/json'},
        body: jsonEncode(toJson()),
      );

      response.statusCode == 200
          ? print('Response: ${response.body}')
          : print('Error: ${response.statusCode}');
      } catch (e) {
      print('Request Failed: $e');
      
    }
  }
}
