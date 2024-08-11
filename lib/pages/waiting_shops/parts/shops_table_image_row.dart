import 'package:flutter/material.dart';
import 'package:skar_super_admin/helpers/methods/image.dart';

class ShopsTableImageRow extends StatelessWidget {
  const ShopsTableImageRow({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: 100,
      padding: const EdgeInsets.all(5),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: showCachImageMethod(image),
    );
  }
}
