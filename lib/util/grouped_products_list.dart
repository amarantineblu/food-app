// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

// import '../models/product_model.dart';
import 'package:app_1/util/animated_container.dart';

class GroupedProductsList extends StatefulWidget {
  final List<Map<String, dynamic>>? items;
  const GroupedProductsList({super.key, required this.items});

  @override
  State<GroupedProductsList> createState() => _GroupedProductsListState();
}

class _GroupedProductsListState extends State<GroupedProductsList> {
  @override
  void initState() {
    super.initState();
    // print(widget.items);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // Text('${widget.items}', style: TextStyle(color: Colors.white)),
      child: MasonryGridView.builder(
        gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        mainAxisSpacing: 2.0,
        crossAxisSpacing: 2.0,
        itemCount: widget.items!.length,
        itemBuilder: (context, index) {
          final itemDetails = widget.items![index];
          // print(itemDetails);
          return HoverDetailBox(details: itemDetails);
        },
      ),
    );
  }
}
