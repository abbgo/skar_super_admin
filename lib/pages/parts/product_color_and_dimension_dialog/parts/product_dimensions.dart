import 'package:flutter/material.dart';

class ProductDimensions extends StatelessWidget {
  const ProductDimensions({super.key, required this.dimensions});

  final List<dynamic> dimensions;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.maxFinite,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: dimensions.length,
        itemBuilder: (context, indexDimension) => Text(
          dimensions[indexDimension],
        ),
      ),
    );
  }
}
