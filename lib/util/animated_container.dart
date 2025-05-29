// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, sized_box_for_whitespace, empty_constructor_bodies, unused_field, unused_local_variable, prefer_typing_uninitialized_variables, unnecessary_null_comparison, unnecessary_question_mark, unnecessary_cast, use_function_type_syntax_for_parameters, avoid_print, use_super_parameters

import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

class HoverDetailBox extends StatefulWidget {
  final Map<String, dynamic> details;
  const HoverDetailBox({Key? key, required this.details}) : super(key: key);

  @override
  _HoverDetailBoxState createState() => _HoverDetailBoxState();
}

class _HoverDetailBoxState extends State<HoverDetailBox> {
  bool _isHovered = false;
  // late Map<String, dynamic> details;
  @override
  void initState() {
    super.initState();
    // print('My Passed Data is: ${widget.details['image']}');
  }

  late final String indexImage = widget.details['image'];

  Uint8List? decodeBase64Image(String rawString) {
    try {
      // Step 1: Remove brackets/quotes if present
      String str = rawString.trim();
      if (str.startsWith('[') && str.endsWith(']')) {
        str = str.substring(1, str.length - 1);
      }
      if (str.startsWith('"') && str.endsWith('"')) {
        str = str.substring(1, str.length - 1);
      }

      // Step 2: Remove base64 prefix if present
      if (str.contains(',')) {
        str = str.split(',').last;
      }

      // Step 3: Remove whitespaces
      str = str.replaceAll(RegExp(r'\s+'), '');

      // Step 4: Fix padding
      final pad = str.length % 4;
      if (pad > 0) {
        str += '=' * (4 - pad);
      }

      // Step 5: Remove BOM if present
      if (str.codeUnitAt(0) == 0xFEFF || str.codeUnitAt(0) == 0xFFFE) {
        str = str.substring(1);
      }
      return base64Decode(str);
    } catch (e) {
      // print('Error : ${e.toString()}');
      return null;
    }
  }

  late Uint8List? image = decodeBase64Image(indexImage);
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),

      child: SizedBox(
        height: image == null ? 300 : null,
        child: LayoutBuilder(
          builder: (context, constraints) {
            // print(constraints.minHeight);
            // double fallbackHeight = MediaQuery.of(context).size.height;
            // double availableHeight =
            //     constraints.maxHeight.isFinite
            //         ? constraints.maxHeight
            //         : fallbackHeight;
            // double halfHeight = availableHeight * .5;
            double halfHeight = constraints.maxHeight * .5;

            return Stack(
              // fit: StackFit,
              clipBehavior: Clip.none,
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  width: image == null ? 200 : null,
                  // width: 200,
                  height: image == null ? 300 : null,

                  decoration: BoxDecoration(
                    color: _isHovered ? Colors.blueAccent : Colors.blue,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow:
                        _isHovered
                            ? [BoxShadow(color: Colors.black26, blurRadius: 10)]
                            : null,
                  ),
                  child:
                      image != null
                          ? Image.memory(image as Uint8List)
                          : Icon(Icons.image_not_supported_outlined),
                ),

                if (_isHovered)
                  Positioned(
                    // top: .5,
                    height: image == null ? halfHeight : null,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 150,
                      padding: const EdgeInsets.all(10),
                      color: Colors.blueAccent,
                      child: AnimatedOpacity(
                        duration: Duration(milliseconds: 300),
                        opacity: _isHovered ? 1.0 : 0.0,
                        child: Visibility(
                          visible: _isHovered,
                          child: Container(
                            margin: EdgeInsets.only(top: 8),
                            padding: EdgeInsets.all(12),
                            width: 180,

                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(color: Colors.black12, blurRadius: 8),
                              ],
                            ),
                            child: Text(
                              '${widget.details['description']}',
                              style: TextStyle(color: Colors.black87),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
