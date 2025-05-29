// ignore_for_file: avoid_print, depend_on_referenced_packages, avoid_returning_null_for_void, empty_statements, no_leading_underscores_for_local_identifiers, unused_local_variable

// import 'dart:io';
import 'dart:convert';
// import 'dart:io';
import 'dart:typed_data';

import 'package:app_1/controllers/product_controller.dart';
// import 'package:app_1/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../util/consts.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart';

class AddFoodPage extends StatefulWidget {
  const AddFoodPage({super.key});

  @override
  State<AddFoodPage> createState() => _AddFoodPageState();
}

class _AddFoodPageState extends State<AddFoodPage> {
  final _formKey = GlobalKey<FormState>();
  String? selectedValue;
  // File? _selectedImage;
  Uint8List? _imageBytes;

  final TextEditingController _foodName = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final ProductController _productController = ProductController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Add Food',
                    style: TextStyle(color: Colors.white, fontSize: 25.0),
                  ),
                  TextFormField(
                    controller: _foodName,
                    validator: (value) {
                      if (value == null) {
                        return 'Please Enter a Product Name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Add Food Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              pickImage();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                // border: Border.all(color: Colors.grey, width: 1.0),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    'Add Food Image',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Expanded(child: Icon(Icons.image)),
                                ],
                              ),
                            ),
                          ),
                        ),

                        Expanded(
                          child: DropdownButtonFormField(
                            value: selectedValue,
                            items:
                                foodCategories
                                    .map(
                                      (foodCategory) => DropdownMenuItem(
                                        value: foodCategory,
                                        child: Text(foodCategory),
                                      ),
                                    )
                                    .toList(),
                            decoration: InputDecoration(
                              label: Text('Select Category'),
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value;
                              });
                              // print(value)
                            },
                            validator: (value) {
                              if (value == null) {
                                return 'Please select one of the Above';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  _imageBytes != null
                      ? Image.memory(_imageBytes!, height: 200)
                      : Text('Please Select an Image'),
                  TextFormField(
                    controller: _description,
                    maxLines: 5,
                    validator: (value) {
                      if (value == null) {
                        return 'Please Enter a Product Name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Description',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        formDetails();
                      });
                      _formKey.currentState!.reset();
                    },
                    child: Text('Add Product'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future pickImage() async {
    final XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    final bytes = await pickedFile!.readAsBytes();
    setState(() {
      _imageBytes = bytes;
    });
  }

  Future<void> formDetails() async {
    if (_formKey.currentState!.validate()) {
      // _formKey.currentState.
      var request = {
        'category': selectedValue!,
        'description': _description.text,
        'image': jsonEncode(base64Encode(_imageBytes!)),
        'name': _foodName.text,
      };
      await _productController.saveProduct(request);
    }
  }
}
